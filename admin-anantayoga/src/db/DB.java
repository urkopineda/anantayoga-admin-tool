package db;

import data.Definitions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by urko on 21/04/16.
 */
public class DB {

    private Connection conn = null;

    public DB() {
        loadDriver();
        connect();
    }

    private void loadDriver() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    private void connect() {
        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost/" + Definitions.dbName, Definitions.dbUsername, Definitions.dbPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void disconnect() {
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void reconnect() {
        try {
            if (conn.isClosed()) connect();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Connection getConn() {
        return conn;
    }

}
