package user;

import java.sql.Connection;
import java.sql.PreparedStatement;

import util.DatabaseUtil;

public class UserDAO {
	Connection conn = DatabaseUtil.getConnection();

	public int join(String id, String password, String name, String gender,String birth,String mail,String phone,String register) {
		String SQL = "INSERT INTO member VALUES (?,?,?,?,?,?,?,?)";
		try {
			// 각각의 데이터를 실제로 넣어준다.
			PreparedStatement pstmt = conn.prepareStatement(SQL);

			// 쿼리문의 ?안에 각각의 데이터를 넣어준다.
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			pstmt.setString(3, name);
			pstmt.setString(4, gender);
			pstmt.setString(5, birth);
			pstmt.setString(6, mail);
			pstmt.setString(7, phone);
			pstmt.setString(8, register);

			// 명령어를 수행한 결과 반환, 반환값: insert가 된 데이터의 개수
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}