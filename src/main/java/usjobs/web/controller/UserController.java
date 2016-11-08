package usjobs.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import usjobs.web.validator.UserValidator;
import usjobs.model.User;
import usjobs.model.dao.UserDao;

@Controller
@SessionAttributes("user")
public class UserController {

//    private Logger logger = Logger.getLogger( UserController.class );

    @Autowired
    private UserDao userDao;

    @Autowired
    private UserValidator userValidator;

    @RequestMapping("/user/list.html")
    public String list( ModelMap models ) {

        // Get all users from database and pass them to JSP
        List<User> users = userDao.getUsers();

        models.put( "users", users );

        return "user/list";
    }

    @RequestMapping("/user/view/{id}.html")
    public String view( @PathVariable Integer id, ModelMap models ) {

        // Get user from database and pass it to JSP
        models.put( "user", userDao.getUser( id ) );

        return "user/view";
    }

    // Using Model Attribute to bind fields
    @RequestMapping(value = "/user/add.html", method = RequestMethod.GET)
    public String add( ModelMap models ) {

        // Create a new user
        models.put( "user", new User() );

        return "user/add";
    }

    @RequestMapping(value = "/user/add.html", method = RequestMethod.POST)
    public String add( @ModelAttribute User user, BindingResult result,
        SessionStatus status ) {

        // Validate user's input
        userValidator.validate( user, result );

        if( result.hasErrors() ) {

            return "user/add"; 
        }

        // Allow admin user to add other admin users
        user.getUserRoles().add( "ROLE_ADMIN" );

        // Save the user to database
        user = userDao.saveUser( user );

        // Remove all the session attributes when done
        status.setComplete();

        // Redirect to user list
        return "redirect:list.html";
    }

    @RequestMapping(value = "/user/edit.html", method = RequestMethod.GET)
    public String edit( @RequestParam Integer id, ModelMap models ) {

        models.put( "user", userDao.getUser( id ) );

        return "user/edit";
    }

    @RequestMapping(value = "/user/edit.html", method = RequestMethod.POST)
    public String edit( @ModelAttribute User user, SessionStatus status ) {

        // Save the user to database
        user = userDao.saveUser( user );
        userDao.updateUserType( user ); // update user type since postgres
                                        // default it to ADMIN even if seeker or
                                        // employer.
        // Remove all the session attributes when done
        status.setComplete();

        // Redirect to user list
        return "redirect:list.html";
    }

    @RequestMapping(value = "/user/disable.html", method = RequestMethod.GET)
    public String disable( @RequestParam Integer id, ModelMap models ) {

        // Disable the user
        userDao.getUser( id ).setEnabled( false );

        // Save the user to database
        userDao.saveUser( userDao.getUser( id ) );

        // Get all users from database and pass them to JSP
        List<User> users = userDao.getUsers();

        models.put( "users", users );

        return "user/list";
    }

    @RequestMapping(value = "/user/enable.html", method = RequestMethod.GET)
    public String enable( @RequestParam Integer id, ModelMap models ) {

        // Disable the user
        userDao.getUser( id ).setEnabled( true );

        // Save the user to database
        userDao.saveUser( userDao.getUser( id ) );

        // Get all users from database and pass them to JSP
        List<User> users = userDao.getUsers();

        models.put( "users", users );

        return "user/list";
    }

    @RequestMapping(value = "/register.html", method = RequestMethod.GET)
    public String register( ModelMap models ) {

        // Create a new user
        models.put( "user", new User() );

        return "register";
    }

    @RequestMapping(value = "/register.html", method = RequestMethod.POST)
    public String register( @ModelAttribute("user") User user,
        BindingResult result, SessionStatus status ) {

        // Validate user's input
        userValidator.validate( user, result );

        if( result.hasErrors() ) {

            return "register"; 
        }

        // Save the user to database
        user = userDao.saveUser( user );

        userDao.updateUserType( user ); // update user type since postgres
                                        // default it to ADMIN even if seeker or
                                        // employer.
        // Remove all the session attributes when done
        status.setComplete();

        return "redirect:login.html";
    }
    
}
