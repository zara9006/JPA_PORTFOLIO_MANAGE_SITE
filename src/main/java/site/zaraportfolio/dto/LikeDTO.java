package site.zaraportfolio.dto;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class LikeDTO {
	
	private int likes;
	
	private boolean state;
	
	public LikeDTO() {}
	public LikeDTO(boolean state,int likes) {
		this.likes =likes;
		this.state = state;
	}
	
}
