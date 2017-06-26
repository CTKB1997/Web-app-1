/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.javabeans;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import sample.listofusername.listOfUsernameDAO;

/**
 *
 * @author Thanh
 */
public class LoginBean implements Serializable{
    private String username;
    private String password;

    public LoginBean() {
    }

    public LoginBean(String username, String password) {
        this.username = username;
        this.password = password;
    }
    

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }
    
    public boolean checkLogin() {
        try {
            listOfUsernameDAO dao = new listOfUsernameDAO();
            boolean result = dao.checkLogin(username, password);
            
            return result;
        } catch (SQLException ex) {
            Logger.getLogger(LoginBean.class.getName()).log(Level.SEVERE, null, ex);
            //ex.printStackTrace();
        } catch (NamingException ex) {
            Logger.getLogger(LoginBean.class.getName()).log(Level.SEVERE, null, ex);
            //ex.printStackTrace();
        } 
        
        return false;
    }
}
