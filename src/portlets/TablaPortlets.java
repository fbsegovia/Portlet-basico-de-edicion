package portlets;

import java.io.IOException;
import java.util.List;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.GenericPortlet;
import javax.portlet.PortletException;
import javax.portlet.PortletMode;
import javax.portlet.PortletPreferences;
import javax.portlet.PortletRequestDispatcher;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import modelo.entidades.Persona;
import modelo.negocio.GestorPersonas;

public class TablaPortlets extends GenericPortlet{
	
	@Override
	protected void doView(RenderRequest request, RenderResponse response) throws PortletException, IOException {
		GestorPersonas gp = new GestorPersonas();
		List<Persona> listaPersonas =  gp.getListaPersonas();
		request.setAttribute("listaPersonas", listaPersonas);
		PortletRequestDispatcher prd = getPortletContext().getRequestDispatcher("/jsp/tablaPortlet_view.jsp");
		prd.include(request, response);
	}
	
	@Override
	protected void doEdit(RenderRequest request, RenderResponse response) throws PortletException, IOException {
		PortletRequestDispatcher prd = getPortletContext().getRequestDispatcher("/jsp/tablaPortlet_edit.jsp");
		prd.include(request, response);
	}
	
	@Override
	public void processAction(ActionRequest request, ActionResponse response) throws PortletException, IOException {
		String accion =request.getParameter("accion");
		
		//Preguntamos si el boton pulsado es el de guardar.
		if(accion.equals("Guardar")){
			//Obtenemos el objeto preferencias que tiene formato (clave-valor) y es donde
			//podemos guardar lo que queramos, en este caso vamos a guardar el color y las
			//columnas de la tabla que vamos a guardar.
			PortletPreferences preferencias = request.getPreferences();
			
			//Partimos de la base de que no nos llega ninguna preferencia Chequeado.
			preferencias.setValue("mostrarNombre", "");
			preferencias.setValue("mostrarDireccion", "");
			preferencias.setValue("mostrarTelefono", "");
			
			if(request.getParameter("nombre") != null){
				preferencias.setValue("mostrarNombre", "checked");
			}
			if(request.getParameter("direccion") != null){
				preferencias.setValue("mostrarDireccion", "checked");
			}
			if(request.getParameter("telefono") != null){
				preferencias.setValue("mostrarTelefono", "checked");
			}
			String color = request.getParameter("color");
			preferencias.setValue("color", color);
			/*La funcion store() guarda las preferencias del cliente*/
			//Es importante persistir los cambios con el método Store
			preferencias.store();
			
			//Cuando pulsemo guardar queremos ir a doView.
			response.setPortletMode(PortletMode.VIEW);
			//Por lo que entraremos por doView.
			
		}
	}
	
}
