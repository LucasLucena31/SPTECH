package school.sptech;

import java.util.Scanner;

public class Exercicio2 {
    public static void main(String[] args) {
        Scanner leitorNum = new Scanner(System.in);

        System.out.println("Duração (em minutos) do aquecimento: ");
        Integer aquecimento = leitorNum.nextInt();

        System.out.println("Duração (em minutos) dos exercícios de aeróbicos: ");
        Integer aerobicos = leitorNum.nextInt();

        System.out.println("Duração (em minutos) dos exercícios de musculação: ");
        Integer musculacao = leitorNum.nextInt();

        Integer aquecimentoQueima = aquecimento * 12;
        Integer aerobicoQueima = aerobicos * 20;
        Integer musculacaoQueima = musculacao * 25;
        Integer totalQueima = aquecimentoQueima + aerobicoQueima + musculacaoQueima;

        System.out.println("Olá, Jorge. Você fez um total de " + (aquecimento + aerobicos + musculacao) +
                " minutos de exercícios e perdeu cerca de " + totalQueima + " calorias.");
    }
}
