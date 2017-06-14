/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jflex;

import java.io.FileReader;
import java.nio.file.Paths;

/**
 *
 * @author Leandro
 */
public class Sintatico {
    public static void main(String[] args) {
        String rootPath = Paths.get("").toAbsolutePath().toString();
        String subPath = "/src/";
        
        String sourcecode = rootPath + subPath + "Program.pg";
        
        try {
            Parser p = new Parser(new AnalisadorSintatico(new FileReader(sourcecode)));
            Object result = p.parse().value;
            System.out.println("Compilacao concluida com sucesso...");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
