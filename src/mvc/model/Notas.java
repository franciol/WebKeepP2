package mvc.model;

public class Notas {
	Usuario usuario = new Usuario();
	
	private Integer idNota;
	private Integer idUsuario;
	private String conteudoNota;
	
	public Integer getIdUsuario() {return this.idUsuario;}
	public void setIdUsuario() {this.idUsuario = usuario.getIdUsuario();}
	
	public Integer getIdNota() {return this.idNota;}
	public void setIdNota(Integer idNota) {this.idNota = idNota;}
	public String getConteudoNota() {return conteudoNota;}
	public void setConteudoNota(String conteudoNota) {this.conteudoNota = conteudoNota;}
	

}
