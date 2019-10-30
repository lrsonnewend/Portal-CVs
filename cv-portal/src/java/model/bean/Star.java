package model.bean;

public class Star {
    private int id_cat;
    private String name_cat, ra_cat, dec_cat;
    
    private Star(){

    }
    
    public static Star newStar(){
        return new Star();
    }

    public int getId_cat() {
        return id_cat;
    }

    public void setId_cat(int id_cat) {
        this.id_cat = id_cat;
    }
    
    public String getNameCat() {
        return name_cat;
    }

    public void setNameCat(String name_cat) {
        this.name_cat = name_cat;
    }

    public String getRaCat() {
        return ra_cat;
    }

    public void setRaCat(String ra_cat) {
        this.ra_cat = ra_cat;
    }

    public String getDecCat() {
        return dec_cat;
    }

    public void setDecCat(String dec_cat) {
        this.dec_cat = dec_cat;
    }
      
  
}
