package site.zaraportfolio.domain;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter @Setter
public class Member {
	
	@Id @GeneratedValue
	@Column(name = "MEMBER_ID")
	private int id;
	
	private String password;
	
	private int likes;
	
	@OneToMany(mappedBy = "member")
	private List<MemberLikes> likesList = new ArrayList<MemberLikes>();
	
	/* 좋아요 변경 함수 */
	public void plusLikes() {
		this.likes += 1;
	}
	public void minusLikes() {
		this.likes -= 1;
	}
	
}
