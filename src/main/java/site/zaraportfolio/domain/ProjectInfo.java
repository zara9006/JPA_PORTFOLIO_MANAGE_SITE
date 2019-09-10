package site.zaraportfolio.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "PROJECT_INFORMATION")
@Getter @Setter
public class ProjectInfo {
	
	@Id @GeneratedValue
	@Column(name = "PROJECTINFO_ID")
	private Long id;
	
	private String period;
	
	private String environment;
	
	private String language;
	
	private String library;
	
	private String position;
	
	@Lob
	private String content;
	
	@OneToOne(mappedBy = "projectInfo")
	private Project project;
	
}
