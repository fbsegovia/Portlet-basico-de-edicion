<%@page import="modelo.entidades.Persona"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/portlet" prefix="portlet"%>

	<!-- Como para obtener las preferencias tenemos que usar la RenderRequest debemos de tener
  una referencia a dicho objeto.
  Para cargar dicha referencia con el objeto y ptros más debemos usar la siguiente etiqueta -->
  <portlet:defineObjects/>  	 		 

    <%
    	List<Persona> listaPersonas = (List<Persona>)request.getAttribute("listaPersonas");
    
   		 //Las preferencias vienen en el RenderREquest.
   		/*Como hemos add la etiqueta   <portlet:defineObjects/>  
   		 ahora podemos usar la RenderRequest para obtener las preferencias*/
   		 String mostrarNombre = renderRequest.getPreferences()
   		 //OJO!! Cuando pedimos un valor a las preferencias es posible que no exista, por lo que 
   		 //el API (o librerias) nos obliga a dar un valor por defecto, que sería el segundo parametro
   		 //el primer parametro corresponderia a la clave.
   		 .getValue("mostrarNombre", "");
   		 
   		String mostrarDireccion = renderRequest.getPreferences().getValue("mostrarDireccion", "");
   		String mostrarTelefono = renderRequest.getPreferences().getValue("mostrarTelefono", "");
   		String color = renderRequest.getPreferences().getValue("color", "#ff0000");
    %>
    
<table border="1" style="background-color:<%=color%>">
	
  <tr>
  	<%
  		if(mostrarNombre.equals("checked")){
  	%>
  	<th>Nombre</th>
  	<%
  	}
  	if(mostrarDireccion.equals("checked")){
  	%>
    <th>Dirección</th>
    <%
    }
    if(mostrarTelefono.equals("checked")){
    %>
    <th>Teléfono</th>
    <%
    }
    %>
  </tr>
  
  	<%
  	for(Persona persona : listaPersonas){
  	%>
    <tr>
	    <%
	  		if(mostrarNombre.equals("checked")){
	  	%>
   		<td><%=persona.getNombre()%></td>
   		<%
	  	}
	  	if(mostrarDireccion.equals("checked")){
	  	%>
    	<td><%=persona.getDireccion()%></td>
    	<%
    	 }
	    if(mostrarTelefono.equals("checked")){
	    %>
    	<td><%=persona.getTelefono()%></td>
    	 <%
	    }
	    %>
 	</tr>
    <%
    }
    %>
</table>

    
    
    
    
    