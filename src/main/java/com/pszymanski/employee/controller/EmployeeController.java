package com.pszymanski.employee.controller;

import com.pszymanski.employee.model.Employee;
import com.pszymanski.employee.model.EmployeeStatus;
import com.pszymanski.employee.service.impl.EmployeeServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EmployeeController {

    @Autowired
    private EmployeeServiceImpl employeeService;

    @RequestMapping(value = "/employees", method = RequestMethod.GET)
    public String getEmployeesPage(Model model) {

        model.addAttribute("employeeList", employeeService.findAll());

        return "employees";
    }


    @RequestMapping(value = "/employee-add", method = RequestMethod.GET)
    public String addEmployee(Model model) {

        model.addAttribute("employee", new Employee());
        model.addAttribute("employeeStatusList", EmployeeStatus.values());

        return "employee-add";
    }

    @RequestMapping(value = "/employee-add/save", method = RequestMethod.POST)
    public String saveEmployee(@ModelAttribute Employee employee, BindingResult result) {

        if (result.hasErrors()) {
            return "employee-add";
        }

        employeeService.save(employee);

        return "redirect:/employees";
    }

    @RequestMapping(value = "/employee-add/cancel", method = RequestMethod.GET)
    public String cancel() {

        return "redirect:/employees";
    }

    @RequestMapping(value = "/employee/edit/{id}", method = RequestMethod.GET)
    public String editEmployee(@PathVariable Long id, Model model) {

        model.addAttribute("employee", employeeService.findOne(id));
        model.addAttribute("employeeStatusList", EmployeeStatus.values());
        return "employee-add";
    }

    @RequestMapping(value = "/employee/delete/{id}", method = RequestMethod.POST)
    public String deleteEmployee(@PathVariable Long id) {

        employeeService.delete(id);
        return "redirect:/employees";
    }

}
