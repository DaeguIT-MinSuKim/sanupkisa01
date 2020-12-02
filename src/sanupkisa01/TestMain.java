package sanupkisa01;

import java.sql.Connection;
import java.util.Date;
import java.util.List;

import sanupkisa01.dao.MemberDao;
import sanupkisa01.dao.SaleDao;
import sanupkisa01.ds.JdbcUtil;
import sanupkisa01.dto.Member;
import sanupkisa01.dto.Sale;

public class TestMain {

	public static void main(String[] args) {
		Connection con = JdbcUtil.getConnection();
		System.out.println(con);
		
		listMember();
		
		Member member = insertMember();
		System.out.println("insert Member > " + member + "\r\n");
		
		Member searchMember = updateMember();
		System.out.println("update Member > " + searchMember);
		
		selectMemberByNo(searchMember);
		
		saleList();
	}

	private static void saleList() {
		List<Sale> listSale = SaleDao.getInstance().selectSaleByAll();
		for(Sale m : listSale) {
			System.out.println(m);
		}
		System.out.println();
	}

	private static void selectMemberByNo(Member searchMember) {
		Member findMember = MemberDao.getInstance().selectMemberByNo(searchMember.getCustno());
		System.out.println(findMember);
		System.out.println();
	}

	private static Member updateMember() {
		Member searchMember = MemberDao.getInstance().selectMemberByNo(100008);
		System.out.println(searchMember);
		
		searchMember.setCustname("테스트2");
		searchMember.setGrade("B");
		searchMember.setCity("20");
		searchMember.setPhone("010-3333-3333");
		searchMember.setAddress("달서구");
		MemberDao.getInstance().updateMember(searchMember);
		return searchMember;
	}

	private static Member insertMember() {
		int custNo = MemberDao.getInstance().nextCustNo();
		String custName = "테스트";
		String phone = "010-1111-2222";
		String address = "수성구";
		Date joinDate = new Date();
		String grade = "A";
		String city = "10";
		Member member = new Member(custNo, custName, phone, address, joinDate, grade, city);
		MemberDao.getInstance().insertMember(member);
		return member;
	}

	private static void listMember() {
		List<Member> list = MemberDao.getInstance().selectMemberByAll();
		for(Member m : list) {
			System.out.println(m);
		}
		System.out.println();
	}

}
