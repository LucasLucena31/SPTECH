package school.sptech;

public class TiposVariaveis {
    public static void main(String[] args) {
        /*
            DATA TYPES (WRAPPER)
            String -> Texto (Sempre com aspas duplas)
            Integer -> Inteiro
            Double -> Números com ponto flutuante
            Boolean -> true | false
            Character -> 'a' (Sempre em aspas simples)
            Long -> inteiro 64
            Float -> Números com ponto flutuantes (menor que double, menos preciso)

            TIPOS PRIMITIVOS
            String -> Não possui tipo primitivo
            Integer -> int
            Double -> double
            Boolean -> boolean
            Character -> char
            Long -> long
            Float -> float

            Os tipos primitivos são somente uma representação;
            Classes Wrapper são objetos na linguagem Java:
                - possuem métodos (função);
                - possuem caracteristicas;
        */

        Integer numeroInteiro1 = 10;
        String string = numeroInteiro1.toString();

        String nome = "Diego Brito";
        Double altura = 1.83;
        Boolean isMaiorDeIdade = true;

        /*
            Java possuí tipagem estatíca;
            JavaScript utiliza tipagem dinâmica
         */

        String nomeTeste;
        nomeTeste = "Diego Brito";
        var testeVar = "Diego Brito";

        //O tipo se dá pela atribuição
        // Não podemos mudar o valor inferido

    }
}