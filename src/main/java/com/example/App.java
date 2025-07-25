package com.example;

import com.example.DTO.ClaseJava;

import lombok.Data;

@Data
public class App {
    private final String message;

    public static void main(String[] args) {
        App app = new App("¡Hola desde Lombok!");
        System.out.println(app.getMessage());

        ClaseJava claseJava = new ClaseJava();
        claseJava.setNombre("Mario");
        claseJava.setEdad(38);

        System.out.println("Mi nombre es " + claseJava.getNombre() + " y tengo " + claseJava.getEdad());
    }
}
