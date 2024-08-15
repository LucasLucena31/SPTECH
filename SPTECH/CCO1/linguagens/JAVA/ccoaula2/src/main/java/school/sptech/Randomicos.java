package school.sptech;

import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

public class Randomicos {
    public static void main(String[] args) {
        Random aleatorio = new Random();
        Integer i = aleatorio.nextInt(1, 50);

//        Boolean moeda = aleatorio.nextBoolean();
//
//        if (moeda){
//            System.out.println("Cara");
//        } else {
//            System.out.println("Coroa");
//        }

        Integer numAle = ThreadLocalRandom.current().nextInt(0,20);

        Double numDou = ThreadLocalRandom.current().nextDouble(0.0,20.1);

    }
}
