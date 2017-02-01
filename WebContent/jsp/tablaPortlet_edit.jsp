<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/portlet" prefix="portlet"%>
<portlet:defineObjects/>  
      
       <%
    	String mostrarNombre = renderRequest.getPreferences().getValue("mostrarNombre", "");
   		String mostrarDireccion = renderRequest.getPreferences().getValue("mostrarDireccion", "");
   		String mostrarTelefono = renderRequest.getPreferences().getValue("mostrarTelefono", "");
   		String color = renderRequest.getPreferences().getValue("color", "#ff0000");
    %>
    
    
    
<h2>Seleccione los atributos a mostrar en la tabla</h2>
<form action="<portlet:actionURL/>" method="post">
	Nombre:<input type="checkbox" name="nombre" <%=mostrarNombre%>/><br/>
	Dirección:<input type="checkbox" name="direccion" <%=mostrarDireccion%>/><br/>
	Teléfono:<input type="checkbox" name="telefono" <%=mostrarTelefono%>/><br/>
	Color:<input type="color" name="color" value=<%=color%>/><br/>
	<input type="submit" name="accion" value="Guardar">
</form>
    
    
    