package main;

import data.*;

import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

public class DB {

    private Connection connection;
    private DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

    public DB() {
        try {
            this.connection = connect();
        } catch (SQLException | IllegalAccessException | InstantiationException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    private Connection connect() throws SQLException, ClassNotFoundException, IllegalAccessException, InstantiationException {
        String url = "jdbc:mysql://127.0.0.1:3306/anantayoga-db";
        String user = "root";
        String password = "admin";
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection(url, user, password);
    }

    public void disconnect() throws SQLException {
        connection.close();
    }

    public ArrayList<User> getUsers() throws SQLException {
        ArrayList<User> users = new ArrayList<>();
        Statement st = connection.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM VIEW_USERS ORDER BY NOMBRE, APELLIDOS");
        while (rs.next()) {
            User u = new User();
            u.setId(rs.getInt("ID_ADMIN_USUARIO"));
            u.setName(rs.getString("NOMBRE"));
            u.setSurname(rs.getString("APELLIDOS"));
            u.setEmail(rs.getString("EMAIL"));
            u.setDir(rs.getString("DIRECCION"));
            u.setCity(rs.getString("POBLACION"));
            u.setVigente(rs.getInt("VIGENTE"));
            u.setState(rs.getString("PROVINCIA"));
            u.setPhone(rs.getInt("TELEFONO"));
            users.add(u);
        }
        rs.close();
        st.close();
        return users;
    }

    public ArrayList<User> getAllUsers() throws SQLException {
        ArrayList<User> users = new ArrayList<>();
        Statement st = connection.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM VIEW_ALL_USERS ORDER BY NOMBRE, APELLIDOS");
        while (rs.next()) {
            User u = new User();
            u.setId(rs.getInt("ID_ADMIN_USUARIO"));
            u.setName(rs.getString("NOMBRE"));
            u.setSurname(rs.getString("APELLIDOS"));
            u.setEmail(rs.getString("EMAIL"));
            u.setVigente(rs.getInt("VIGENTE"));
            u.setDir(rs.getString("DIRECCION"));
            u.setCity(rs.getString("POBLACION"));
            u.setState(rs.getString("PROVINCIA"));
            u.setPhone(rs.getInt("TELEFONO"));
            users.add(u);
        }
        rs.close();
        st.close();
        return users;
    }

    public User getUser(int id) throws SQLException {
        String query = "SELECT * FROM VIEW_USERS WHERE ID_ADMIN_USUARIO = ?";
        PreparedStatement preparedStmt = connection.prepareStatement(query);
        preparedStmt.setInt(1, id);
        ResultSet rs = preparedStmt.executeQuery();
        rs.next();
        User u = new User();
        u.setId(rs.getInt("ID_ADMIN_USUARIO"));
        u.setName(rs.getString("NOMBRE"));
        u.setSurname(rs.getString("APELLIDOS"));
        u.setEmail(rs.getString("EMAIL"));
        u.setDir(rs.getString("DIRECCION"));
        u.setCity(rs.getString("POBLACION"));
        u.setState(rs.getString("PROVINCIA"));
        u.setPhone(rs.getInt("TELEFONO"));
        rs.close();
        preparedStmt.close();
        return u;
    }

    public ArrayList<Fee> getFees() throws SQLException {
        ArrayList<Fee> fees = new ArrayList<>();
        Statement st = connection.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM VIEW_CUOTA ORDER BY NOMBRE");
        while (rs.next()) {
            Fee c = new Fee();
            c.setId(rs.getInt("ID_ADMIN_CUOTA"));
            c.setName(rs.getString("NOMBRE"));
            c.setType(rs.getString("TIPO"));
            c.setDescription(rs.getString("DESCRIPCION"));
            c.setDays(rs.getInt("DIAS_DURACION"));
            c.setPrice(rs.getDouble("PRECIO"));
            c.setVigente(rs.getInt("VIGENTE"));
            fees.add(c);
        }
        rs.close();
        st.close();
        return fees;
    }

    public ArrayList<Fee> getAllFees() throws SQLException {
        ArrayList<Fee> fees = new ArrayList<>();
        Statement st = connection.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM VIEW_ALL_CUOTA ORDER BY NOMBRE");
        while (rs.next()) {
            Fee c = new Fee();
            c.setId(rs.getInt("ID_ADMIN_CUOTA"));
            c.setName(rs.getString("NOMBRE"));
            c.setType(rs.getString("TIPO"));
            c.setVigente(rs.getInt("VIGENTE"));
            c.setDescription(rs.getString("DESCRIPCION"));
            c.setDays(rs.getInt("DIAS_DURACION"));
            c.setPrice(rs.getDouble("PRECIO"));
            fees.add(c);
        }
        rs.close();
        st.close();
        return fees;
    }

    public Fee getFee(int id) throws SQLException {
        String query = "SELECT * FROM VIEW_CUOTA WHERE ID_ADMIN_CUOTA = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, id);
        ResultSet rs = preparedStatement.executeQuery();
        rs.next();
        Fee c = new Fee();
        c.setId(rs.getInt("ID_ADMIN_CUOTA"));
        c.setName(rs.getString("NOMBRE"));
        c.setType(rs.getString("TIPO"));
        c.setDescription(rs.getString("DESCRIPCION"));
        c.setDays(rs.getInt("DIAS_DURACION"));
        c.setPrice(rs.getDouble("PRECIO"));
        rs.close();
        preparedStatement.close();
        return c;
    }

    public void updateFee(Fee f) throws SQLException {
        String query = "UPDATE ADMIN_CUOTA SET NOMBRE = ?, PRECIO = ?, DIAS_DURACION = ? WHERE ID_ADMIN_CUOTA = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, f.getName());
        preparedStatement.setDouble(2, f.getPrice());
        preparedStatement.setInt(3, f.getDays());
        preparedStatement.setInt(4, f.getId());
        preparedStatement.execute();
        preparedStatement.close();
    }

    public void downUser(int id) throws SQLException {
        String query = "UPDATE ADMIN_USUARIO SET VIGENTE = 0 WHERE ID_ADMIN_USUARIO = ?";
        PreparedStatement preparedStmt = connection.prepareStatement(query);
        preparedStmt.setInt(1, id);
        preparedStmt.execute();
        preparedStmt.close();
        deleteAllContracts(id);
    }

    public void deleteUser(int id) throws SQLException {
        String query = "DELETE FROM ADMIN_PAGOS WHERE ID_ADMIN_USUARIO = ?";
        PreparedStatement preparedStmt = connection.prepareStatement(query);
        preparedStmt.setInt(1, id);
        preparedStmt.execute();
        query = "DELETE FROM ADMIN_CONTRATO WHERE ID_ADMIN_USUARIO = ?";
        preparedStmt = connection.prepareStatement(query);
        preparedStmt.setInt(1, id);
        preparedStmt.execute();
        query = "DELETE FROM ADMIN_USUARIO WHERE ID_ADMIN_USUARIO = ?";
        preparedStmt = connection.prepareStatement(query);
        preparedStmt.setInt(1, id);
        preparedStmt.execute();
        preparedStmt.close();
    }

    public void deleteAllContracts(int id) throws SQLException {
        ArrayList<Contract> cs = getContracts(id);
        for (Contract c : cs) {
            deleteContract(c.getId());
        }
    }

    public void upUser(int id) throws SQLException {
        String query = "UPDATE ADMIN_USUARIO SET VIGENTE = 1 WHERE ID_ADMIN_USUARIO = ?";
        PreparedStatement preparedStmt = connection.prepareStatement(query);
        preparedStmt.setInt(1, id);
        preparedStmt.execute();
        preparedStmt.close();
    }

    public void insertUser(User u) throws SQLException {
        String query = "INSERT INTO ADMIN_USUARIO(NOMBRE, APELLIDOS, DIRECCION, POBLACION, PROVINCIA, TELEFONO, EMAIL) VALUES(?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement preparedStmt = connection.prepareStatement(query);
        preparedStmt.setString(1, u.getName());
        preparedStmt.setString(2, u.getSurname());
        preparedStmt.setString(3, u.getDir());
        preparedStmt.setString(4, u.getCity());
        preparedStmt.setString(5, u.getState());
        preparedStmt.setLong(6, u.getPhone());
        preparedStmt.setString(7, u.getEmail());
        preparedStmt.execute();
        preparedStmt.close();
    }

    public void updateUser(User u) throws SQLException {
        String query = "UPDATE ADMIN_USUARIO SET NOMBRE = ?, APELLIDOS = ?, DIRECCION = ?, POBLACION = ?, PROVINCIA = ?, TELEFONO = ?, EMAIL = ? WHERE ID_ADMIN_USUARIO = ?";
        PreparedStatement preparedStmt = connection.prepareStatement(query);
        preparedStmt.setString(1, u.getName());
        preparedStmt.setString(2, u.getSurname());
        preparedStmt.setString(3, u.getDir());
        preparedStmt.setString(4, u.getCity());
        preparedStmt.setString(5, u.getState());
        preparedStmt.setLong(6, u.getPhone());
        preparedStmt.setString(7, u.getEmail());
        preparedStmt.setInt(8, u.getId());
        preparedStmt.execute();
        preparedStmt.close();
    }

    public ArrayList<FeeType> getFeeTypes() throws SQLException {
        ArrayList<FeeType> fees = new ArrayList<>();
        Statement st = connection.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM ADMIN_TIPO_CUOTA");
        while (rs.next()) {
            FeeType f = new FeeType();
            f.setId(rs.getInt("ID_ADMIN_TIPO_CUOTA"));
            f.setName(rs.getString("NOMBRE"));
            fees.add(f);
        }
        rs.close();
        st.close();
        return fees;
    }

    public void deleteFee(int id) throws SQLException {
        String query = "UPDATE ADMIN_CUOTA SET VIGENTE = 0 WHERE ID_ADMIN_CUOTA = ?";
        PreparedStatement preparedStmt = connection.prepareStatement(query);
        preparedStmt.setInt(1, id);
        preparedStmt.execute();
        preparedStmt.close();
    }

    public void upFee(int id) throws SQLException {
        String query = "UPDATE ADMIN_CUOTA SET VIGENTE = 1 WHERE ID_ADMIN_CUOTA = ?";
        PreparedStatement preparedStmt = connection.prepareStatement(query);
        preparedStmt.setInt(1, id);
        preparedStmt.execute();
        preparedStmt.close();
    }

    public void insertFee(Fee e) throws SQLException {
        String query = "INSERT INTO ADMIN_CUOTA(ID_ADMIN_TIPO_CUOTA, NOMBRE, DIAS_DURACION, PRECIO) (SELECT ID_ADMIN_TIPO_CUOTA, ?, ?, ? FROM ADMIN_TIPO_CUOTA C WHERE C.NOMBRE = ?)";
        PreparedStatement preparedStmt = connection.prepareStatement(query);
        preparedStmt.setString(1, e.getName());
        preparedStmt.setInt(2, e.getDays());
        preparedStmt.setDouble(3, e.getPrice());
        preparedStmt.setString(4, e.getType());
        System.out.println(preparedStmt);
        preparedStmt.execute();
        preparedStmt.close();
    }

    public ArrayList<Contract> getContracts(int id) throws SQLException {
        ArrayList<Contract> cs = new ArrayList<>();
        String query = "SELECT * FROM VIEW_CONTRATOS_VIGENTES WHERE ID = ? ORDER BY CUOTA_NOMBRE";
        PreparedStatement preparedStmt = connection.prepareStatement(query);
        preparedStmt.setInt(1, id);
        ResultSet rs = preparedStmt.executeQuery();
        while (rs.next()) {
            Contract c = new Contract();
            c.setId(rs.getInt("CONTRATO_ID"));
            c.setDate(rs.getDate("FECHA"));
            c.setFee(rs.getString("CUOTA_NOMBRE"));
            c.setPrice(rs.getDouble("PRECIO"));
            c.setDays(rs.getInt("DIAS"));
            c.setIdType(rs.getInt("TIPO_CUOTA_ID"));
            c.setIdUser(id);
            c.setUsername(rs.getString("NOMBRE") + " " + rs.getString("APELLIDOS"));
            cs.add(c);
        }
        rs.close();
        preparedStmt.close();
        return cs;
    }

    public ArrayList<Contract> getContractsOfType(int id) throws SQLException {
        ArrayList<Contract> cs = new ArrayList<>();
        String query = "SELECT * FROM VIEW_CONTRATOS_VIGENTES WHERE CUOTA_ID = ? ORDER BY CUOTA_NOMBRE";
        PreparedStatement preparedStmt = connection.prepareStatement(query);
        preparedStmt.setInt(1, id);
        ResultSet rs = preparedStmt.executeQuery();
        System.out.println(preparedStmt);
        while (rs.next()) {
            Contract c = new Contract();
            c.setPrice(rs.getDouble("PRECIO"));
            c.setDays(rs.getInt("DIAS"));
            c.setIdType(rs.getInt("TIPO_CUOTA_ID"));
            c.setUsername(rs.getString("NOMBRE") + " " + rs.getString("APELLIDOS"));
            c.setId(rs.getInt("CONTRATO_ID"));
            c.setDate(rs.getDate("FECHA"));
            c.setFee(rs.getString("CUOTA_NOMBRE"));
            c.setIdUser(rs.getInt("ID"));
            cs.add(c);
        }
        rs.close();
        preparedStmt.close();
        return cs;
    }

    public void createContract(Contract c) throws SQLException {
        String query = "INSERT INTO ADMIN_CONTRATO(ID_ADMIN_USUARIO, ID_ADMIN_CUOTA) VALUES(?, ?)";
        PreparedStatement preparedStmt = connection.prepareStatement(query);
        preparedStmt.setInt(1, c.getIdUser());
        preparedStmt.setInt(2, c.getIdFee());
        preparedStmt.execute();
        preparedStmt.close();
    }

    public void deleteContract(int id) throws SQLException {
        String query = "UPDATE ADMIN_CONTRATO SET VIGENTE = 0, FECHA_FIN = CURRENT_TIMESTAMP WHERE ID_ADMIN_CONTRATO = ?";
        PreparedStatement preparedStmt = connection.prepareStatement(query);
        preparedStmt.setInt(1, id);
        preparedStmt.execute();
        preparedStmt.close();
    }

    public ArrayList<Payments> getPendingPayments(int id) throws SQLException, ParseException {
        boolean exit = false;
        ArrayList<Contract> cs = getContracts(id);
        ArrayList<Payments> ps = new ArrayList<>();
        for (Contract c : cs) {
            if (c.getIdType() == 1) {
                int i = 0;
                Date startDate = addDays(c.getDate(), 0);
                Date endDate = addDays(startDate, c.getDays());
                Calendar startCal = Calendar.getInstance();
                startCal.setTime(startDate);
                Calendar endCal = Calendar.getInstance();
                endCal.setTime(endDate);
                if (startCal.get(Calendar.MONTH) != endCal.get(Calendar.MONTH)) {
                    endCal.set(Calendar.MONTH, endCal.get(Calendar.MONTH) - 1);
                    endCal.set(Calendar.DAY_OF_MONTH, endCal.getActualMaximum(Calendar.DAY_OF_MONTH));
                    endDate = endCal.getTime();
                }
                do {
                    String query = "SELECT 1 FROM VIEW_PAYMENTS WHERE ID_ADMIN_USUARIO = ? AND ID_ADMIN_CONTRATO = ? AND DATE(FECHA_INICIO) = ? AND DATE(FECHA_FIN) = ?";
                    PreparedStatement preparedStatement = connection.prepareStatement(query);
                    preparedStatement.setInt(1, id);
                    preparedStatement.setInt(2, c.getId());
                    preparedStatement.setDate(3, new java.sql.Date(startDate.getTime()));
                    preparedStatement.setDate(4, new java.sql.Date(endDate.getTime()));
                    ResultSet rs = preparedStatement.executeQuery();
                    if (!rs.next()) {
                        Payments p = new Payments();
                        p.setIdUser(id);
                        p.setIdContract(c.getId());
                        p.setContract(c.getFee());
                        p.setStartDate(new java.sql.Date(startDate.getTime()));
                        p.setEndDate(new java.sql.Date(endDate.getTime()));
                        p.setPrice(c.getPrice());
                        User u = getUser(id);
                        p.setUserName(u.getName() + " " + u.getSurname());
                        startDate = endDate;
                        endDate = addDays(endDate, c.getDays());
                        if (startDate.after(new Date())) {
                            p.setWarning(false);
                            exit = true;
                        } else {
                            p.setWarning(true);
                        }
                        ps.add(p);
                    } else {
                        startDate = endDate;
                        endDate = addDays(endDate, c.getDays());
                        if (startDate.after(new Date())) {
                            if (ps.size() != 0) {
                                exit = true;
                            }
                        }
                    }
                    rs.close();
                    preparedStatement.close();
                } while (!exit);
                exit = false;
            } else {
                Date startDate = addDays(c.getDate(), 0);
                Date endDate = addDays(startDate, c.getDays());
                String query = "SELECT 1 FROM VIEW_PAYMENTS WHERE ID_ADMIN_USUARIO = ? AND ID_ADMIN_CONTRATO = ? AND DATE(FECHA_INICIO) = ? AND DATE(FECHA_FIN) = ?";
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                preparedStatement.setInt(1, id);
                preparedStatement.setInt(2, c.getId());
                preparedStatement.setDate(3, new java.sql.Date(startDate.getTime()));
                preparedStatement.setDate(4, new java.sql.Date(endDate.getTime()));
                ResultSet rs = preparedStatement.executeQuery();
                if (!rs.next()) {
                    Payments p = new Payments();
                    p.setIdUser(id);
                    p.setIdContract(c.getId());
                    p.setContract(c.getFee());
                    p.setStartDate(new java.sql.Date(startDate.getTime()));
                    p.setEndDate(new java.sql.Date(endDate.getTime()));
                    p.setPrice(c.getPrice());
                    User u = getUser(id);
                    p.setUserName(u.getName() + " " + u.getSurname());
                    startDate = endDate;
                    if (startDate.after(new Date())) {
                        p.setWarning(false);
                    } else {
                        p.setWarning(true);
                    }
                    ps.add(p);
                }
                rs.close();
                preparedStatement.close();
            }
        }
        return ps;
    }

    public ArrayList<Payments> getAllPendingPayments() throws SQLException, ParseException {
        ArrayList<Payments> ps = new ArrayList<>();
        ArrayList<User> us = getAllUsers();
        for (User u : us) {
            ps.addAll(getPendingPayments(u.getId()));
        }
        return ps;
    }

    public void deletePayment(int id) throws SQLException {
        String query = "DELETE FROM ADMIN_PAGOS WHERE ID_ADMIN_PAGOS = ?";
        PreparedStatement preparedStmt = connection.prepareStatement(query);
        preparedStmt.setInt(1, id);
        preparedStmt.execute();
        preparedStmt.close();
    }

    public ArrayList<Contract> getAllContracts() throws SQLException, ParseException {
        ArrayList<Contract> cs = new ArrayList<>();
        ArrayList<User> us = getAllUsers();
        for (User u : us) {
            cs.addAll(getContracts(u.getId()));
        }
        return cs;
    }

    private java.util.Date addDays(java.util.Date date, int days) {
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        if (days % 30 == 0) {
            c.add(Calendar.MONTH, days / 30);
        } else {
            c.add(Calendar.DATE, days);
        }
        return c.getTime();
    }

    public void insertPayment(Payments p) throws SQLException {
        String query = "INSERT INTO ADMIN_PAGOS(ID_ADMIN_USUARIO, ID_ADMIN_CONTRATO, FECHA_INICIO, FECHA_FIN, PRECIO) VALUES(?, ?, ?, ?, ?)";
        PreparedStatement preparedStmt = connection.prepareStatement(query);
        preparedStmt.setInt(1, p.getIdUser());
        preparedStmt.setInt(2, p.getIdContract());
        preparedStmt.setDate(3, p.getStartDate());
        preparedStmt.setDate(4, p.getEndDate());
        preparedStmt.setDouble(5, p.getPrice());
        System.out.println(preparedStmt);
        preparedStmt.execute();
        preparedStmt.close();
    }

    public ArrayList<Payments> getPayments(int id) throws SQLException {
        ArrayList<Payments> ps = new ArrayList<>();
        String query = "SELECT * FROM VIEW_PAYMENTS WHERE ID_ADMIN_USUARIO = ? ORDER BY FECHA_PAGO DESC";
        PreparedStatement preparedStmt = connection.prepareStatement(query);
        preparedStmt.setInt(1, id);
        ResultSet rs = preparedStmt.executeQuery();
        while (rs.next()) {
            Payments p = new Payments();
            p.setId(rs.getInt("ID_ADMIN_PAGOS"));
            p.setContract(rs.getString("NOMBRE"));
            p.setDate(rs.getDate("FECHA_PAGO"));
            p.setStartDate(rs.getDate("FECHA_INICIO"));
            p.setEndDate(rs.getDate("FECHA_FIN"));
            p.setPrice(rs.getDouble("PRECIO"));
            ps.add(p);
        }
        rs.close();
        preparedStmt.close();
        return ps;
    }

    public ArrayList<Payments> getAllPayments(Date startDate, Date endDate) throws SQLException {
        ArrayList<Payments> ps = new ArrayList<>();
        String query = null;
        int i = 1;
        if (startDate != null && endDate != null) {
            query = "SELECT * FROM VIEW_PAYMENTS WHERE FECHA_PAGO >= ? AND FECHA_PAGO <= ? ORDER BY FECHA_PAGO DESC";
            i = 2;
        } else if (startDate != null) {
            query = "SELECT * FROM VIEW_PAYMENTS WHERE FECHA_PAGO >= ? ORDER BY FECHA_PAGO DESC";
        } else if (endDate != null) {
            query = "SELECT * FROM VIEW_PAYMENTS WHERE FECHA_PAGO <= ? ORDER BY FECHA_PAGO DESC";
        } else {
            query = "SELECT * FROM VIEW_PAYMENTS ORDER BY FECHA_PAGO DESC";
        }
        PreparedStatement preparedStmt = connection.prepareStatement(query);
        if (startDate != null) {
            preparedStmt.setDate(1, new java.sql.Date(startDate.getTime()));
        }
        if (endDate != null) {
            preparedStmt.setDate(i, new java.sql.Date(endDate.getTime()));
        }
        ResultSet rs = preparedStmt.executeQuery();
        while (rs.next()) {
            Payments p = new Payments();
            p.setId(rs.getInt("ID_ADMIN_PAGOS"));
            p.setUserName(rs.getString("NOMBRE_U") + " " + rs.getString("APELLIDOS"));
            p.setContract(rs.getString("NOMBRE"));
            p.setDate(rs.getDate("FECHA_PAGO"));
            p.setStartDate(rs.getDate("FECHA_INICIO"));
            p.setEndDate(rs.getDate("FECHA_FIN"));
            p.setPrice(rs.getDouble("PRECIO"));
            ps.add(p);
        }
        rs.close();
        preparedStmt.close();
        return ps;
    }

    public Payments getPayment(int id) throws SQLException {
        String query = "SELECT * FROM VIEW_PAYMENTS WHERE ID_ADMIN_PAGOS = ?";
        PreparedStatement preparedStmt = connection.prepareStatement(query);
        preparedStmt.setInt(1, id);
        ResultSet rs = preparedStmt.executeQuery();
        rs.next();
        Payments p = new Payments();
        p.setId(rs.getInt("ID_ADMIN_PAGOS"));
        p.setContract(rs.getString("NOMBRE"));
        p.setDate(rs.getDate("FECHA_PAGO"));
        p.setStartDate(rs.getDate("FECHA_INICIO"));
        p.setEndDate(rs.getDate("FECHA_FIN"));
        p.setPrice(rs.getDouble("PRECIO"));
        p.setUserName(rs.getString("NOMBRE_U") + " " + rs.getString("APELLIDOS"));
        rs.close();
        preparedStmt.close();
        return p;
    }

}
