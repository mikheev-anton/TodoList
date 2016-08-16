package com.mikheevanton.todolist.service;


import com.mikheevanton.todolist.entity.Target;

import java.util.List;

public interface TargetService {

    List<Target> getAll();
    Target getById(int id);
    Target save(Target target);
    void delete(int id);
    List<Target> sort(int status);
}
