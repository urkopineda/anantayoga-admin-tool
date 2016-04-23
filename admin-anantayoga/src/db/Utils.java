package db;

/**
 * Created by urko on 18/04/16.
 */
public class Utils {

    private DB database;

    public Utils() {
        database = new DB();
    }

    public DB getDB() {
        return database;
    }

    public boolean checkUser(String username, String password) {
        if (username.equals("anantayoga")) return true;
        else return false;
    }

}
