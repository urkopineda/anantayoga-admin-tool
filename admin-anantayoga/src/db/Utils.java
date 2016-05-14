package db;

import data.Person;

import java.sql.Connection;
import java.util.ArrayList;

/**
 * Created by urko on 18/04/16.
 */
public class Utils {

    private DB database;

    public Utils() {
        database = new DB();
    }

    public boolean checkUser(String username, String password) {
        if (username.equals("anantayoga")) return true;
        else return false;
    }

    public ArrayList<Person> getPeople() {
        Connection conn = database.getConn();
        return null;
    }

}
