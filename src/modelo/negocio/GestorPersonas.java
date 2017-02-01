package modelo.negocio;

import java.util.ArrayList;
import java.util.List;

import modelo.entidades.Persona;

public class GestorPersonas {
	
	//La hacemos estatica para que no se inicialice cada vez.
	public static List<Persona> listaPersonas;
	
	static{
		listaPersonas = new ArrayList<>();
		
		Persona persona = new Persona();
		persona.setNombre("Lidia");
		persona.setDireccion("en un sitio especial");
		persona.setTelefono("67890987");
		listaPersonas.add(persona);
		
		persona = new Persona();
		persona.setNombre("Francisco");
		persona.setDireccion("la cruda realidad");
		persona.setTelefono("89562341");
		listaPersonas.add(persona);
		
		persona = new Persona();
		persona.setNombre("Pepe");
		persona.setDireccion("la calle de la piruleta");
		persona.setTelefono("78452163");
		listaPersonas.add(persona);
		
	}
	
	public List<Persona> getListaPersonas(){
		return listaPersonas;
	}
	
	
	
	
}
