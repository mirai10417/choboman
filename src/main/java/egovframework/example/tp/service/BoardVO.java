package egovframework.example.tp.service;

public class BoardVO {
	private int bno;
	private String bwriter;
	private String btitle;
	private String bcontent;
	private String bdate;
	private int hit;
	private String ncheck;
	private int parent_bno;
	private int rp;
	private String secpw;
	private String seccheck;
	private String alarm;
	private String id;
	
	public BoardVO() {
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public String getAlarm() {
		return alarm;
	}

	public void setAlarm(String alarm) {
		this.alarm = alarm;
	}

	public String getSecpw() {
		return secpw;
	}

	public void setSecpw(String secpw) {
		this.secpw = secpw;
	}

	public String getSeccheck() {
		return seccheck;
	}

	public void setSeccheck(String seccheck) {
		this.seccheck = seccheck;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getBwriter() {
		return bwriter;
	}

	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public String getBdate() {
		return bdate;
	}

	public void setBdate(String bdate) {
		this.bdate = bdate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getNcheck() {
		return ncheck;
	}

	public void setNcheck(String ncheck) {
		this.ncheck = ncheck;
	}

	public int getParent_bno() {
		return parent_bno;
	}

	public void setParent_bno(int parent_bno) {
		this.parent_bno = parent_bno;
	}

	public int getRp() {
		return rp;
	}

	public void setRp(int rp) {
		this.rp = rp;
	}

	
	
}
