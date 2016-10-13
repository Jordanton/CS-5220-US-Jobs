package usjobs.model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorValue;
import javax.persistence.ElementCollection;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;

@Entity
@Table(name = "users")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "user_type")
@DiscriminatorValue("ADMIN")
public class User implements Serializable {

	private static final long serialVersionUID = 1L;
	
	public User() {
		
	}
	
	@Id
	@Column(name = "user_id")
	@GeneratedValue
	private Integer id;

	//login info
	@Column(unique = true, nullable = false)
	private String username;

	@Column(nullable = false)
	private String password;

	@Column(nullable = false)
	private boolean enabled = true;

	private boolean reported;
	
	@Column(name = "admin")
	private boolean isAdmin;

	@Column(name = "supress_contact")
	private boolean supressContact;

	private String email;

	@ElementCollection
	@CollectionTable(
		name = "user_roles",
		joinColumns = @JoinColumn(name = "user_id")
	)
	@Column(name = "role")
	private List<String> userRoles;

	@Column(name = "first_name")
	private String firstName;

	@Column(name = "last_name")
	private String lastName;
	
	@Embedded
	private Address address;
	
	@ElementCollection
	@CollectionTable(
		name = "user_phones",
		joinColumns = @JoinColumn(name = "user_id")
	)
	@Column(name = "phone")
	@OrderBy("phone asc")
	private List<String> phones;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	


	public List<String> getUserRoles() {
		return userRoles;
	}

	public void setUserRoles(List<String> userRoles) {
		this.userRoles = userRoles;
	}

	public boolean isReported() {
		return reported;
	}

	public void setReported(boolean reported) {
		this.reported = reported;
	}

	public boolean isSupressContact() {
		return supressContact;
	}

	public void setSupressContact(boolean supressContact) {
		this.supressContact = supressContact;
	}

	public boolean isAdmin() {
		return isAdmin;
	}

	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public List<String> getPhones() {
		return phones;
	}

	public void setPhones(List<String> phones) {
		this.phones = phones;
	}	


}
