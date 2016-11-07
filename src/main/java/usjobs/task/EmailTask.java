package usjobs.task;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import usjobs.model.JobSeeker;
import usjobs.model.User;
import usjobs.model.dao.JobPostingDao;
import usjobs.model.dao.UserDao;

@Component
public class EmailTask {
	
	private static final Logger logger = Logger.getLogger(EmailTask.class);

    @Autowired
    private MailSender mailSender;
    
    @Autowired
    private UserDao userDao;
    
    @Autowired
    private JobPostingDao jobPostingDao;
    
    /* After application start-up, once 1 second has elapsed, this task checks
    job postings that were posted within the last 24-hours and sees if it matches with
    the keyword preferences of each user. for each user where there's a match, send an email to that
    user with a list of all the job postings that match their query.
    */
    @Scheduled(initialDelay=1000, fixedDelay=86400000)
    public void checkNewPostings() {
    	List<User> jobSeekers = userDao.getJobSeekers();
    	
    	for (User user : jobSeekers) {
    		JobSeeker seeker = (JobSeeker) user;
    		if (seeker.isNotified() && !StringUtils.isEmpty(seeker.getKeywords())) {
    			logger.info(seeker.getKeywords());
    		}
    	}
    }
    
    // Sending an email every minute
//  @Scheduled(cron = "0 * * * * *")
  public void sendMail() {
      
      SimpleMailMessage msg = new SimpleMailMessage();
      
      String from = "USJobs@usjobs.com";
      String subject = "New Job Listings";
      String content = "There are new job postings on US Jobs that you may be"
          + " interested in. Please go to US Jobs website to view these jobs."
          + " Thank you and have a wonderful day!";
      String to = "jobseeker@localhost.localdomain";
      
      msg.setFrom( from );
      msg.setTo( to );
      msg.setSubject( subject );
      msg.setText( content );
      
      mailSender.send( msg );
      
      // Print to console
      logger.info( "An email has been sent by the system." );
  }
}
