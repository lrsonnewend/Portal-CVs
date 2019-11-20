package model.bean;

public class SubmitUser {
    
    private String nomeUser, emailUser, raSubmit, decSubmit, objSubmit;

    private SubmitUser() {
        
    }
    
    public static SubmitUser newSubmit(){
        return new SubmitUser();
    }

    public String getNomeUser() {
        return nomeUser;
    }

    public void setNomeUser(String nomeUser) {
        this.nomeUser = nomeUser;
    }

    public String getEmailUser() {
        return emailUser;
    }

    public void setEmailUser(String emailUser) {
        this.emailUser = emailUser;
    }

    public String getRaSubmit() {
        return raSubmit;
    }

    public void setRaSubmit(String raSubmit) {
        this.raSubmit = raSubmit;
    }

    public String getDecSubmit() {
        return decSubmit;
    }

    public void setDecSubmit(String decSubmit) {
        this.decSubmit = decSubmit;
    }

    public String getObjSubmit() {
        return objSubmit;
    }

    public void setObjSubmit(String objSubmit) {
        this.objSubmit = objSubmit;
    }
    
    
    
    
    
}
