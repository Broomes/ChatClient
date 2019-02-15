package net.broomes.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ChatController {

    @GetMapping("/")
    public String index(){
        return "index";
    }

    @GetMapping("chatroom")
    public String chatroom(@RequestParam String user,
                           @RequestParam String room,
                           Model model){
        model.addAttribute("sender", user);
        model.addAttribute("room", room);
        return "chatroom";
    }
}
