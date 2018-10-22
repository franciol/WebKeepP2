package mvc.model;

public class Notas {
	Usuario usuario = new Usuario();
	
	private Integer idNota;
	private Integer idUsuario;
	private String conteudoNota;
	private String songId;
	private String gifId;
	
	public String getGifId() {
		return gifId;
	}
	public void setGifId(String gifId) {
		this.gifId = gifId;
	}
	public String getSongId() {
		return songId;
	}
	public void setSongId(String songId) {
		this.songId = songId;
	}
	public Integer getIdUsuario() {return this.idUsuario;}
	public void setIdUsuario() {this.idUsuario = usuario.getIdUsuario();}
	
	public Integer getIdNota() {return this.idNota;}
	public void setIdNota(Integer idNota) {this.idNota = idNota;}
	public String getConteudoNota() {return conteudoNota;}
	public void setConteudoNota(String conteudoNota) {this.conteudoNota = conteudoNota;}
	

}
