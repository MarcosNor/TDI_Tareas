<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Ejemplo Spring 3 MVC</title>
  </head>
<body>

	<h2>Créditos almacenados</h2>
	<table border="1" cellpadding="6">
	  <tr>
	    <th>ID</th><th>Fecha</th><th>Moneda</th><th>Monto</th><th>Periodo</th>
	  </tr>
	  <tr th:each="c : ${lista}">
	    <td th:text="${c.id}"></td>
	    <td th:text="${c.fecha}"></td>
	    <td th:text="${c.moneda}"></td>
	    <td th:text="${c.monto}"></td>
	    <td th:text="${c.periodoMeses}"></td>
	  </tr>
	</table>


  <h2>Lista de Pagos</h2>
  <table width="80%" border="1" bgcolor="FFFF00">
	<tr bgcolor="FFDD01">
        <th>Fecha</th>
        <th>Mes</th>
        <th>Tarjeta</th>
        <th>Transacción</th>
        <th>Gastos</th>
        <th>Pagos</th>	
	</tr>
	<c:forEach items="${listapagos.pagos}" var="pago" varStatus="status">
		<tr>
			<td>${pago.fecha}</td>	
			<td>${pago.mes}</td>	
			<td>${pago.tarjeta}</td>
			<td>${pago.transaccion}</td>
			<td>${pago.gastos}</td>	
			<td>${pago.pagos}</td>
		</tr>
	</c:forEach>
  </table>	
  <br/>
  <input type="button" value="Back" onclick="javascript:history.back()"/>
</body>
</html>