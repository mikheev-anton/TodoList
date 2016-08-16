package com.mikheevanton.todolist.repository;


import com.mikheevanton.todolist.entity.Target;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TargetRepository extends JpaRepository<Target, Integer> {
}
