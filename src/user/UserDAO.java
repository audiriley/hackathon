package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO(){
		try{
			String dbURL = "jdbc:mysql://localhost:3306/websysdb02";
			String dbID="root";
			String dbPassword="websys";
			Class.forName("com.mysql.jdbc.Driver");
			conn= DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	public int login(String id,String password){
		String sql = "select password from member where id=?";
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				if(rs.getString(1).equals(password)){
					return 1; //로그인 성공 
				}
				else
					return 0; // wrong
			}
			return -1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return -2;
	}//end of login
	
	
}
