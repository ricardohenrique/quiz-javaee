/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Controller.ControllerUser;
import DataBase.Connection;
import Model.ModelUser;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author Ricardo Mota
 */
public class DAOUser {
     public boolean insert(ModelUser user) { 
        try 
        {
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();
            System.out.println(dtf.format(now)); //2016/11/16 12:08:43
            
            //conecta ao BD
            Connection connection = new Connection();
            
            //define a instruçao de inclusao
            PreparedStatement prepared = connection.getConexao().prepareStatement("insert into player values (null,'" + user.getName() + "', '"+dtf.format(now)+"');");
            
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
    
    public ResultSet select(){
        try {
            Connection connection = new Connection();
            connection.getConexao();
            String query = "SELECT * FROM player";
            PreparedStatement comando = connection.getConexao().prepareStatement(query);
            ResultSet resultado = comando.executeQuery();
            connection.FechaConexao();
            return resultado;

        } catch (SQLException ex) {
//           status = "Erro:" + ex.getMessage();
           return null;
        }
    }
    
    public ResultSet getById(Integer id){
        try {
            Connection connection = new Connection();
            connection.getConexao();
            String query = "SELECT * FROM player where id = "+id+"";
            PreparedStatement comando = connection.getConexao().prepareStatement(query);
            ResultSet resultado = comando.executeQuery();
                        
            return resultado;

        } catch (SQLException ex) {
//           status = "Erro:" + ex.getMessage();
           return null;
        }
    }

        
    public ResultSet getByName(String name){
        try {
            Connection connection = new Connection();
            connection.getConexao();
            String query = "SELECT * FROM player where playerName = '"+name+"';";
            PreparedStatement comando = connection.getConexao().prepareStatement(query);
            ResultSet resultado = comando.executeQuery();
                        
            return resultado;

        } catch (SQLException ex) {
//           status = "Erro:" + ex.getMessage();
           return null;
        }
    }
    
    public boolean update(ModelUser user, String id) {
        String query = "update player set playerName = '" + user.getName() + "' where playerId = "+id+";";
        //Charset.forName("UTF-8").encode(query);
        try 
        {
            //conecta ao BD
            Connection connection = new Connection();
            
            //define a instruçao de inclusao
            PreparedStatement prepared = connection.getConexao().prepareStatement(query);
            
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
    
    public boolean delete(ModelUser user, String id) {
        String query = "DELETE FROM player where playerId = "+id+"";
        //Charset.forName("UTF-8").encode(query);
        try 
        {
            //conecta ao BD
            Connection connection = new Connection();
            
            //define a instruçao de inclusao
            PreparedStatement prepared = connection.getConexao().prepareStatement(query);
            
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
}
