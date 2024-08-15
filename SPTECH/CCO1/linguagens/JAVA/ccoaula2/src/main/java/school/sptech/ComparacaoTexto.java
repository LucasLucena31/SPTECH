package school.sptech;

import java.util.Scanner;

public class ComparacaoTexto {

    public static void main(String[] args) {

        Scanner leitor = new Scanner(System.in);
        String nome1 = leitor.nextLine();

        String nome2 = "Diego";

        if (nome1.equals(nome2)) {
            System.out.println("é exatamente igual");
        } else if (nome1.equalsIgnoreCase(nome2)) {
            System.out.println("é igual, com caixas diferentes");
        } else {
            System.out.println("é diferente");
        }

    }
}
