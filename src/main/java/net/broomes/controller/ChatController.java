package net.broomes.controller;

import net.broomes.model.UserRegistration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChatController {

//    Need to attach model to index for new user registration form
    @GetMapping("/")
    public ModelAndView index(@ModelAttribute("user") UserRegistration user){
        return new ModelAndView("index", "user", new UserRegistration());
    }

    @GetMapping("main")
    public String main(){
        return "main";
    }

    @GetMapping("chatroom")
    public String chatroom(@RequestParam String room, Model model){
        model.addAttribute("room", room);
        return "chatroom";
    }
}
