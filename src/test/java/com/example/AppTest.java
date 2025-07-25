package com.example;

import org.junit.jupiter.api.Test;

import com.example.DTO.ClaseJava;

import static org.junit.jupiter.api.Assertions.*;

class AppTest {
    @Test
    void messageShouldNotBeNull() {
        ClaseJava claseJava = new ClaseJava();
        claseJava.setNombre("Mario");
        claseJava.setEdad(38);

        System.out.println("Mi nombre es " + claseJava.getNombre() + " y tengo " + claseJava.getEdad());
        assertNotNull(claseJava.getNombre());
    }
}
