/*
 * Copyright 2001-2009 The Apache Software Foundation.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */
package org.apache.juddi.portlets.server.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.juddi.api_v3.DeletePublisher;
import org.apache.juddi.api_v3.GetAllPublisherDetail;
import org.apache.juddi.api_v3.GetPublisherDetail;
import org.apache.juddi.api_v3.PublisherDetail;
import org.apache.juddi.api_v3.SavePublisher;
import org.apache.juddi.portlets.client.model.Publisher;
import org.apache.juddi.portlets.client.service.JUDDIApiResponse;
import org.apache.juddi.portlets.client.service.JUDDIApiService;
import org.apache.juddi.v3_service.JUDDIApiPortType;
import org.apache.log4j.Logger;
import org.apache.log4j.helpers.Loader;
import org.uddi.api_v3.client.config.ClientConfig;
import org.uddi.api_v3.client.config.Property;
import org.uddi.api_v3.client.transport.Transport;

import com.google.gwt.user.server.rpc.RemoteServiceServlet;
/**
 * 
 * @author <a href="mailto:kstam@apache.org">Kurt T Stam</a>
 *
 */
public class JUDDIApiServiceImpl extends RemoteServiceServlet implements JUDDIApiService {

	private Logger logger = Logger.getLogger(this.getClass());
	private static final long serialVersionUID = 1L;
	
	public JUDDIApiResponse getPublishers(String authToken, String publisherId) 
	{	
		GetPublisherDetail getPublisherDetail = new GetPublisherDetail();
		getPublisherDetail.setAuthInfo(authToken);
		getPublisherDetail.getPublisherId().add(publisherId);
		logger.debug("GetPublisherDetail " + getPublisherDetail + " sending get PublisherDetail request..");
		
		JUDDIApiResponse response = new JUDDIApiResponse();
		List<Publisher> publishers = new ArrayList<Publisher>();
		try {
	    	 String clazz = ClientConfig.getConfiguration().getString(Property.UDDI_PROXY_TRANSPORT,Property.DEFAULT_UDDI_PROXY_TRANSPORT);
	         Class<?> transportClass = Loader.loadClass(clazz);
        	 Transport transport = (Transport) transportClass.newInstance(); 
        	 JUDDIApiPortType apiService = transport.getJUDDIApiService();
        	 PublisherDetail publisherDetail = null;
        	 publisherDetail = apiService.getPublisherDetail(getPublisherDetail);
        	 //if the publisher is an admin, then return ALL publishers
        	 if ("true".equalsIgnoreCase(publisherDetail.getPublisher().get(0).getIsAdmin())) {
        		 GetAllPublisherDetail getAllPublisherDetail = new GetAllPublisherDetail();
				 getAllPublisherDetail.setAuthInfo(authToken);
				 logger.debug("GetAllPublisherDetail " + getAllPublisherDetail + " sending get AllPublisherDetail request..");
				 publisherDetail = apiService.getAllPublisherDetail(getAllPublisherDetail);
        	 }
        	 for (org.apache.juddi.api_v3.Publisher apiPublisher : publisherDetail.getPublisher()) {
				Publisher publisher = new Publisher();
				BeanUtils.copyProperties(publisher, apiPublisher);
				publishers.add(publisher);
			 }
        	 response.setSuccess(true);
        	 response.setPublishers(publishers);
	     } catch (Exception e) {
	    	 logger.error("Could not obtain publishers. " + e.getMessage(), e);
	    	 response.setSuccess(false);
	    	 response.setMessage(e.getMessage());
	    	 response.setErrorCode("102");
	     }  catch (Throwable t) {
	    	 logger.error("Could not obtain publishers. " + t.getMessage(), t);
	    	 response.setSuccess(false);
	    	 response.setMessage(t.getMessage());
	    	 response.setErrorCode("102");
	     } 
		 return response;
	}
	
	public JUDDIApiResponse savePublisher(String token, Publisher publisher) {
		JUDDIApiResponse response = new JUDDIApiResponse();
		try {
	    	 String clazz = ClientConfig.getConfiguration().getString(Property.UDDI_PROXY_TRANSPORT,Property.DEFAULT_UDDI_PROXY_TRANSPORT);
	         Class<?> transportClass = Loader.loadClass(clazz);
	       	 Transport transport = (Transport) transportClass.newInstance(); 
	       	 JUDDIApiPortType apiService = transport.getJUDDIApiService();
	       	 SavePublisher savePublisher = new SavePublisher();
	       	 savePublisher.setAuthInfo(token);
	       	 org.apache.juddi.api_v3.Publisher apiPublisher = new org.apache.juddi.api_v3.Publisher();
	       	 BeanUtils.copyProperties(apiPublisher, publisher);
	       	 savePublisher.getPublisher().add(apiPublisher);
	       	 PublisherDetail publisherDetail = apiService.savePublisher(savePublisher);
	       	 List<Publisher> publishers = new ArrayList<Publisher>();
	         for (org.apache.juddi.api_v3.Publisher apiPublisherOut : publisherDetail.getPublisher()) {
				Publisher publisherOut = new Publisher();
				BeanUtils.copyProperties(publisherOut, apiPublisherOut);
				publishers.add(publisher);
			 }
        	 response.setSuccess(true);
        	 response.setPublishers(publishers);
		} catch (Exception e) {
	    	 logger.error("Could not obtain publishers. " + e.getMessage(), e);
	    	 response.setSuccess(false);
	    	 response.setMessage(e.getMessage());
	    	 response.setErrorCode("102");
	     }  catch (Throwable t) {
	    	 logger.error("Could not obtain publishers. " + t.getMessage(), t);
	    	 response.setSuccess(false);
	    	 response.setMessage(t.getMessage());
	    	 response.setErrorCode("102");
	     } 
		return response;
	}
	
	public JUDDIApiResponse deletePublisher(String token, String publisherId) {
		JUDDIApiResponse response = new JUDDIApiResponse();
		try {
	    	 String clazz = ClientConfig.getConfiguration().getString(Property.UDDI_PROXY_TRANSPORT,Property.DEFAULT_UDDI_PROXY_TRANSPORT);
	         Class<?> transportClass = Loader.loadClass(clazz);
	       	 Transport transport = (Transport) transportClass.newInstance(); 
	       	 JUDDIApiPortType apiService = transport.getJUDDIApiService();
	       	 DeletePublisher deletePublisher = new DeletePublisher();
	         deletePublisher.setAuthInfo(token);
	       	 deletePublisher.getPublisherId().add(publisherId);
	       	 apiService.deletePublisher(deletePublisher);
        	 response.setSuccess(true);
		} catch (Exception e) {
	    	 logger.error("Could not obtain publishers. " + e.getMessage(), e);
	    	 response.setSuccess(false);
	    	 response.setMessage(e.getMessage());
	    	 response.setErrorCode("102");
	     }  catch (Throwable t) {
	    	 logger.error("Could not obtain publishers. " + t.getMessage(), t);
	    	 response.setSuccess(false);
	    	 response.setMessage(t.getMessage());
	    	 response.setErrorCode("102");
	     } 
		return response;
	}
	
}