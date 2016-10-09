# CS-5220-US-Jobs

## Build the front-end packages
* Install node: [https://nodejs.org/en/] ([https://nodejs.org/en/])
* cd into this project's root directory
* `npm install --only=dev`
* `npm install -g bower` (mac users prefix this command with `sudo`)
* `npm install -g grunt-cli` (mac/linux user prefix this command with `sudo`)
* `bower install`
* `grunt bower_concat`

## Overview
The reason we chose this project is because it will be useful to all college students and job seekers.  We all go to college in the hopes of landing good and high-paying jobs.  Unfortunately, there are too many job websites out there such as Monster and CareerBuilder that mostly contain employment agencies’ listings designed to pool for candidates instead of bonafide employers listing real job openings.  There are just too many unemployed recent college grads.  Therefore, we want to create a website where recent college grads and college students can easily connect with bonafide employers with legit job openings without jumping through hoops.
 
### Functions
 * Display U.S. Jobs Homepage where users can either register or log in
 * Without having an account, users can view hot job listings but will need to register to progress further
 * Users can choose whether to register as an employer or a job seeker
 * Once logged in, employers and job seekers will be shown different pages and have different functionalities as described below.
 
### Both employers and job seekers will be able to:
 * Update/View profiles
 * Change passwords
 * Employers will be able to:
 * Add new jobs
 * Edit job listings
 * Delete job listings
 * Search for resumes
 * Search for candidates based on education level and experience
 * Choose application methods such as using the built-in application template or redirect to companies’ websites to apply
 * Suppress contact information
 * Report job seekers for violating the terms of use
 
### Job seekers will be able to:
 * Upload resumes
 * PDF/doc/docx
 * Remove resumes
 * View job listings
 * Add favorite job listings
 * Search job listings for specific titles or salaries or company names or locations
 * Apply for jobs
 * Once a job seeker applies for a job, the job will appear as “Already Applied”
 * Jobs applied to will be saved so that the job seeker can view job descriptions again if granted interviews
 * Review job listings for accuracy and whether it is legitimate
 * Report employers for violating the terms of use



