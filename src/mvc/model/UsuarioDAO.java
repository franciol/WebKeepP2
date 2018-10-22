package mvc.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mvc.model.Usuario;

public class UsuarioDAO {
	private Connection connection = null;

	public UsuarioDAO() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(
					"jdbc:mysql://localhost/projeto1?useTimezone=true&serverTimezone=UTC", "root", "googleex");
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public void adiciona(Usuario usuario) throws IOException {
		/* Rotina para salvar o arquivo no servidor */
		try {
			String sql = "INSERT INTO usuario (email, nome, sobrenome, senha) values(?,?,?,?)";
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, usuario.getEmail());
			stmt.setString(2, usuario.getNome());
			stmt.setString(3, usuario.getSobrenome());
			stmt.setString(4, usuario.getSenha());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public boolean existeUsuario(Usuario usuario) {
		boolean existe = false;
		try {

			String sql = "SELECT * FROM usuario WHERE usuario.email=?";

			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, usuario.getEmail());
			stmt.execute();

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				if (rs.getString("senha").equals(usuario.getSenha())) {
					existe = true;
				} else {
					existe = false;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return existe;
	}

	public List<Usuario> getListaUsuarios() {

		List<Usuario> usuarios = new ArrayList<Usuario>();

		try {
			PreparedStatement stmt = connection.prepareStatement("SELECT * FROM Usuarios");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Usuario usuario = new Usuario();
				usuario.setIdUsuario(rs.getInt("idUsuario"));
				usuario.setEmail(rs.getString("email"));
				usuario.setNome(rs.getString("nome"));
				usuario.setSobrenome(rs.getString("sobrenome"));
				usuarios.add(usuario);
			}
			rs.close();
			stmt.close();

		}

		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return usuarios;

	}

	public void removeUsuario(Integer idUsuario) {
		try {
			PreparedStatement stmt = connection.prepareStatement("DELETE FROM Usuarios WHERE id=?");
			stmt.setLong(1, idUsuario);
			stmt.execute();
			stmt.close();
		}

		catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
