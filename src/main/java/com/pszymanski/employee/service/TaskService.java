package com.pszymanski.employee.service;

import com.pszymanski.employee.model.Task;

import java.util.List;

public interface TaskService {
    List<Task> findAll();

    Task findOne(Long id);

    void save(Task object);

    void delete(Long id);
}
