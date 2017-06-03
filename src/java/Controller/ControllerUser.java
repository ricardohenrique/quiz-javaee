package Controller;


import Model.ModelUser;
import DAO.DAOUser;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Ricardo Mota
 */
public class ControllerUser {
    
    private DAOUser dao;
    private ModelUser model;
    
    public ControllerUser(String name){
        this.model = new ModelUser(name);
        this.dao = new DAOUser();
    }
    
    public String getName(){
        return this.model.getName();
    }
    
    public void setName(String name){
        this.model.setName(name);
    }
    
    public boolean insert(){
        return this.dao.insert(this.model);
    }
}