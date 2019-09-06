package site.zaraportfolio.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "INTRODUCE_MYSELF")
@Getter @Setter
public class MyInfo {

	@Id @GeneratedValue
	@Column(name = "INTRODUCE_ID")
	private Long id;

	@Enumerated(EnumType.STRING)
	private KeyWord keyword;
	
	private String title;
	
	@Lob
	private String content;
	
	public void changeData(MyInfo myInfo) {
		if(myInfo.getContent() != null) this.content = myInfo.getContent();
		if(myInfo.getKeyword() != null) this.keyword = myInfo.getKeyword();
		if(myInfo.getTitle() != null) this.title = myInfo.getTitle();
	}
	
}
