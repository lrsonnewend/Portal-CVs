package model.bean;


public class Calculo {
    double arcSec;
    
    private Calculo(){
        
    }
    
    public static Calculo newCalc(){
        return new Calculo();
    }

    public double getArcSec() {
        return arcSec;
    }

    public void setArcSec(double arcSec) {
        this.arcSec = arcSec;
    }
    
    
    
}
