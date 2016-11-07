package usjobs.model.dao;

import java.util.List;

import usjobs.model.User;

public interface UserDao {

	User getUser( Integer id );
	
	User getUser( String username );
	
	User getProfileUser( String username);
	
	List<User> getUsers();
	
	List<User> searchUsers(String searchTerm, String searchLoc);
	
	List<User> searchSeekers(String searchTerm, String searchLoc);
	
	User saveUser( User user );
	
	User saveProfileUser( User user );
	
	int updateUserType(User user);
	
	List<User> getJobSeekers();
}
