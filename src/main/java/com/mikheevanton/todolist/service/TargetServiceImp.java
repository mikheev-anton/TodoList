package com.mikheevanton.todolist.service;

import com.mikheevanton.todolist.entity.Target;
import com.mikheevanton.todolist.repository.TargetRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class TargetServiceImp implements TargetService {

    @Autowired
    private TargetRepository repository;

    public List<Target> getAll() {
        List<Target> targets = repository.findAll();
        Collections.sort(targets);
        return targets;
    }

    public Target getById(int id) {
        return repository.findOne(id);
    }

    public Target save(Target target) {
        return repository.saveAndFlush(target);
    }

    public void delete(int id) {
        repository.delete(id);
    }

    public List<Target> sort(int status){
        List<Target> targets = new ArrayList<Target>();
        for (Target target : getAll()){
            if (target.getStatus()==status){
                targets.add(target);
            }
        }
        return targets;
    }
}
