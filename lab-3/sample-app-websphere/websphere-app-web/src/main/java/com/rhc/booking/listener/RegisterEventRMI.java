package com.rhc.booking.listener;

import java.rmi.AlreadyBoundException;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.rhc.booking.services.impl.EventServerImpl;

/**
 * Registers the RMI Service to the server on WAR startup.
 * @author bradsdavis@gmail.com
 *
 */
@WebListener
public class RegisterEventRMI implements ServletContextListener {
	private static final Log log = LogFactory.getLog(RegisterEventRMI.class);
	private static final String BIND_LOCATION = "eventServer";
	
	public void contextDestroyed(ServletContextEvent event) {
		Registry registry;
		try {
			registry = LocateRegistry.getRegistry("127.0.0.1", 1099);
	        registry.unbind(BIND_LOCATION);
			log.info("ServletContextListener destroyed: "+BIND_LOCATION);
		} catch (Exception e) {
			log.error("Exception destroying service: "+BIND_LOCATION, e);
		}
	}

	public void contextInitialized(ServletContextEvent event) {
		Registry registry = null;
		try {
			registry = LocateRegistry.getRegistry("127.0.0.1", 1099);
			registry.bind("eventServer", new EventServerImpl());
			log.info("ServletContextListener retrieved. Service bound to: "+BIND_LOCATION);
		} catch (Exception e) {
			
			try {
				registry = LocateRegistry.createRegistry(1099);
				registry.bind("eventServer", new EventServerImpl());
				log.info("ServletContextListener created. Service bound to: "+BIND_LOCATION);
			}
			catch(Exception f) {
				log.error("Exception creating service: "+BIND_LOCATION, e);
				throw new RuntimeException("Exception creating registry.", f);
			}
		}
	}
}
