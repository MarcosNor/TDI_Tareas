<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Lista de Pagos</title>
</head>
<body>

<h2>Datos del credito</h2>

<form:form id="creditoForm" method="post" modelAttribute="credito">
  <div class="row">
    <div>
      <label>Fecha</label>
      <input type="date" name="fecha" required>
    </div>

    <div>
      <label>Moneda</label>
      <label><input type="radio" name="moneda" value="Soles (S/.)" checked> Soles (S/.)</label>
      <label><input type="radio" name="moneda" value="Dolares (US$)"> Dolares (US$)</label>
    </div>

    <div>
      <label>Monto</label>
      <input type="number" step="0.01" min="0" name="monto" required>
    </div>

    <div>
      <label>Periodo (meses)</label>
      <input type="number" min="1" name="periodoMeses" required>
    </div>

    <div>
      <label>Cuota</label>
      <input type="number" step="0.01" min="0" name="cuota">
    </div>

    <div>
      <label>TEA (%)</label>
      <input type="number" step="0.01" min="0" name="tea">
    </div>

    <div>
      <label>Fecha de vencimiento</label>
      <input type="date" name="fechaVenc">
    </div>
  </div>

  <div class="actions">
    <input type="button" value="ACEPTAR" onclick="guardarCredito()">
  </div>
</form:form>

<script>
function guardarCredito() {
    var formData = new FormData(document.getElementById('creditoForm'));
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'addCreditoAjax.html', true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            alert('Credito guardado exitosamente');
            document.getElementById('creditoForm').reset();
        } else if (xhr.readyState === 4) {
            alert('Error al guardar el credito');
        }
    };
    xhr.send(formData);
}
</script>

<h2>Agregar Pagos</h2>
<form:form method="post" action="save.html" modelAttribute="listapagos">
	<table border="1" bgcolor="FFFF00">
		<tr bgcolor="FFDD01">
			<th>Num</th>
			<th>ID</th>
			<th>Fecha</th>
			<th>Mes</th>
			<th>Tarjeta</th>
			<th>Transacci�n</th>
			<th>Gastos</th>
			<th>Pagos</th>
		</tr>
		<c:forEach items="${listapagos.pagos}" var="pago" varStatus="status">
			<tr>
				<td align="center">${status.count}</td>
				<td><input name="pagos[${status.index}].id" value="${pago.id}" readonly/></td>
				<td><input name="pagos[${status.index}].fecha" value="${pago.fecha}" readonly/></td>
				<td><input name="pagos[${status.index}].mes" value="${pago.mes}" readonly/></td>
				<td><input name="pagos[${status.index}].tarjeta" value="${pago.tarjeta}" readonly/></td>
				<td><input name="pagos[${status.index}].transaccion" value="${pago.transaccion}" readonly /></td>
				<td><input name="pagos[${status.index}].gastos" value="${pago.gastos}" readonly/></td>
				<td><input name="pagos[${status.index}].pagos" value="${pago.pagos}"/></td>
			</tr>
		</c:forEach>
	</table>
	<br/>
	<input type="submit" value="Guardar" />
</form:form>
</body>
</html>
