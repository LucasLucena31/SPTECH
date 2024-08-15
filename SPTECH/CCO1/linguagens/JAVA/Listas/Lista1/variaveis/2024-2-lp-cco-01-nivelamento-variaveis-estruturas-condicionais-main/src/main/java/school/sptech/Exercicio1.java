package school.sptech;

import java.util.Scanner;

public class Exercicio1 {

  public static void main(String[] args) {

    Scanner leitorNum = new Scanner(System.in);

    System.out.println("Quantidade de filhos entre 0 e 3 anos: ");
    Integer qtdFilhos1 = leitorNum.nextInt();

    System.out.println("Quantidade de filhos entre 4 e 16 anos: ");
    Integer qtdFilhos2 = leitorNum.nextInt();

    System.out.println("Quantidade de filhos entre 17 e 18 anos: ");
    Integer qtdFilhos3 = leitorNum.nextInt();

    Integer totalFilhos = qtdFilhos1 + qtdFilhos2 + qtdFilhos3;

    Double valorBolsa = (qtdFilhos1 * 25.12) + (qtdFilhos2 * 15.88) + (qtdFilhos3 * 12.44);

    System.out.println("Você tem um total de " + totalFilhos + " filhos e vai receber R$" + valorBolsa + " de bolsa");

  }
}