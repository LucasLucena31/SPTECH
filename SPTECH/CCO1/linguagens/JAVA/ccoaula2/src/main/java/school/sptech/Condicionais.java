package school.sptech;

import java.sql.SQLOutput;

public class Condicionais {
    /*
        Projeto Java tem pelo menos 1 método main (Entrypoint)

            = atribuição
            == igualdade
            != diferente de
            > maior
            < menor
            >= maior igual
            <= menor igual
            && AND
            || OR
            !isMaiorDeIdade

            ++
            +=
            --
            -=
            *=
            ** -> Math.pow()
            %
         */

    public  static void main(String[] args){

        Integer idade = 15;
        Boolean isMaiorDeIdade = idade >= 18;

        if (isMaiorDeIdade){
            System.out.println("É maior: " + isMaiorDeIdade);
        }

        // Operador Ternário (if de uma unica linha)
        String resultadoFormatado = isMaiorDeIdade /* (idade >= 18) */ ? "É maior de idade"
                : "Não é maior de idade";

        System.out.println(resultadoFormatado);

        // SWITCH CASE
        Integer opcao = 1;

        switch (opcao){
            case 1:
                System.out.println("Opção 1");
                break;
            case 2:
                System.out.println("Opção 2");
                break;
            case 3:
                System.out.println("Opção 3");
                break;
            default:
                System.out.println("Opção inválida");
        }


    }
}

