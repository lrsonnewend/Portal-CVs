package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Classe responsavel para estabelecer a conexao com o banco de dados.
 * @author lucas
 */

public class ConnectionFactory {

    private static final String driver = "org.postgresql.Driver"; //driver necessário para conexao com o banco de dados
    private static final String url = "jdbc:postgresql://150.163.12.132:5432/cv-portal"; //url de onde está localizado o banco de dados -> cv-portal é o nome do database
    private static final String user = ""; //usuario
    private static final String pass = ""; //senha para acesso ao banco de dados
    
    /**
     * Metodo responsável por iniciar a conexao com o banco de dados
     * @return boolean -> true se conexão deu certo, false se conexão não deu certo.
     */

    public static Connection getConnection() {
        try {
            Class.forName(driver);
            
            return DriverManager.getConnection(url, user, pass);

        } catch (ClassNotFoundException | SQLException ex) {
            throw new RuntimeException("erro na conexao. ", ex);
        }
    }
    
    /**
     * metodo para fechar conexao com o bd
     * @param con 
     */

    public static void closeConnection(Connection con) {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException ex) {
                System.err.println("Erro: " + ex);
            }

        }
    }
    
    /**
     * metodo para fechar conexao com os respectivos parametros utilizados para consulta ao bd
     * @param con 
     * @param stmt 
     */

    public static void closeConnection(Connection con, PreparedStatement stmt) {
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException ex) {
                System.err.println("Erro: " + ex);
            }
        }
        closeConnection(con);
    }
    
    /**
     * metodo para fechar conexao com os respectivos parametros utilizados para consulta ao bd
     * @param con
     * @param stmt
     * @param rs 
     */

    public static void closeConnection(Connection con, PreparedStatement stmt, ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException ex) {
                System.err.println("Erro: " + ex);
            }
        }
        closeConnection(con, stmt);
    }
}
