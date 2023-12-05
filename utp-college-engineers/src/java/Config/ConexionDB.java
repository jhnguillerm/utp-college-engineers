
package Config;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConexionDB {
    
    private static final String url = "jdbc:mysql://localhost:3306/utp_database";
    private static final String user = "root";
    private static final String password = "";
    
    public  Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, password);
            System.out.println("Se conectó a la base de datos.");
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Error Config/ConexionDB: " + ex);
        }
        return connection;
    }
    
}
