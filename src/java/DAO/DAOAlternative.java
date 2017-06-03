/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DataBase.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Ricardo Mota
 */
public class DAOAlternative {
    public ResultSet select(){
        try {
            Connection connection = new Connection();
            connection.getConexao();
            String query = "SELECT * FROM alternative ORDER BY RAND()";
            PreparedStatement comando = connection.getConexao().prepareStatement(query);
            ResultSet resultado = comando.executeQuery();
            connection.FechaConexao();
                        
            return resultado;

        } catch (SQLException ex) {
//           status = "Erro:" + ex.getMessage();
           return null;
        }
    }
    
    public ResultSet selectCorrect(){
        try {
            Connection connection = new Connection();
            connection.getConexao();
            String query = "SELECT * FROM alternative where correct = 1";
            PreparedStatement comando = connection.getConexao().prepareStatement(query);
            ResultSet resultado = comando.executeQuery();
            connection.FechaConexao();
            
            return resultado;

        } catch (SQLException ex) {
//           status = "Erro:" + ex.getMessage();
           return null;
        }
    }
}
