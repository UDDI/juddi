/*
 * Copyright 2001-2009 The Apache Software Foundation.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.apache.juddi.v3.tck;

import org.apache.commons.configuration.ConfigurationException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.juddi.v3.client.config.UDDIClient;
import org.apache.juddi.v3.client.transport.Transport;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;
import org.uddi.v3_service.UDDIInquiryPortType;
import org.uddi.v3_service.UDDIPublicationPortType;
import org.uddi.v3_service.UDDISecurityPortType;
import org.uddi.v3_service.UDDISubscriptionPortType;

/**
 * @author <a href="mailto:jfaath@apache.org">Jeff Faath</a>
 * @author <a href="mailto:kstam@apache.org">Kurt T Stam</a>
 */
public class UDDI_080_SubscriptionIntegrationTest 
{
	private static Log logger = LogFactory.getLog(UDDI_080_SubscriptionIntegrationTest.class);

	private static TckTModel tckTModel                    = null;
	private static TckBusiness tckBusiness                = null;
	private static TckBusinessService tckBusinessService  = null;
	private static TckBindingTemplate tckBindingTemplate  = null;
	private static TckSubscription tckSubscription = null;

	private static String authInfoJoe = null;
	private static String authInfoSam = null;
	private static UDDIClient manager;

	@AfterClass
	public static void stopManager() throws ConfigurationException {
		manager.stop();
	}
	
	@BeforeClass
	public static void startManager() throws ConfigurationException {
		manager  = new UDDIClient();
		manager.start();
		
		logger.debug("Getting auth tokens..");
		try {
			 Transport transport = manager.getTransport();
        	 UDDISecurityPortType security = transport.getUDDISecurityService();
        	 authInfoJoe = TckSecurity.getAuthToken(security, TckPublisher.getJoePublisherId(),  TckPublisher.getJoePassword());
        	 authInfoSam = TckSecurity.getAuthToken(security, TckPublisher.getSamPublisherId(),  TckPublisher.getSamPassword());
        	 Assert.assertNotNull(authInfoJoe);
        	 UDDISubscriptionPortType subscription = transport.getUDDISubscriptionService();
        	 
        	 UDDIPublicationPortType publication = transport.getUDDIPublishService();
        	 UDDIInquiryPortType inquiry = transport.getUDDIInquiryService();
        	 tckTModel  = new TckTModel(publication, inquiry);
        	 tckBusiness = new TckBusiness(publication, inquiry);
        	 tckBusinessService = new TckBusinessService(publication, inquiry);
        	 tckBindingTemplate = new TckBindingTemplate(publication, inquiry);

        	 tckSubscription = new TckSubscription(subscription, security);
 			 String authInfoUDDI  = TckSecurity.getAuthToken(security, TckPublisher.getUDDIPublisherId(),  TckPublisher.getUDDIPassword());
 			 tckTModel.saveUDDIPublisherTmodel(authInfoUDDI);
 			 tckTModel.saveTModels(authInfoUDDI, TckTModel.TMODELS_XML);
	     } catch (Exception e) {
	    	 logger.error(e.getMessage(), e);
				Assert.fail("Could not obtain authInfo token.");
	     } 
	}
	
	@Test
	public void joePublisher() {
		try {
			tckTModel.saveJoePublisherTmodel(authInfoJoe);
			tckBusiness.saveJoePublisherBusiness(authInfoJoe);
			tckBusinessService.saveJoePublisherService(authInfoJoe);
			tckBindingTemplate.saveJoePublisherBinding(authInfoJoe);
			tckSubscription.saveJoePublisherSubscription(authInfoJoe);
			tckSubscription.getJoePublisherSubscriptionResults(authInfoJoe);
		} 
		finally {
			tckSubscription.deleteJoePublisherSubscription(authInfoJoe);
			tckBindingTemplate.deleteJoePublisherBinding(authInfoJoe);
			tckBusinessService.deleteJoePublisherService(authInfoJoe);
			tckBusiness.deleteJoePublisherBusiness(authInfoJoe);
			tckTModel.deleteJoePublisherTmodel(authInfoJoe);
		}
	}

	@Test
	public void samSyndicator() {
		try {
			tckTModel.saveSamSyndicatorTmodel(authInfoSam);
			tckBusiness.saveSamSyndicatorBusiness(authInfoSam);
			tckBusinessService.saveSamSyndicatorService(authInfoSam);
			tckSubscription.saveSamSyndicatorSubscription(authInfoSam);
			tckSubscription.getSamSyndicatorSubscriptionResults(authInfoSam);
		} 
		finally {
			tckSubscription.deleteSamSyndicatorSubscription(authInfoSam);
			tckBusinessService.deleteSamSyndicatorService(authInfoSam);
			tckBusiness.deleteSamSyndicatorBusiness(authInfoSam);
			tckTModel.deleteSamSyndicatorTmodel(authInfoSam);
		}
		
	}

	@Test
	public void samSyndicatorWithChunkingOnFind() {
		try {
			tckTModel.saveSamSyndicatorTmodel(authInfoSam);
			tckBusiness.saveSamSyndicatorBusiness(authInfoSam);
			tckBusinessService.saveSamSyndicatorService(authInfoSam);
			tckSubscription.saveSamSyndicatorSubscriptionWithChunkingOnFind(authInfoSam);
			tckSubscription.getSamSyndicatorSubscriptionResultsWithChunkingOnFind(authInfoSam);
		} 
		finally {
			tckSubscription.deleteSamSyndicatorSubscriptionWithChunkingOnFind(authInfoSam);
			tckBusinessService.deleteSamSyndicatorService(authInfoSam);
			tckBusiness.deleteSamSyndicatorBusiness(authInfoSam);
			tckTModel.deleteSamSyndicatorTmodel(authInfoSam);
		}
		
	}
	
	@Test
	public void samSyndicatorWithChunkingOnGet() {
		try {
			tckTModel.saveSamSyndicatorTmodel(authInfoSam);
			tckBusiness.saveSamSyndicatorBusiness(authInfoSam);
			tckBusinessService.saveSamSyndicatorService(authInfoSam);
			tckSubscription.saveSamSyndicatorSubscriptionWithChunkingOnGet(authInfoSam);
			tckSubscription.getSamSyndicatorSubscriptionResultsWithChunkingOnGet(authInfoSam);
		} 
		finally {
			tckSubscription.deleteSamSyndicatorSubscriptionWithChunkingOnGet(authInfoSam);
			tckBusinessService.deleteSamSyndicatorService(authInfoSam);
			tckBusiness.deleteSamSyndicatorBusiness(authInfoSam);
			tckTModel.deleteSamSyndicatorTmodel(authInfoSam);
		}
		
	}
	
}
