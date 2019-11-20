package model.bean;

public class Calculo {

    //método utilizado para procurar um objeto por meio da coordenada fornecida pelo usuario e as coordenadas do banco de dados.

    public boolean leCoord(String raBD, String decBD, Star star, int segArco) {

        double difRA, difDEC, difSec;
        String sepRAUser[];
        String sepDECUser[];

        String sepRABD[];
        String sepDECBD[];

        //separando coordenadas para facilitar sua manipulação
        sepRAUser = star.getRaCat().split(" ");
        sepDECUser = star.getDecCat().split(" ");

        sepRABD = raBD.split(" ");
        sepDECBD = decBD.split(" ");

        //realizando o cálculo diferencial para RA
        difRA = Math.abs(15 * (3600 * Integer.parseInt(sepRAUser[0])
                + 60 * Integer.parseInt(sepRAUser[1]) + Double.parseDouble(sepRAUser[2]))
                - (15 * (3600 * Integer.parseInt(sepRABD[0])
                + 60 * Integer.parseInt(sepRABD[1]) + Double.parseDouble(sepRABD[2]))));

        //realizando o cálculo diferencial para DEC
        difDEC = Math.abs((3600 * Integer.parseInt(sepDECUser[0])
                + 60 * Integer.parseInt(sepDECUser[1]) + Double.parseDouble(sepDECUser[2]))
                - (3600 * Integer.parseInt(sepDECBD[0])
                + 60 * Integer.parseInt(sepDECBD[1]) + Double.parseDouble(sepDECBD[2])));

        //armazenando o valor final da conta
        difSec = Math.sqrt(Math.pow(difRA, 2) + Math.pow(difDEC, 2));

        return (difSec < segArco);
    }

}
