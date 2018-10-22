package mvc.controller;


import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import mvc.model.Usuario;
import mvc.model.UsuarioDAO;;

@Controller
public class UsuarioController {
	@RequestMapping("registro")
	public String registro() {
		return "loginForm";
	}

	@RequestMapping(value = "efetuaRegistro", method = RequestMethod.POST)
	public String upload(Usuario usuario) throws IOException {
		UsuarioDAO dao = new UsuarioDAO();
		dao.adiciona(usuario);
		return "redirect:loginForm";
	}

	@RequestMapping("loginForm")
	public String loginForm() {
		return "formulario-login";
	}

	@RequestMapping(value="efetuaLogin", method = RequestMethod.POST)
	public String efetuaLogin(Usuario usuario, HttpSession session) {
		if (new UsuarioDAO().existeUsuario(usuario)) {
			session.setAttribute("codeSecret", "4c3612addf40046d0475529b59f771fc");
			
			session.setAttribute("usuarioLogado", usuario.getEmail());
			System.out.println("Usuario logando: "+session.getAttribute("usuarioLogado"));
			return "WebKeep";
		}
		return "redirect:loginForm";
	}

	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:loginForm";
	}
}