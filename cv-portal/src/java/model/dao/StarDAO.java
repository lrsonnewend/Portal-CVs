package model.dao;

import connection.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.bean.Star;

public class StarDAO {

    private Connection con = null;

    public StarDAO() {
        con = ConnectionFactory.getConnection();
    }

    public boolean createObj(Star star) {
        String sql = "insert into cataclism (name_cat, ra_cat, dec_cat) values (?, ?, ?)";
        PreparedStatement stmt = null;

        try {
            stmt = con.prepareStatement(sql);
            stmt.setString(1, star.getNameCat());
            stmt.setString(2, star.getRaCat());
            stmt.setString(3, star.getDecCat());
            stmt.executeUpdate();
            return true;

        } catch (SQLException ex) {
            System.err.println("Erro ao executar metodo createObj: " + ex);
            return false;

        } finally {
            ConnectionFactory.closeConnection(con, stmt);
        }
    }

    public List<Star> SearchNameObject(Star star) {
        String sql = "select * from cataclism where name_cat = ?";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Star> stars = new ArrayList();
        try {

            stmt = con.prepareStatement(sql);
            stmt.setString(1, star.getNameCat());
            rs = stmt.executeQuery();

            while (rs.next()) {
                star.setNameCat(rs.getString("name_cat"));
                star.setRaCat(rs.getString("ra_cat"));
                star.setDecCat(rs.getString("dec_cat"));

                stars.add(star);
            }
        } catch (SQLException ex) {
            System.err.println("Erro ao buscar objeto: " + ex);
        } finally {
            ConnectionFactory.closeConnection(con, stmt, rs);
        }
        return stars;
    }

    public List<Star> getAllObj() {
        String sql = "select * from cataclism";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Star> listStars = new ArrayList();

        try {
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

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
            ConnectionFactory.closeConnection(con, stmt, rs);
        }
        return listStars;
    }

    public List<Star> getAllCoord() {
        String sql = "select name_cat, ra_cat, dec_cat from cataclism";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Star> listCoord = new ArrayList();

        try {
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Star star = Star.newStar();
                star.setNameCat(rs.getString("name_cat"));
                star.setRaCat(rs.getString("ra_cat"));
                star.setDecCat(rs.getString("dec_cat"));

                listCoord.add(star);
            }
        } catch (SQLException ex) {
            System.err.println("Erro: " + ex);
        } finally {
            ConnectionFactory.closeConnection(con, stmt, rs);
        }
        return listCoord;
    }

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
