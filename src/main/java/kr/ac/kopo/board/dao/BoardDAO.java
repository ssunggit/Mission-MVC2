package kr.ac.kopo.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.util.ConnectionFactory;
import kr.ac.kopo.util.JDBCClose;

/*
 * t_board 테이블에 CRUD 담당 클래스
 */
public class BoardDAO {
	/**
	 * no에 해당 게시물 조회메소드
	 */
	public BoardVO selectByNo(int no) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("select no, title, writer, content, view_cnt ");
		sql.append("      , to_char(reg_date, 'yyyy-mm-dd') reg_date ");
		sql.append("  from t_board ");
		sql.append(" where no = ? ");
		
		 try(	// 1.7버전 이후에 try () 등장
				 // 객체를 생성할 수 있음 -> close를 할 객체 
				 // try 문이 끝나면 자동으로 close 메소드를 호출
				 // 오토클로져 인터페이스를 상속받은 클래스를 이용해서만 객체를 만들 수 있다.
				 // finally에서 close메소드를 안써줘도 된다.
				 Connection conn = new ConnectionFactory().getConnection();
				 PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			 pstmt.setInt(1, no);
			 ResultSet rs = pstmt.executeQuery();
			 if(rs.next()) {
				// no 로 변수이름을 정하는 경우 매개변수와 이름이 같아 오류
				int boardNo = rs.getInt("no");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String content = rs.getString("content");
				int viewCnt = rs.getInt("view_cnt");
				String regDate = rs.getString("reg_date");
				 
				BoardVO board = new BoardVO(boardNo, title, writer, content, viewCnt, regDate);
				 
				return board;
			 }
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 레코드가 0인 경우 null 리턴
		return null;
	}
	
	/**
	 * 전체 게시글 조회 메소드
	 */
	// 여러 개를 가져오기 때문에 배열이나 컬렉션 형태여야한다
	// jsp 에 넘겨주는 단위를 BoardVO
	public List<BoardVO> selectAll(){
		// jsp에 vo를 넘겨줄 수 있는 객체
		List<BoardVO> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select no, title, writer, to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
			sql.append(" from t_board ");
			sql.append(" order by no desc ");
			
			pstmt = conn.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String regDate = rs.getString("reg_date");
				//String regDate = rs.getString(4);
				
				BoardVO board = new BoardVO();
				board.setNo(no);
				board.setTitle(title);
				board.setWriter(writer);
				board.setRegDate(regDate);
				
				//System.out.println(board);
				list.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(pstmt, conn);
		}
		
		
		return list;
	}
	
	/*
	public static void main(String[] args) {
		BoardDAO dao = new BoardDAO();
		dao.selectAll();
	}
	*/
	/**
	 * 새글등록을 위한 seq_t_board_no의 시퀀스 추출
	 */
	public int selectBoardNo() {
		
		String sql = "select seq_t_board_no.nextval from dual ";
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
		) {
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	
	/**
	 * 새글등록
	 */
	public void insertBoard(BoardVO board) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = new ConnectionFactory().getConnection();
			
			StringBuilder sql = new StringBuilder();
			sql.append("insert into t_board(no, title, writer, content) ");
			sql.append(" values(?, ?, ?, ?) ");
			pstmt = conn.prepareStatement(sql.toString());
			
			int loc = 1;
			pstmt.setInt(loc++, board.getNo());
			pstmt.setString(loc++, board.getTitle());
			pstmt.setString(loc++, board.getWriter());
			pstmt.setString(loc++, board.getContent());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(pstmt, conn);
		}
		
	}
	
	public void updateViewCnt(int no) {
		StringBuilder sql = new StringBuilder();
		sql.append("update t_board set view_cnt = view_cnt + 1 ");
		sql.append(" where no = ?");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	
}
