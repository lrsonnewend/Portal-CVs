

package model.dao;

import connection.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.bean.Star;

/**
 * Classe responsável pelos metodos de CRUD (create, read, update e delete) no banco de dados.
 */

public class StarDAO {

    private Connection con = null;
    
    /**
     * metodo construtor -> ao ser instanciado, faz uma nova conexao com o banco de dados.
     */

    public StarDAO() {
        con = ConnectionFactory.getConnection();
    }

    /**
     * 
     * @param star -> objeto do tipo Star.
     * @return tipo boolean para saber se o objeto foi cadastrado com sucesso ou nao.
     */
    public boolean createObj(Star star) {
        String sql = "insert into cataclism (name_cat, ra_cat, dec_cat) values (?, ?, ?)"; //string com o comando a ser realizado no bd
        PreparedStatement stmt = null; //recebe o sql e executa no bd

        try {
            stmt = con.prepareStatement(sql); //stmt recebendo o comando sql
            
            //passando os parametros de entrada (?) que o usuario inseriu no cadastro. 
            stmt.setString(1, star.getNameCat()); 
            stmt.setString(2, star.getRaCat());
            stmt.setString(3, star.getDecCat());
            stmt.executeUpdate();
            return true;

        } catch (SQLException ex) {
            System.err.println("Erro ao executar metodo createObj: " + ex);
            return false;

        } finally {
            ConnectionFactory.closeConnection(con, stmt); //fechando conexao com o bd.
        }
    }
    
    /**
     * 
     * @param star -> objeto do tipo Star
     * @return retorna o objeto com o nome que foi procurado na pagina searchObject.jsp
     */

    public List<Star> SearchNameObject(Star star) {
        String sql = "select * from cataclism where name_cat = ?"; //string com o comando a ser realizado no bd
        PreparedStatement stmt = null; //recebe o sql e executa no bd
        ResultSet rs = null; //variavel para receber o resultado da busca no banco de dados
        List<Star> stars = new ArrayList(); //ArrayList do tipo Star 
        try {

            stmt = con.prepareStatement(sql); //stmt recebendo o comando sql
            stmt.setString(1, star.getNameCat()); //passando o parametro de entrada (? -> name_cat) que o usuario inseriu para busca por nome. 
            rs = stmt.executeQuery(); //rs recebe o retorno da execucao do metodo executeQuery
            
            //populando a tabela stars
            while (rs.next()) {
                star.setNameCat(rs.getString("name_cat"));
                star.setRaCat(rs.getString("ra_cat"));
                star.setDecCat(rs.getString("dec_cat"));

                stars.add(star);
            }
        } catch (SQLException ex) {
            System.err.println("Erro ao buscar objeto: " + ex);
        } finally {
            ConnectionFactory.closeConnection(con, stmt, rs); //fechando conexao do bd
        }
        return stars;
    }
    
     /**
      * metodo para listar todos as cataclismicas do banco de dados.
      * @return lista com todos as cataclismicas
      */

    public List<Star> getAllObj() {
        String sql = "select * from cataclism";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Star> listStars = new ArrayList();

        try {
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();
            
            //populando a tabela
            while (rs.next()) {
                Star star = Star.newStar();
                star.setId_cat(rs.getInt("id_cat"));
                star.setNameCat(rs.getString("name_cat"));
                star.setRaCat(rs.getString("ra_cat"));
                star.setDecCat(rs.getString("dec_cat"));

                listStars.add(star);
            }
        } catch (SQLException ex) {
            System.err.println("Erro: " + ex);
        } finally {
            ConnectionFactory.closeConnection(con, stmt, rs); //fechando conexao
        }
        return listStars;
    }

//    public List<Star> getAllCoord() {
//        String sql = "select name_cat, ra_cat, dec_cat from cataclism";
//        PreparedStatement stmt = null;
//        ResultSet rs = null;
//        List<Star> listCoord = new ArrayList();
//
//        try {
//            stmt = con.prepareStatement(sql);
//            rs = stmt.executeQuery();
//
//            while (rs.next()) {
//                Star star = Star.newStar();
//                star.setNameCat(rs.getString("name_cat"));
//                star.setRaCat(rs.getString("ra_cat"));
//                star.setDecCat(rs.getString("dec_cat"));
//
//                listCoord.add(star);
//            }
//        } catch (SQLException ex) {
//            System.err.println("Erro: " + ex);
//        } finally {
//            ConnectionFactory.closeConnection(con, stmt, rs);
//        }
//        return listCoord;
//    }

    
}
