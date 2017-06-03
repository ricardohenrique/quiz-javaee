/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.DAOAlternative;
import DAO.DAOGame;
import DAO.DAOHistory;
import DAO.DAOUser;
import Model.ModelGame;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Ricardo Mota
 */
public class ControllerQuiz {
    private String answer[] = new String[10];
    private String user;
    private int countAccept;
    public int finalAcceptQuestion;
    private ResultSet resultUser;
    private ResultSet resultGame;
    
    public ControllerQuiz(){
        this.countAccept = 0;
    }
    
    public boolean setAnswer(String answer[]){
        int count = 0;
        for (String s : answer ) {
            this.answer[count] = s;
            count++;
        }
        return true;
    }
    
    public String[] returnAnswer(){
        return this.answer;
    }
    
    public boolean setUser(String user){
        this.user = user;
        System.out.println("USUARIO: " + user);
        return true;
    }
    
    public int countCorrect() throws SQLException{
        DAOAlternative alternative = new DAOAlternative();
        ResultSet alternativesCorrects = alternative.selectCorrect();
        
        while (alternativesCorrects.next()) {
            for (int i = 0; i < 10; i++) {
                if(alternativesCorrects.getInt("alternativeId") == Integer.parseInt(this.answer[i])){
                    this.countAccept++;
                }
            }
        }
        this.finalAcceptQuestion = this.countAccept;
        return this.finalAcceptQuestion;
    }
    
    public boolean saveHistory() throws SQLException{
        DAOUser dUser = new DAOUser();
        DAOHistory dHistory = new DAOHistory();
        DAOGame dGames = new DAOGame();
        ModelGame mGame = new ModelGame();

        this.resultUser = dUser.getByName(this.user);
        while(this.resultUser.next()){
            mGame.setPlayerId(this.resultUser.getInt("playerId"));
        }
        
        this.resultGame = dGames.getById(mGame.getPlayerId());
        while(this.resultGame.next()){
            mGame.setGameId(this.resultGame.getInt("gameId"));
        }
        int acertos = this.countCorrect();
        boolean validate = dHistory.insert(mGame, acertos);
        
        System.out.println("getPlayerId: " + mGame.getPlayerId());
        System.out.println("getGameId: " + mGame.getGameId());
        System.out.println("ACERTOS: " + acertos);
        System.out.println("History INSERIDO: " + validate);
        
        return true;
    }
}
