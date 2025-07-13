package com.cognizant.springlearn;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Country {
    private String code;
    private String name;

    public Country() {
        Logger logger = LoggerFactory.getLogger(Country.class);
        logger.debug("Inside Country Constructor.");
    }

    public String getCode() {
        Logger logger = LoggerFactory.getLogger(Country.class);
        logger.debug("Inside getCode");
        return code;
    }

    public void setCode(String code) {
        Logger logger = LoggerFactory.getLogger(Country.class);
        logger.debug("Inside setCode");
        this.code = code;
    }

    public String getName() {
        Logger logger = LoggerFactory.getLogger(Country.class);
        logger.debug("Inside getName");
        return name;
    }

    public void setName(String name) {
        Logger logger = LoggerFactory.getLogger(Country.class);
        logger.debug("Inside setName");
        this.name = name;
    }

    @Override
    public String toString() {
        return "Country [code=" + code + ", name=" + name + "]";
    }
}
