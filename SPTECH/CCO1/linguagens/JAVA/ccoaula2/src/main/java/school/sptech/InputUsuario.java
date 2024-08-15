package school.sptech;

import java.util.Objects;
import java.util.Scanner;

public class InputUsuario {
    public static void main(String[] args) {

        // STOUD | STDIN
        //Objeto do tipo Scanner
//        Scanner leitor = new Scanner(System.in);

        Scanner leitorTexto = new Scanner(System.in);
        Scanner leitorNumero = new Scanner(System.in);


        System.out.println("Sua idade: ");
        Integer idade = leitorNumero.nextInt();

        System.out.println("Digite seu nome:");
        String valorDigitado = leitorTexto.nextLine();

//        System.out.println("Digite novamente:");
//        String valorDigitado2 = leitor.next();
//
//        System.out.println("Digite sua Idade:");
//        String idadeDigitado = leitor.nextLine();

        if (Objects.equals(valorDigitado, "Lucas")) {
            System.out.println("Olá, dev");
        }

    }
}
