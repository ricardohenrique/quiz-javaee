/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DataBase.Connection;
import Model.ModelGame;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Ricardo Mota
 */
public class DAOGame {
     public boolean insert(ModelGame game) { 
        try 
        {
            //conecta ao BD
            Connection connection = new Connection();
            
            //define a instruçao de inclusao
            PreparedStatement prepared = connection.getConexao().prepareStatement("insert into game values (null, null, " + game.getPlayerId() + ");");
            
            //executa a instrução(entrega ao BD)
            prepared.execute();                 
            
            connection.FechaConexao();
            return true;
        } 
        catch (SQLException ex) 
        {
            //Logger.getLogger(conexao.class.getName()).log(Level.SEVERE, null, ex);
            //status = ("Erro: " + ex.getMessage());
//            return ("Erro: " + ex.getMessage());
            return false;
        }
    }
     
    public ResultSet getById(Integer id){
        try {
            Connection connection = new Connection();
            connection.getConexao();
            String query = "SELECT * FROM game where playerId = "+id+"";
            PreparedStatement comando = connection.getConexao().prepareStatement(query);
            ResultSet resultado = comando.executeQuery();
                        
            return resultado;

        } catch (SQLException ex) {
//           status = "Erro:" + ex.getMessage();
           return null;
        }
    }
}
