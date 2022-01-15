package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DbConfig {

    public static Connection connect() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        final String URL = "jdbc:mysql://localhost/learningdb";
        final String USER = "root";
        final String PWD = "";
        Connection con = DriverManager.getConnection(URL, USER, PWD);
        return con;
    }

    public static Map<String, String> findSingle(String table, String condition) throws Exception {
        Connection con = connect();
        ResultSet rs = con.createStatement().executeQuery("SELECT * FROM " + table + " WHERE " + condition);
        ResultSetMetaData rsm = rs.getMetaData();
        int cols = rsm.getColumnCount();
        HashMap<String, String> map = new HashMap<String, String>();
        rs.next();
        for (int i = 1; i <= cols; i++) {
            map.put(rsm.getColumnName(i), rs.getString(i));
        }
        con.close();
        return map;
    }
    
    public static String findCount(String table) throws Exception {
        Connection con = connect();
        ResultSet rs = con.createStatement().executeQuery("SELECT count(*) FROM " + table);      
        rs.next();
        String result=rs.getString(1);
        con.close();
        return result;
    }

    public static List<Map<String, String>> allRecords(String table) throws Exception {
        Connection con = connect();
        ResultSet rs = con.createStatement().executeQuery("SELECT * FROM " + table);
        ResultSetMetaData rsm = rs.getMetaData();
        int cols = rsm.getColumnCount();
        List<Map<String, String>> list = new ArrayList<>();
        while (rs.next()) {
            Map<String,String> map=new HashMap<>();
            for (int i = 1; i <= cols; i++) {
                map.put(rsm.getColumnName(i), rs.getString(i));
            }
            list.add(map);
        }
        con.close();
        return list;
    }
    
    public static List<Map<String, String>> findall(String table,String condition) throws Exception {
        Connection con = connect();
        ResultSet rs = con.createStatement().executeQuery("SELECT * FROM " + table+" WHERE "+condition);
        ResultSetMetaData rsm = rs.getMetaData();
        int cols = rsm.getColumnCount();
        List<Map<String, String>> list = new ArrayList<>();
        while (rs.next()) {
            Map<String,String> map=new HashMap<>();
            for (int i = 1; i <= cols; i++) {
                map.put(rsm.getColumnName(i), rs.getString(i));
            }
            list.add(map);
        }
        con.close();
        return list;
    }
    
    public static List<Map<String, String>> sublect() throws Exception {
        Connection con = connect();
        ResultSet rs = con.createStatement().executeQuery("SELECT * FROM subjects WHERE subid not in(SELECT subid from lecsub)");
        ResultSetMetaData rsm = rs.getMetaData();
        int cols = rsm.getColumnCount();
        List<Map<String, String>> list = new ArrayList<>();
        while (rs.next()) {
            Map<String,String> map=new HashMap<>();
            for (int i = 1; i <= cols; i++) {
                map.put(rsm.getColumnName(i), rs.getString(i));
            }
            list.add(map);
        }
        con.close();
        return list;
    }
    
    public static List<Map<String, String>> allmsgs(String rollno) throws Exception {
        Connection con = connect();
        ResultSet rs = con.createStatement().executeQuery("SELECT * FROM msgs WHERE lid in (SELECT lid from lecsub where subid in (SELECT subid FROM subjects WHERE cid=(SELECT class FROM student WHERE rollno="+rollno+"))) order by mdate desc");
        ResultSetMetaData rsm = rs.getMetaData();
        int cols = rsm.getColumnCount();
        List<Map<String, String>> list = new ArrayList<>();
        while (rs.next()) {
            Map<String,String> map=new HashMap<>();
            for (int i = 1; i <= cols; i++) {
                map.put(rsm.getColumnName(i), rs.getString(i));
            }
            list.add(map);
        }
        con.close();
        return list;
    }
    
    
    public static List<Map<String, String>> allLectmsgs(String lid) throws Exception {
        Connection con = connect();
        ResultSet rs = con.createStatement().executeQuery("SELECT * FROM msgs WHERE lid="+lid+" order by mdate desc");
        ResultSetMetaData rsm = rs.getMetaData();
        int cols = rsm.getColumnCount();
        List<Map<String, String>> list = new ArrayList<>();
        while (rs.next()) {
            Map<String,String> map=new HashMap<>();
            for (int i = 1; i <= cols; i++) {
                map.put(rsm.getColumnName(i), rs.getString(i));
            }
            list.add(map);
        }
        con.close();
        return list;
    }
    
    public static List<Map<String, String>> studentmat(String rollno) throws Exception {
        Connection con = connect();
        ResultSet rs = con.createStatement().executeQuery("SELECT * FROM material WHERE subid in (SELECT subid from subjects where cid=(SELECT class FROM student WHERE rollno="+rollno+"))");
        ResultSetMetaData rsm = rs.getMetaData();
        int cols = rsm.getColumnCount();
        List<Map<String, String>> list = new ArrayList<>();
        while (rs.next()) {
            Map<String,String> map=new HashMap<>();
            for (int i = 1; i <= cols; i++) {
                map.put(rsm.getColumnName(i), rs.getString(i));
            }
            list.add(map);
        }
        con.close();
        return list;
    }
    
    public static List<Map<String, String>> lectsubs(String lid) throws Exception {
        Connection con = connect();
        ResultSet rs = con.createStatement().executeQuery("SELECT * FROM subjects WHERE subid in(SELECT subid from lecsub where lid="+lid+")");
        ResultSetMetaData rsm = rs.getMetaData();
        int cols = rsm.getColumnCount();
        List<Map<String, String>> list = new ArrayList<>();
        while (rs.next()) {
            Map<String,String> map=new HashMap<>();
            for (int i = 1; i <= cols; i++) {
                map.put(rsm.getColumnName(i), rs.getString(i));
            }
            list.add(map);
        }
        con.close();
        return list;
    }
    
    public static List<Map<String, String>> studentlects(String rollno) throws Exception {
        Connection con = connect();
        ResultSet rs = con.createStatement().executeQuery("SELECT lid,lname FROM lecturer WHERE lid in(SELECT lid from  lecsub where subid in (SELECT subid FROM subjects WHERE cid=(SELECT class FROM student WHERE rollno="+rollno+"))) and lid not in(SELECT lid from evaluation WHERE rollno="+rollno+")");
        ResultSetMetaData rsm = rs.getMetaData();
        int cols = rsm.getColumnCount();
        List<Map<String, String>> list = new ArrayList<>();
        while (rs.next()) {
            Map<String,String> map=new HashMap<>();
            for (int i = 1; i <= cols; i++) {
                map.put(rsm.getColumnName(i), rs.getString(i));
            }
            list.add(map);
        }
        con.close();
        return list;
    }
}
