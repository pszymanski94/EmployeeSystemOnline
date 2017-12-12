package com.pszymanski.employee.controller;

import com.pszymanski.employee.model.Priority;
import com.pszymanski.employee.model.Task;
import com.pszymanski.employee.service.impl.TaskServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TasksController {

    @Autowired
    private TaskServiceImpl taskService;

    @RequestMapping(value = "/admin/tasks", method = RequestMethod.GET)
    public String getTaskPage(Model model) {

        model.addAttribute("TasksList", taskService.findAll());

        return "tasks";
    }


    @RequestMapping(value = "/admin/task-add", method = RequestMethod.GET)
    public String addTask(Model model) {

        model.addAttribute("task", new Task());
        model.addAttribute("taskPriorityList", Priority.values());

        return "task-add";
    }

    @RequestMapping(value = "/admin/task-add/save", method = RequestMethod.POST)
    public String saveTask(@ModelAttribute Task task, BindingResult result) {

        if (result.hasErrors()) {
            return "task-add";
        }

        taskService.save(task);

        return "redirect:/admin/tasks";
    }

    @RequestMapping(value = "/admin/task-add/cancel", method = RequestMethod.GET)
    public String cancel() {

        return "redirect:/admin/tasks";
    }

    @RequestMapping(value = "/admin/task/edit/{id}", method = RequestMethod.GET)
    public String editTask(@PathVariable Long id, Model model) {

        model.addAttribute("task", taskService.findOne(id));
        model.addAttribute("taskPriorityList", Priority.values());
        return "task-add";
    }

    @RequestMapping(value = "/admin/todo/delete/{id}", method = RequestMethod.GET)
    public String deleteTask(@PathVariable Long id) {

        taskService.delete(id);
        return "redirect:/admin/tasks";
    }
}
