package com.example;

import lombok.Data;

@Data
public class App {
    private final String message;

    public static void main(String[] args) {
        App app = new App("¡Hola desde Lombok!");
        System.out.println(app.getMessage());
    }
}
