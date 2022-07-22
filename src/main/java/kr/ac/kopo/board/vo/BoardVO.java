package kr.ac.kopo.board.vo;
/*
 * alt + shift + s 누른 후	c	: 기본생성자
 * 							o	: 매개변수 생성자
 * 							r	: getter/setter
 * 							s	: toString()
 */
/**
 * t_board 테이블의 레코드의 정보 저장 클래스
 *
 */
public class BoardVO {
	private int no;
	private String title;
	private String writer;
	private String content;
	private int viewCnt;
	// db에서 select 문으로 가공해서 가져오기 때문에 Date형으로 가져오지 않아도 된다.
	private String regDate;
	
	

	public BoardVO() {
		super();
	}
	
	public BoardVO(int no, String title, String writer, String content, int viewCnt, String regDate) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.viewCnt = viewCnt;
		this.regDate = regDate;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", title=" + title + ", writer=" + writer + ", content=" + content + ", viewCnt="
				+ viewCnt + ", regDate=" + regDate + "]";
	}
	
	public BoardVO(String title, String writer) {
		super();
		this.title = title;
		this.writer = writer;
	}
	
}
