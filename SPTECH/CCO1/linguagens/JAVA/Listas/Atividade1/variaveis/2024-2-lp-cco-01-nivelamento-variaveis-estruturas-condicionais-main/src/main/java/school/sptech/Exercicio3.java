package school.sptech;

import java.util.Scanner;

public class Exercicio3 {
    public static void main(String[] args) {
        Scanner leitorNum = new Scanner(System.in);

        System.out.println("Valor do produto: ");
        Integer vlrProduto = leitorNum.nextInt();

        System.out.println("Quantidade vendida do produto: ");
        Integer qtdProduto = leitorNum.nextInt();

        System.out.println("Valor pago pelo cliente: ");
        Integer vlrPago = leitorNum.nextInt();

        Integer total = vlrProduto * qtdProduto;
        Integer vlrDebito = vlrPago - total;

        if(vlrDebito > 0){
            System.out.println("Seu troco será de R$" + vlrDebito);
        } else if (vlrDebito == 0){
            System.out.println("Não há troco");
        } else {
            vlrDebito *= -1;
            System.out.println("O cliente ainda deve R$" +vlrDebito);
        }
    }
}
