package db;

/**
 * Created by urko on 18/04/16.
 */
public class DBUtils {

    public DBUtils() {

    }

    public boolean checkUser(String username, String password) {
        if (username.equals("anantayoga")) return true;
        else return false;
    }

}
