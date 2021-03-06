package ru.mysite.web;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class AppDAOGeneral {

    public Connection getConnection(){
        String connectionUrl = "jdbc:mysql://localhost:3306/service";
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionUrl, "root", "tz3vs2pf");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void closeConnection(Connection connection){
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
