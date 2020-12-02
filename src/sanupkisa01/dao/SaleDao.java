package sanupkisa01.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sanupkisa01.ds.JdbcUtil;
import sanupkisa01.dto.Sale;

public class SaleDao {
	private static final SaleDao instance = new SaleDao();

	private SaleDao() {
	}

	public static SaleDao getInstance() {
		return instance;
	}
	
	public List<Sale> selectSaleByAll(){
		String sql = "select custno, custname, grade, total from vw_sale";
		
		List<Sale> list = null;
		try (Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			if (rs.next()) {
				list = new ArrayList<>();
				do {
					list.add(getSale(rs));
				} while (rs.next());
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	private Sale getSale(ResultSet rs) throws SQLException {
		int custno = rs.getInt("custno");
        String name = rs.getString("custname");
        String grade = rs.getString("grade");
        int total = rs.getInt("total");
        return new Sale(custno, name, grade, total);
	}
}
