/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.DAOGame;
import DAO.DAOQuestion;
import DAO.DAOUser;
import Model.ModelGame;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Ricardo Mota
 */
public class ControllerGame {
    
    private DAOGame game;
    private DAOUser user;
    private ModelGame model;
    private ResultSet resultUser;
    private String nameUser;
    private DAOQuestion questions;
    
    public ControllerGame(String name){
        this.questions = new DAOQuestion();
        this.nameUser = name;
        this.game = new DAOGame();
        this.user = new DAOUser();        
        this.model = new ModelGame();
    }
        
    public boolean insert() throws SQLException{
        this.resultUser = this.user.getByName(nameUser);
        
        while(this.resultUser.next()){
            this.model.setPlayerId(this.resultUser.getInt("playerId"));
        }
        
        boolean validate = this.game.insert(this.model);
        return validate;
    }
}
