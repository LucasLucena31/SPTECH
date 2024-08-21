package school.sptech;

import java.util.Scanner;

public class Exercicio4 {
    public static void main(String[] args) {
        Scanner leitorTexto = new Scanner(System.in);
        Scanner leitorNum = new Scanner(System.in);

        System.out.println("Digite seu nome:");
        String nome = leitorTexto.nextLine();

        System.out.println("Digite sua primeira nota:");
        Double nota1 = leitorNum.nextDouble();

        System.out.println("Digite sua segunda nota:");
        Double nota2 = leitorNum.nextDouble();

        Double media = (nota2 + nota1) / 2;

        System.out.println("Olá, " + nome + ". Sua média foi de " + media);

    }
}
