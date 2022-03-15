package vo;

import java.util.Random;

public class GameData {
	
	int xl; //HP
	int ll; //MP
	int mj; //Agility
	String jn; //Skill
	int jnhll; //MP consumed(By skill)
	int gj; //Attack
	int fy; //Defense
	
	
	public int getFy() {
		return fy;
	}

	public void setFy(int fy) {
		this.fy = fy;
	}

	public GameData() {
		super();
	}
	
	public int getXl() {
		return xl;
	}
	public void setXl(int xl) {
		this.xl = xl;
	}
	public int getLl() {
		return ll;
	}
	public void setLl(int ll) {
		this.ll = ll;
	}
	public int getMj() {
		return mj;
	}
	public void setMj(int mj) {
		this.mj = mj;
	}
	public String getJn() {
		return jn;
	}
	public void setJn(String jn) {
		this.jn = jn;
	}
	public int getJnhll() {
		return jnhll;
	}
	public void setJnhll(int jnhll) {
		this.jnhll = jnhll;
	}
	public int getGj() {
		return gj;
	}
	public void setGj(int gj) {
		this.gj = gj;
	}
	
	

}
