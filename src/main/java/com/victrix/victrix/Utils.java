package com.victrix.victrix;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Utils {

    private static final String jdbcURL = "jdbc:mariadb://localhost:3306/victrix";
    private static final String jdbcUsername = "root";
    private static final String jdbcPassword = "root";

    public static Connection getConnection(){
        Connection connection = null;
        try{
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            System.out.println("Database is connected");
        }catch(Exception e){
            e.printStackTrace();
            System.out.println("NO DATABASE CONNECTION");
        }
        return connection;
    }

}
