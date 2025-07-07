package com.example.ormlearn.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.ormlearn.entity.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Integer> {
}
