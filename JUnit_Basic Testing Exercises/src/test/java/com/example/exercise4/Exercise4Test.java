package com.example.exercise4;

import org.junit.Before;
import org.junit.After;
import org.junit.Test;
import static org.junit.Assert.*;

public class Exercise4Test {

    @Before
    public void setUp() {
        System.out.println("Setup Called");
        // Initialize test resources if any
    }

    @Test
    public void testAdditionAAA() {
        // Arrange
        int a = 10;
        int b = 5;

        // Act
        int result = a + b;

        // Assert
        assertEquals(15, result);
    }

    @After
    public void tearDown() {
        System.out.println("Teardown Called");
        // Clean up resources if any
    }
}
