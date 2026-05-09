package utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext {

    public Connection getConnection() throws Exception {
        String url = "jdbc:mysql://localhost:3306/student_management";
        String user = "root";
        String pass = "nhunguy@123";
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, user, pass);
    }
}