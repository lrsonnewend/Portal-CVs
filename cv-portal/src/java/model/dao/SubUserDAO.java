package model.dao;

import connection.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.bean.SubmitUser;

public class SubUserDAO {

    private Connection con = null;

    public SubUserDAO() {
        con = ConnectionFactory.getConnection();
    }

    public boolean createSub(SubmitUser sbmt) {
        String sql = "insert into submit_user (name_user, email_user, obj_submit, ra_submit, dec_submit) values (?, ?, ?, ?, ?);";
        PreparedStatement stmt = null;

        try {
            stmt = con.prepareStatement(sql); //stmt recebendo o comando sql

            //passando os parametros de entrada (?) que o usuario inseriu no cadastro. 
            stmt.setString(1, sbmt.getNomeUser());
            stmt.setString(2, sbmt.getEmailUser());
            stmt.setString(3, sbmt.getObjSubmit());
            stmt.setString(4, sbmt.getRaSubmit());
            stmt.setString(5, sbmt.getDecSubmit());
            stmt.executeUpdate();
            return true;

        } catch (SQLException ex) {
            System.err.println("Erro ao executar metodo createSub: " + ex);
            return false;

        } finally {
            ConnectionFactory.closeConnection(con, stmt); //fechando conexao com o bd.
        }
    }
}


