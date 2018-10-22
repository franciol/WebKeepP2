package mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.boot.web.servlet.server.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import mvc.model.DAO;
import mvc.model.Notas;

@Controller
public class TarefasController {
	@RequestMapping("/")
	public String execute() {
		System.out.println("Lógica do MVC");
		return "formulario-login";
	}

	@RequestMapping(value = "postaNota", method = RequestMethod.POST)
	public String adiciona(Notas nota) {
		System.out.println("Nota cont. : " + nota.getConteudoNota());
		DAO dao = new DAO();
		dao.adicionaNota(nota);
		return "WebKeep";
	}

	@RequestMapping(value = "alteraNota", method = RequestMethod.POST)
	public String altera(Notas nota) {
		DAO dao = new DAO();
		dao.alteraNota(nota);
		return "WebKeep";
	}

	@RequestMapping(value = "apagaNota", method = RequestMethod.POST)
	public String apaga(Notas nota) {
		DAO dao = new DAO();
		dao.removeNota(nota);
		return "WebKeep";
	}

	@RequestMapping("logaDeezer")
	public String loga() {
		return "recebendoInfo";
	}

	@RequestMapping("finalizaLogDeezer")
	public String logas() {
		return "finalRequst";
	}

	@RequestMapping(value = "pegaAccess", method = RequestMethod.POST)
	public String aces(String total, HttpSession session) {
		System.out.println("total " + total.substring(total.indexOf("=") + 1, total.indexOf("&")));
		session.setAttribute("access_token", total.substring(total.indexOf("=") + 1, total.indexOf("&")));

		return "WebKeep";

	}

	@RequestMapping("buscaDeezer")
	public String buscaSong() {
		return "buscaMusica";
	}

}