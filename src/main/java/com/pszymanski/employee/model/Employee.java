package com.pszymanski.employee.model;

import javax.persistence.*;

@Entity
@Table(name = "employee")
public class Employee extends BaseEntity {
    @Column(name = "name", nullable = false, length = 25)
    private String name;

    @Column(name = "subname", nullable = false, length = 45)
    private String subname;

    @Column(name = "date_of_birth", nullable = false, length = 20)
    private String date_of_birth;

    @Column(name = "street", nullable = false, length = 45)
    private String street;

    @Column(name = "city", nullable = false, length = 30)
    private String city;

    @Column(name = "status", nullable = false, length = 20)
    private String status;


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSubname() {
        return subname;
    }

    public void setSubname(String subname) {
        this.subname = subname;
    }

    public String getDate_of_birth() {
        return date_of_birth;
    }

    public void setDate_of_birth(String date_of_birth) {
        this.date_of_birth = date_of_birth;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
