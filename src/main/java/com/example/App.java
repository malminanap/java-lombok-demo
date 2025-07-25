package com.example;

import com.example.DTO.ClaseJava;

public class App {
    public static void main(String[] args) {
        ClaseJava claseJava = new ClaseJava();
        claseJava.setNombre("Mario");
        claseJava.setEdad(38);

        System.out.println("Mi nombre es " + claseJava.getNombre() + " y tengo " + claseJava.getEdad());
    }
}
