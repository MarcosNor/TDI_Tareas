package beans;

public class Pago {

    private int id;
    private String fecha;
    private String mes;
    private String tarjeta;
    private String transaccion;
    private String gastos;
    private String pagos;

    public Pago() {
    }

    public Pago(int id, String fecha, String mes, String tarjeta, String transaccion, String gastos, String pagos) {
        this.id = id;
        this.fecha = fecha;
        this.mes = mes;
        this.tarjeta = tarjeta;
        this.transaccion = transaccion;
        this.gastos = gastos;
        this.pagos = pagos;
    }

    // Getters y Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getMes() {
        return mes;
    }

    public void setMes(String mes) {
        this.mes = mes;
    }

    public String getTarjeta() {
        return tarjeta;
    }

    public void setTarjeta(String tarjeta) {
        this.tarjeta = tarjeta;
    }

    public String getTransaccion() {
        return transaccion;
    }

    public void setTransaccion(String transaccion) {
        this.transaccion = transaccion;
    }

    public String getGastos() {
        return gastos;
    }

    public void setGastos(String gastos) {
        this.gastos = gastos;
    }

    public String getPagos() {
        return pagos;
    }

    public void setPagos(String pagos) {
        this.pagos = pagos;
    }
}
