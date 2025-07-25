package com.example;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class AppTest {
    @Test
    void messageShouldNotBeNull() {
        App app = new App("Test");
        assertNotNull(app.getMessage());
    }
}
