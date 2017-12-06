package com.pszymanski.employee.service;

import com.pszymanski.employee.model.Employee;

import java.util.List;

public interface EmployeeService {

    List<Employee> findAll();

    Employee findOne(Long id);

    void save(Employee object);

    void delete(Long id);


}
