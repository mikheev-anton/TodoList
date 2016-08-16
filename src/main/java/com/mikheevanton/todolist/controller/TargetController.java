package com.mikheevanton.todolist.controller;

import com.mikheevanton.todolist.entity.Target;
import com.mikheevanton.todolist.service.TargetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.io.*;


@Controller
public class TargetController {

    private static final int NOT_DONE_STATUS = 0;
    private static final int DONE_STATUS = 1;
    private int id = 0;

    @Autowired
    private TargetService service;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String printMainPage(ModelMap model) {

        model.addAttribute("getAll", service.getAll());

        return "main";
    }

    @RequestMapping(value = "/save", method = RequestMethod.GET)
    public String printSavePage(ModelMap model){
        return "save";
    }


    /*
    1) Не получилось заставит spring достать id
    из формы перед вызовом getNewTarget() метода,  поэтому добавил в класс переменную id
    2) Не получилось поменять кодировку получаемых данных из формы, поэтому написал подобный костыль
    */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addTarget(@ModelAttribute("target") Target target){

        if (id !=0) {
            target.setId(id);
            id=0;
        }

        try {
            target.setTitle(new String(target.getTitle().getBytes("ISO-8859-1"),"UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        target.setStatus(NOT_DONE_STATUS);

        service.save(target);

        return "redirect:/";
    }

    @ModelAttribute("target")
    public Target getNewTarget() {
        return new Target();
    }

    @RequestMapping(value = "/edit/{id}")
    public String editTarget(@PathVariable("id") int id, ModelMap model) {

        model.addAttribute("target", service.getById(id));

        this.id=id;

        return "save";
    }

    @RequestMapping(value = "/remove/{id}")
    public String removeTarget(@PathVariable("id") int id) {

        service.delete(id);

        return "redirect:/";
    }

    @RequestMapping(value = "/done/{id}")
    public String changeStatus(@PathVariable("id") int id){

        Target target = service.getById(id);

        target.setStatus(DONE_STATUS);

        service.save(target);

        return "redirect:/";
    }

    @RequestMapping(value = "sort/{status}", method = RequestMethod.GET)
    public String sort(@PathVariable("status") int status, ModelMap model) {

        model.addAttribute("getAll", service.sort(status));

        return "main";
    }
}
