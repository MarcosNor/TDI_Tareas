package control;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import beans.Pago;
import beans.ListaPagos;

import modelo.PagoDAO;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationObjectSupport;
import org.springframework.web.context.support.WebApplicationContextUtils;

@Controller
public class PagoControl {
	
	@RequestMapping( value = "/get", method = RequestMethod.GET )
	public ModelAndView get() {
        
        ApplicationContext context = new ClassPathXmlApplicationContext( "Spring-Datasource.xml" );	            
        PagoDAO dao = (PagoDAO)context.getBean( "pagoDAO" );
        		
    	ArrayList<Pago> lista = dao.consultaTodos();
    			
		ListaPagos listapagos = new ListaPagos();
		listapagos.setPagos( lista );
				
		return new ModelAndView( "add_contacto" , "listapagos", listapagos );
	}
	
	@RequestMapping( value = "/save", method = RequestMethod.POST )
	public ModelAndView save( @ModelAttribute("listapagos") ListaPagos listapagos ) {

		List<Pago> lista = listapagos.getPagos();
        ApplicationContext context = new ClassPathXmlApplicationContext( "Spring-Datasource.xml" );	            
        PagoDAO dao = (PagoDAO) context.getBean( "pagoDAO" );

		if( null != lista && lista.size() > 0 ) {
			System.out.print("Size: " + lista.size());
			for( Pago pago : lista ) {
				System.out.print(pago.getPagos());
				System.out.printf( "%s \t %s \n", pago.getFecha(), pago.getTransaccion() );
				dao.modificaPago( pago );
			}
		 }		
		return new ModelAndView( "show_contacto", "listapagos", listapagos );
	}		
}
