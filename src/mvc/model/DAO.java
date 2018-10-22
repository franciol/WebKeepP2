package mvc.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DAO {
	
	private Connection connection = null;
	private int nextId;

	public DAO() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {
			connection = DriverManager.getConnection("jdbc:mysql://localhost/projeto1?useTimezone=true&serverTimezone=UTC", "root", "googleex");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	
	public List<Notas> getListaNotas() {
		List<Notas> notas = new ArrayList<Notas>();
		try {
			PreparedStatement stmt = connection.prepareStatement("SELECT * FROM Notas");
			ResultSet rs = stmt.executeQuery();
			
			while (rs.next()) {
				Notas nota = new Notas();
				nota.setIdNota(rs.getInt("idNota"));
				nota.setConteudoNota(rs.getString("conteudoNota"));
				System.out.println("Conteudo: "+nota.getConteudoNota());
				notas.add(nota);
		}
			rs.close();
			stmt.close();

		}
		
		catch (SQLException e1) {
			e1.printStackTrace();
		}		
		return notas;
		
	}
	
	
	public void close() {
		try {
			connection.close();
		} 
		
		catch (SQLException e) {
			e.printStackTrace();
		}
	}	
	
	
	public void adicionaNota(Notas nota) {
		String sql = "INSERT INTO Notas (conteudoNota) values(?)";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, nota.getConteudoNota());
			System.out.println("Conteudo: "+nota.getConteudoNota());
			stmt.execute();
			stmt.close();
		} 
		
		catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	public void alteraNota(Notas notas) {
		String sql = "UPDATE Notas SET " + "conteudoNota=? WHERE idNota=?";
		
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, notas.getConteudoNota());
			stmt.setInt(2, notas.getIdNota());
			stmt.execute();
			stmt.close();
		} 
		
		catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
	public void removeNota(Notas notas) {
		try {
			PreparedStatement stmt = connection.prepareStatement("DELETE FROM Notas WHERE idNota=?");
			stmt.setLong(1,  notas.getIdNota());
			stmt.execute();
			stmt.close();
		} 
		
		catch (SQLException e) {
			e.printStackTrace();
		}
				
	}
	
}