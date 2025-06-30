package com.example.exercise1.code;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LoggingExercise {
    public static void main(String[] args) {
        Logger logger = LoggerFactory.getLogger(LoggingExercise.class);
        logger.info("SLF4J Logging Exercise Started.");
        logger.warn("Warning: Disk space is almost full.");
        logger.error("Error: Unable to connect to the database.");
        logger.info("SLF4J Logging Exercise Completed.");
    }
}
