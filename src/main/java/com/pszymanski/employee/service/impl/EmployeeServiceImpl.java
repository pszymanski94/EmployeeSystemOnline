package com.pszymanski.employee.service.impl;

import com.pszymanski.employee.model.Employee;
import com.pszymanski.employee.repository.EmployeeRepository;
import com.pszymanski.employee.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeRepository employeeRepository;

    public List<Employee> findAll() {
        return employeeRepository.findAll();
    }

    public Employee findOne(Long id) {
        return employeeRepository.findOne(id);
    }

    public void save(Employee object) {
        employeeRepository.save(object);
    }

    public void delete(Long id) {
        employeeRepository.delete(id);
    }

}
