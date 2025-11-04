/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package modelo;

import beans.Credito;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcDaoSupport;
import org.springframework.jdbc.core.simple.SimpleJdbcTemplate;

/*
 * @author Administrador
 */
public class CreditoDAO extends SimpleJdbcDaoSupport{

    private static final String CONSULTATODOS = "SELECT * FROM credito";
    //private static final String INSERTAPERSONA = "insert into Credito ()";
    private static final String MODIFICA_CREDITO = 
            "UPDATE credito SET fecha=?, moneda=?, monto=?, periodoMeses=?, cuota=?, tea=?, fechaVenc=? WHERE id=?";


    class CreditosRowMapper implements ParameterizedRowMapper<Credito>  {

        public Credito mapRow( ResultSet rs, int numeroRenglon ) throws SQLException {
            
            Credito to = new Credito();
            to.setId( rs.getLong("id"));
            to.setFecha(rs.getDate("fecha").toLocalDate());
            to.setMoneda(rs.getString("moneda"));
            to.setMonto(rs.getBigDecimal("monto"));
            to.setPeriodoMeses(rs.getInt("periodoMeses"));
            to.setCuota(rs.getBigDecimal("cuota"));
            to.setTea(rs.getBigDecimal("tea"));
            to.setFechaVenc(rs.getDate("fechaVenc").toLocalDate());
            return to;
        }
    }

    public ArrayList<Credito> consultaTodos() {
    	
        SimpleJdbcTemplate sjdbc = getSimpleJdbcTemplate();
        ArrayList<Credito> lista =
                (ArrayList<Credito>) sjdbc.query( CONSULTATODOS, new CreditosRowMapper() );
        return lista;
    }
        
    public void modificaCredito( Credito credito ) {
    	
    	System.out.print("Modificando cŕedito...");
        SimpleJdbcTemplate sjdbct = getSimpleJdbcTemplate();
        sjdbct.update(MODIFICA_CREDITO,
                java.sql.Date.valueOf(credito.getFecha()),
                credito.getMoneda(),
                credito.getMonto(),
                credito.getPeriodoMeses(),
                credito.getCuota(),
                credito.getTea(),
                java.sql.Date.valueOf(credito.getFechaVenc()),
                credito.getId()
        );
    }
    public void insertaCredito(Credito credito) {
    	System.out.print("Insertando Crédito");
        String sql = "INSERT INTO credito (fecha, moneda, monto, periodoMeses, cuota, tea, fechaVenc) VALUES (?, ?, ?, ?, ?, ?, ?)";
        getJdbcTemplate().update(sql, 
            credito.getFecha(),
            credito.getMoneda(),
            credito.getMonto(),
            credito.getPeriodoMeses(),
            credito.getCuota(),
            credito.getTea(),
            credito.getFechaVenc()
        );
    }
}
