package net.broomes.controller;

import net.broomes.model.UserRegistration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class LoginController {

    @Autowired
    JdbcUserDetailsManager jdbcUserDetailsManager;

    @GetMapping("/LoginPage")
    public String loginPage(){
        return "login-form";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String processRegister(@ModelAttribute("user") UserRegistration userRegistrationObject, HttpServletRequest request) {

        // authorities to be granted
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        authorities.add(new SimpleGrantedAuthority("ROLE_USER"));

        if(jdbcUserDetailsManager.userExists(userRegistrationObject.getUsername())){
            request.setAttribute("registered", false);
            return "index";
        }
        else{
            User user = new User(userRegistrationObject.getUsername(), userRegistrationObject.getPassword(), authorities);
            jdbcUserDetailsManager.createUser(user);
            request.setAttribute("registered", true);
            return "index";
        }
    }
}
