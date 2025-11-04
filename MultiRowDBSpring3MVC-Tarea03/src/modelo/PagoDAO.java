/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package modelo;

import beans.Pago;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcDaoSupport;
import org.springframework.jdbc.core.simple.SimpleJdbcTemplate;

/*
 * @author Administrador
 */
public class PagoDAO extends SimpleJdbcDaoSupport{

    private static final String CONSULTATODOS = "SELECT * FROM pago";
    //private static final String INSERTAPERSONA = "insert into Credito ()";
    private static final String MODIFICAPERSONA =
            "UPDATE pago SET pagos = ? WHERE id = ?";

    class PagosRowMapper implements ParameterizedRowMapper<Pago>  {

        public Pago mapRow( ResultSet rs, int numeroRenglon ) throws SQLException {
            
            Pago to = new Pago();
            to.setId( rs.getInt("id"));
            to.setFecha( rs.getString( "fecha" ) );
            to.setMes(rs.getString("mes"));
            to.setTarjeta( rs.getString( "tarjeta" ) );
            to.setTransaccion( rs.getString( "transaccion" ) );
            to.setGastos( rs.getString( "gastos" ) );
            to.setPagos( rs.getString( "pagos" ) );
            return to;
        }
    }

    public ArrayList<Pago> consultaTodos() {
    	
        SimpleJdbcTemplate sjdbc = getSimpleJdbcTemplate();
        ArrayList<Pago> lista =
                (ArrayList<Pago>) sjdbc.query( CONSULTATODOS, new PagosRowMapper() );
        return lista;
    }
        
    public void modificaPago( Pago pago ) {
    	
    	System.out.print("Modificando...");
        SimpleJdbcTemplate sjdbct = getSimpleJdbcTemplate();
        sjdbct.update( MODIFICAPERSONA, pago.getPagos(), pago.getId());
    }
}
