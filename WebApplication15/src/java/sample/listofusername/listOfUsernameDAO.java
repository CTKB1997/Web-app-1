/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.listofusername;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import sample.utils.DBUtilities;

/**
 *
 * @author Thanh
 */
public class listOfUsernameDAO implements Serializable {

    public boolean checkLogin(String username, String password)
            throws SQLException, NamingException { //catch
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtilities.makeConnection();
            if (con != null) {
                String sql = "Select * from listOfUsername Where username = ? And password = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);

                rs = stm.executeQuery();

                if (rs.next()) {
                    return true;
                }
            } //end if con 
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    private List<listOfUsernameDTO> listAccounts;

    public List<listOfUsernameDTO> getListAccounts() {
        return listAccounts;
    }

    public void searchLastname(String searchValue) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtilities.makeConnection();
            if (con != null) {
                String sql = "Select * from listOfUsername Where lastname Like ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + searchValue + "%");

                rs = stm.executeQuery();

                while (rs.next()) {
                    String username = rs.getString("username");
                    String password = rs.getString("password");
                    String lastname = rs.getString("lastname");
                    boolean role = rs.getBoolean("isAdmin");

                    listOfUsernameDTO dto
                            = new listOfUsernameDTO(username, password, lastname, role);

                    if (this.listAccounts == null) {
                        this.listAccounts = new ArrayList<>();
                    }

                    this.listAccounts.add(dto);
                }
            } //end if con 
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public boolean deleteRecord(String username) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBUtilities.makeConnection();
            if (con != null) {
                String sql = "Delete From listOfUsername Where username = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, username);

                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            } //end if con 
        } finally {

            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public boolean updatePassRole(String username, String password, boolean role)
            throws SQLException, SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBUtilities.makeConnection();
            if (con != null) {
                String sql = "Update listOfUsername "
                        + "Set password = ?, isAdmin = ? "
                        + "Where username = ?";

                stm = con.prepareStatement(sql);
                stm.setString(1, password);
                stm.setBoolean(2, role);
                stm.setString(3, username);

                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            } //end if con 
        } finally {

            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
    
    public boolean createRecord(String username, String password, 
            String fullName, boolean role) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBUtilities.makeConnection();
            if (con != null) {
                String sql = "Insert Into listOfUsername(username, password, lastname, isAdmin)" 
                        + " Values(?, ?, ?, ?)";

                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                stm.setString(3, fullName);
                stm.setBoolean(4, role);

                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            } //end if con 
        } finally {

            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
}
