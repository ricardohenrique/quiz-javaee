/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Ricardo Mota
 */
public class ModelUser {
    private String name;
    
    public ModelUser(String name){
        this.name = name;
    }
    
    public String getName(){
        return this.name;
    }
    
    public String setName(String name){
        this.name = name;
        return this.name;
    }
}
