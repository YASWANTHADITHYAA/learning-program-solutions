package com.example.ormlearn.service;

import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.ormlearn.entity.Employee;
import com.example.ormlearn.repository.EmployeeRepository;

@Service
public class EmployeeService {
    @Autowired
    private EmployeeRepository repo;

    @PostConstruct
    public void init() {
        repo.save(new Employee(1, "Alice"));
        repo.save(new Employee(2, "Bob"));

        System.out.println("All Employees:");
        repo.findAll().forEach(e -> System.out.println(e.getId() + ": " + e.getName()));
    }
}
