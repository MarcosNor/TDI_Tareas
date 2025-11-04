package control;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import beans.Credito;
import beans.ListaCreditos;

import modelo.CreditoDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationObjectSupport;
import org.springframework.web.context.support.WebApplicationContextUtils;

@Controller
public class CreditoControl {
	
	ApplicationContext context = new ClassPathXmlApplicationContext("Spring-Datasource.xml");
	CreditoDAO dao = (CreditoDAO) context.getBean("creditoDAO");
	
	@RequestMapping( value = "/getCreditos", method = RequestMethod.GET )
	public ModelAndView getCreditos() {
        
        ApplicationContext context = new ClassPathXmlApplicationContext( "Spring-Datasource.xml" );	            
        CreditoDAO dao = (CreditoDAO)context.getBean( "creditoDAO" );
        		
    	ArrayList<Credito> lista = dao.consultaTodos();
    			
		ListaCreditos listacreditos = new ListaCreditos();
		listacreditos.setCreditos( lista );
				
		return new ModelAndView( "add_contacto" , "listacreditos", listacreditos );
	}
	
    @RequestMapping(value = "/saveCreditos", method = RequestMethod.POST)
    public ModelAndView saveCreditos(@ModelAttribute("listacreditos") ListaCreditos listacreditos) {
        List<Credito> lista = listacreditos.getCreditos();

        if (lista != null && !lista.isEmpty()) {
            System.out.println("Guardando créditos: " + lista.size());
            for (Credito credito : lista) {
                if (credito.getId() == null) {
                    dao.insertaCredito(credito); 
                } else {
                    dao.modificaCredito(credito); 
                }
            }
        }

        return new ModelAndView("show_credito", "listacreditos", listacreditos);
    }
	
	@RequestMapping(value = "/addCreditoAjax", method = RequestMethod.POST)
	@ResponseBody
	public String addCreditoAjax(@ModelAttribute("credito") Credito credito) {
	    try {
	        ApplicationContext context = new ClassPathXmlApplicationContext("Spring-Datasource.xml");
	        CreditoDAO dao = (CreditoDAO) context.getBean("creditoDAO");
	        dao.insertaCredito(credito);
	        return "ok";
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "error";
	    }
	}
	
}
