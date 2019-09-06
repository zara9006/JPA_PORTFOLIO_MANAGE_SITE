package site.zaraportfolio.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter @Setter
public class Education extends BaseEntity {

	@Id @GeneratedValue
	@Column(name = "EDUCATION_ID")
	private Long id;
	
	private String schoolName;
	
	private String period;
	
	@Lob
	private String content;
	
	public void changeDate(Education edu) {
		if(edu.getContent() != null) this.content = edu.getContent();
		if(edu.getPeriod() != null) this.period = edu.getPeriod();
		if(edu.getSchoolName() != null) this.schoolName = edu.getSchoolName();
		this.setLastModifiedDate(new Date());
	}
	
}
