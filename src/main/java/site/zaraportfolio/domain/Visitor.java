package site.zaraportfolio.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "VISITORS_LOG")
@Getter @Setter
public class Visitor {

	@Id
	@Column(name = "VISIT_ID")
	private String date;
	
	private int count;
	
	public void plusCount() {
		this.count += 1;
	}
	
}
