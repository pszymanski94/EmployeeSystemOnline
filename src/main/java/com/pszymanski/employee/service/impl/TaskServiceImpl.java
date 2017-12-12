package com.pszymanski.employee.service.impl;

import com.pszymanski.employee.model.Task;
import com.pszymanski.employee.repository.TaskRepository;
import com.pszymanski.employee.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaskServiceImpl implements TaskService {

    @Autowired
    private TaskRepository taskRepository;

    public List<Task> findAll() {
        return taskRepository.findAll();
    }

    public Task findOne(Long id) {
        return taskRepository.findOne(id);
    }

    public void save(Task object) {
        taskRepository.save(object);
    }

    public void delete(Long id) {
        taskRepository.delete(id);}
}
