package usjobs.web.controller;

import java.io.File;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import usjobs.model.Address;
import usjobs.model.Application;
import usjobs.model.Employer;
import usjobs.model.JobPosting;
import usjobs.model.JobSeeker;
import usjobs.model.Resume;
import usjobs.model.User;
import usjobs.model.dao.ApplicationDao;
import usjobs.model.dao.JobPostingDao;
import usjobs.model.dao.ResumeDao;
import usjobs.model.dao.UserDao;
import usjobs.util.Security;

@Controller
@SessionAttributes({"newJob", "editJob", "user"})
public class ProfileController {
	
	Logger logger = Logger.getLogger(ProfileController.class);
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	JobPostingDao jobPostingDao;
	
	@Autowired
	ApplicationDao applicationDao;
	
    /**
     * Return the correct profile page for the user depending on if they are
     * an employer, seeker, or admin.
     * @return
     */
    @RequestMapping(value = "/user/profile.html", method = RequestMethod.GET)
    public String getProfile(ModelMap models) {
    	UserDetails details = Security.getUserDetails();
    	User user = userDao.getProfileUser(details.getUsername());
    	models.put("user", user);
    	
    	if (user.isAdmin()) {
    		return "profile/admin";
    	}
    	
    	if (user.isEmployer()) {
    		JobPosting newJob = new JobPosting();
    		newJob.setCompany((Employer) user);
    		models.put("newJob", newJob);
    		return "profile/employer";
    	}
    	
    	if (user.isSeeker()){
    		models.put("user", (JobSeeker) user);
    		return "profile/job-seeker";
    	}
    	
    	//This would protect against some db insertion? mistake that caused this authenticated user to have no role at all.
    	//then just redirect them to home page.
    	return "home.html";
    }
    
    @RequestMapping(value = "/user/editProfile.html", method = RequestMethod.POST)
    public String editProfile(@RequestParam String password, @RequestParam String email, 
    		@RequestParam String street, @RequestParam String city, @RequestParam String state,
    		@RequestParam String zip, @RequestParam String supress
    		) {
    	
    	Address address = new Address(street, city, state, zip);
    	UserDetails details = Security.getUserDetails();
    	User user = userDao.getProfileUser(details.getUsername());
    	
    	user.setPassword(password);
    	user.setEmail(email);
    	user.setAddress(address);
    	user.setSupressContact(Boolean.parseBoolean(supress));
    	
    	userDao.saveProfileUser(user);
    
    	//This would protect against some db insertion? mistake that caused this authenticated user to have no role at all.
    	//then just redirect them to home page.
    	return "redirect:profile.html";
    }
    
	@RequestMapping(value = "/user/addJob.html", method = RequestMethod.POST)
	public String addJob(@RequestParam int employerId, @ModelAttribute("newJob") JobPosting newJob, SessionStatus session) {
		Date date = new Date();
		newJob.setDatePosted(date);
		newJob.setEnabled(true);
		newJob.setOpened(true);
		jobPostingDao.save(newJob);
		session.setComplete();
		return "redirect:profile.html?id=" + employerId;
	}

	@RequestMapping(value = "/user/deleteJob.html", method = RequestMethod.GET)
	public String deleteJob(@RequestParam int employerId, @RequestParam int jobId) {
		JobPosting jobPosting = jobPostingDao.getJobPosting(jobId);
		List<Application> applications = applicationDao.getJobApplications(jobId);
		for (Application app : applications) {
			app.setJobApplied(null); //since job is being deleted, app should no longer reference that job
			applicationDao.saveApplication(app);
		}
		jobPostingDao.delete(jobPosting);
		return "redirect:profile.html?id=" + employerId;
	}
	
	@RequestMapping(value = "/user/toggleJob.html", method = RequestMethod.GET)
	public String toggleJob(@RequestParam int employerId, @RequestParam int jobId) {
		JobPosting jobPosting = jobPostingDao.getJobPosting(jobId);
		boolean isOpened = jobPosting.isOpened();
		if (isOpened) {
			jobPosting.setDateClosed(new Date());
		} else {
			jobPosting.setDatePosted(new Date());
		}
		jobPosting.setOpened(!isOpened);
		jobPostingDao.save(jobPosting);
		return "redirect:profile.html?id=" + employerId;
	}

	@RequestMapping(value = "/user/editJob.html", method = RequestMethod.GET)
	public String editJobForm(@RequestParam int employerId, @RequestParam int jobId, ModelMap models) {
		models.put("editJob", jobPostingDao.getJobPosting(jobId));
		return "job/edit";
	}

	@RequestMapping(value = "/user/editJob.html", method = RequestMethod.POST)
	public String editJobForm(@RequestParam int employerId, @ModelAttribute("editJob") JobPosting editJob, SessionStatus sessionStatus) {
		jobPostingDao.save(editJob);
		sessionStatus.setComplete();
		return "redirect:profile.html?id=" + employerId;
	}
		
	@RequestMapping(value = "/user/editNotifications.html", method = RequestMethod.POST)
	public String editJobForm(@RequestParam String notify, @RequestParam String keywords) {
		
		UserDetails details = Security.getUserDetails();
    	JobSeeker seeker = (JobSeeker) userDao.getProfileUser(details.getUsername());
    	seeker.setNotified(Boolean.parseBoolean(notify));
    	seeker.setKeywords(keywords);
    	userDao.saveProfileUser(seeker);
		return "redirect:profile.html?id=" + seeker.getId();
	}
	
}
