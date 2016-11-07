package usjobs.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Type;

@Entity
@DiscriminatorValue("SEEKER")
public class JobSeeker extends User implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@OneToMany(mappedBy = "seeker", cascade = {CascadeType.PERSIST, CascadeType.MERGE})
	private List<Application> applications;

	//jobs applied to
	@ManyToMany(mappedBy = "usersApplied", cascade = {CascadeType.PERSIST, CascadeType.MERGE})
	private List<JobPosting> appliedJobs;

	@ManyToMany(mappedBy = "usersFavorited", cascade = {CascadeType.PERSIST, CascadeType.MERGE})
	private List<JobPosting> favoritedJobs;
	
	@OneToMany(mappedBy = "user", cascade = {CascadeType.PERSIST, CascadeType.MERGE})
	private List<Resume> resumes;

	@Type(type = "text")
	private String experience;

	@OneToMany(mappedBy = "user", cascade = {CascadeType.PERSIST, CascadeType.MERGE})
	private List<Degree> degrees;

	@Column(name = "current_job_title")
	private String currentJobTitle;

	@OneToMany(mappedBy = "userPosted", cascade = {CascadeType.PERSIST, CascadeType.MERGE})
	private List<JobReview> jobsReviewed;

	@OneToMany(mappedBy = "userPosted", cascade = {CascadeType.PERSIST, CascadeType.MERGE})
	private List<EmployerReview> employersReviewed;
	
    /* indicates if job seeker should be notified of new, relevant job listings. */
    @Column(name = "is_notified")
    private boolean notified;
    
    /* For job seeker, keywords is a comma-separated string*/
    private String keywords; 
    

	public List<JobPosting> getAppliedJobs() {
		return appliedJobs;
	}

	public void setAppliedJobs(List<JobPosting> appliedJobs) {
		this.appliedJobs = appliedJobs;
	}
	
	public List<JobPosting> getFavoritedJobs() {
		return favoritedJobs;
	}

	public void setFavoritedJobs(List<JobPosting> favoritedJobs) {
		this.favoritedJobs = favoritedJobs;
	}

	public List<Resume> getResumes() {
		return resumes;
	}

	public void setResumes(List<Resume> resumes) {
		this.resumes = resumes;
	}

	public List<Degree> getDegrees() {
		return degrees;
	}

	public void setDegrees(List<Degree> degrees) {
		this.degrees = degrees;
	}

	public String getExperience() {
		return experience;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

	public String getCurrentJobTitle() {
		return currentJobTitle;
	}

	public void setCurrentJobTitle(String currentJobTitle) {
		this.currentJobTitle = currentJobTitle;
	}

	public List<JobReview> getJobsReviewed() {
		return jobsReviewed;
	}

	public void setJobsReviewed(List<JobReview> jobsReviewed) {
		this.jobsReviewed = jobsReviewed;
	}

	public List<EmployerReview> getEmployersReviewed() {
		return employersReviewed;
	}

	public void setEmployersReviewed(List<EmployerReview> employersReviewed) {
		this.employersReviewed = employersReviewed;
	}

	public List<Application> getApplications() {
		return applications;
	}

	public void setApplications(List<Application> applications) {
		this.applications = applications;
	}

	
	public boolean isNotified() {
		return notified;
	}

	public void setNotified(boolean notified) {
		this.notified = notified;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	
	
}
