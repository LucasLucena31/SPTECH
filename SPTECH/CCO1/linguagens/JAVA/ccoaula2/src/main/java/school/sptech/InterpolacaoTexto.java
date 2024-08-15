package school.sptech;

public class InterpolacaoTexto {
    public static void main(String[] args) {
        String filme = "Titanic";
        Integer anoLancamento = 1998;
        Double bilheteria = 10.125;

        // Concatenação (+) // má prática
        String frase1 = "Nome filme: " + filme
                + " Ano de lançamento: " + anoLancamento
                + "Bilheteria: " + bilheteria;

        // Format
        String frase2 = String.format(
                "Nome filme: %s Ano de lançamento: %d Bilheteria: %.3f", /* %.X para limitar num dps da virgula  */
                filme,
                anoLancamento,
                bilheteria
        );

        String frase3 =
                "Nome filme: %s Ano de lançamento: %d Bilheteria: %.3f".formatted(filme, anoLancamento, bilheteria);


        String textoMaior = """
                Nome filme: %s
                Ano de lançamento: %d
                Bilheteria: %f
                """.formatted(filme, anoLancamento, bilheteria);

        System.out.println(frase1);
        System.out.println(frase2);
        System.out.println(frase3);
        System.out.println(textoMaior);




    }
}
