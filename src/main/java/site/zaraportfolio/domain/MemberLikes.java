package site.zaraportfolio.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter @Setter
public class MemberLikes {
	
	@ManyToOne
	@JoinColumn(name = "MEMBER_ID")
	private Member member;
	
	@Id
	@Column(name = "ip")
	private String md5IP;
	
	public MemberLikes() {
		
	}
	
	public MemberLikes(String ip,Member member) {
		this.md5IP = ip;
		this.member = member;
		member.plusLikes();
	}
	
}
