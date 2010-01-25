/*
 * Copyright 2001-2008 The Apache Software Foundation.
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

package org.apache.juddi.api.impl;

import java.util.List;
import javax.jws.WebService;
import javax.persistence.EntityTransaction;
import javax.persistence.EntityManager;

import org.apache.commons.configuration.ConfigurationException;
import org.apache.juddi.mapping.MappingModelToApi;
import org.apache.juddi.v3.error.ErrorMessage;
import org.apache.juddi.v3.error.InvalidKeyPassedException;
import org.apache.juddi.validation.ValidateInquiry;
import org.apache.juddi.config.AppConfig;
import org.apache.juddi.config.PersistenceManager;
import org.apache.juddi.config.Property;
import org.uddi.api_v3.BindingDetail;
import org.uddi.api_v3.BusinessDetail;
import org.uddi.api_v3.BusinessList;
import org.uddi.api_v3.FindBinding;
import org.uddi.api_v3.FindBusiness;
import org.uddi.api_v3.FindRelatedBusinesses;
import org.uddi.api_v3.FindService;
import org.uddi.api_v3.FindTModel;
import org.uddi.api_v3.GetBindingDetail;
import org.uddi.api_v3.GetBusinessDetail;
import org.uddi.api_v3.GetOperationalInfo;
import org.uddi.api_v3.GetServiceDetail;
import org.uddi.api_v3.GetTModelDetail;
import org.uddi.api_v3.OperationalInfos;
import org.uddi.api_v3.RelatedBusinessesList;
import org.uddi.api_v3.ServiceDetail;
import org.uddi.api_v3.ServiceList;
import org.uddi.api_v3.TModelDetail;
import org.uddi.api_v3.TModelList;
import org.uddi.v3_service.DispositionReportFaultMessage;
import org.uddi.v3_service.UDDIInquiryPortType;
import org.apache.log4j.Logger;


/**
 * @author <a href="mailto:jfaath@apache.org">Jeff Faath</a>
 */
@WebService(serviceName="UDDIInquiryService", 
			endpointInterface="org.uddi.v3_service.UDDIInquiryPortType",
			targetNamespace = "urn:uddi-org:v3_service")
public class UDDIInquiryImpl extends AuthenticatedService implements UDDIInquiryPortType {

	private static Logger log = Logger.getLogger(UDDIInquiryImpl.class);

	public BindingDetail findBinding(FindBinding body)
			throws DispositionReportFaultMessage {

		new ValidateInquiry(null).validateFindBinding(body);
		
		EntityManager em = PersistenceManager.getEntityManager();
		EntityTransaction tx = em.getTransaction();
		try {
			tx.begin();
	
			if (isAuthenticated())
				this.getEntityPublisher(em, body.getAuthInfo());
			
			org.apache.juddi.query.util.FindQualifiers findQualifiers = new org.apache.juddi.query.util.FindQualifiers();
			findQualifiers.mapApiFindQualifiers(body.getFindQualifiers());
			
			List<?> keysFound = InquiryHelper.findBinding(body, findQualifiers, em);
	
			BindingDetail result = InquiryHelper.getBindingDetailFromKeys(body, findQualifiers, em, keysFound);
			tx.commit();
			return result;
		} finally {
			if (tx.isActive()) {
				tx.rollback();
			}
			em.close();
		}
	}

	public BusinessList findBusiness(FindBusiness body)
			throws DispositionReportFaultMessage {

		new ValidateInquiry(null).validateFindBusiness(body);
		
		EntityManager em = PersistenceManager.getEntityManager();
		EntityTransaction tx = em.getTransaction();
		try {
			tx.begin();
	
			if (isAuthenticated())
				this.getEntityPublisher(em, body.getAuthInfo());
			
			org.apache.juddi.query.util.FindQualifiers findQualifiers = new org.apache.juddi.query.util.FindQualifiers();
			findQualifiers.mapApiFindQualifiers(body.getFindQualifiers());
	
			List<?> keysFound = InquiryHelper.findBusiness(body, findQualifiers, em);
	
			BusinessList result = InquiryHelper.getBusinessListFromKeys(body, findQualifiers, em, keysFound);
			
			tx.commit();
			return result;
		} finally {
			if (tx.isActive()) {
				tx.rollback();
			}
			em.close();
		}
	}

	public RelatedBusinessesList findRelatedBusinesses(FindRelatedBusinesses body) 
			throws DispositionReportFaultMessage {

		new ValidateInquiry(null).validateFindRelatedBusinesses(body, false);
		
		EntityManager em = PersistenceManager.getEntityManager();
		EntityTransaction tx = em.getTransaction();
		try {
			tx.begin();
	
			if (isAuthenticated())
				this.getEntityPublisher(em, body.getAuthInfo());
			
			// TODO: findQualifiers aren't really used for this call, except maybe for sorting.  Sorting must be done in Java due to the retrieval method used.  Right now
			// no sorting is performed.
			org.apache.juddi.query.util.FindQualifiers findQualifiers = new org.apache.juddi.query.util.FindQualifiers();
			findQualifiers.mapApiFindQualifiers(body.getFindQualifiers());
			
			RelatedBusinessesList result = InquiryHelper.getRelatedBusinessesList(body, em);
			
			tx.commit();
			return result;
		} finally {
			if (tx.isActive()) {
				tx.rollback();
			}
			em.close();
		}
	}

	public ServiceList findService(FindService body)
			throws DispositionReportFaultMessage {

		new ValidateInquiry(null).validateFindService(body);
		
		EntityManager em = PersistenceManager.getEntityManager();
		EntityTransaction tx = em.getTransaction();
		try {
			tx.begin();
			
			if (isAuthenticated())
				this.getEntityPublisher(em, body.getAuthInfo());
			
			org.apache.juddi.query.util.FindQualifiers findQualifiers = new org.apache.juddi.query.util.FindQualifiers();
			findQualifiers.mapApiFindQualifiers(body.getFindQualifiers());
	
			List<?> keysFound = InquiryHelper.findService(body, findQualifiers, em);
	
			ServiceList result = InquiryHelper.getServiceListFromKeys(body, findQualifiers, em, keysFound);
			
			tx.commit();
			return result;
		} finally {
			if (tx.isActive()) {
				tx.rollback();
			}
			em.close();
		}
	}

	public TModelList findTModel(FindTModel body)
			throws DispositionReportFaultMessage {

		new ValidateInquiry(null).validateFindTModel(body, false);
		
		EntityManager em = PersistenceManager.getEntityManager();
		EntityTransaction tx = em.getTransaction();
		try {
			tx.begin();
	
			if (isAuthenticated())
				this.getEntityPublisher(em, body.getAuthInfo());
			
			org.apache.juddi.query.util.FindQualifiers findQualifiers = new org.apache.juddi.query.util.FindQualifiers();
			findQualifiers.mapApiFindQualifiers(body.getFindQualifiers());
	
			List<?> keysFound = InquiryHelper.findTModel(body, findQualifiers, em);
	
			TModelList result = InquiryHelper.getTModelListFromKeys(body, findQualifiers, em, keysFound);
			
			tx.commit();
			return result;
		} finally {
			if (tx.isActive()) {
				tx.rollback();
			}
			em.close();
		}
	}

	public BindingDetail getBindingDetail(GetBindingDetail body)
			throws DispositionReportFaultMessage {

		new ValidateInquiry(null).validateGetBindingDetail(body);
		
		EntityManager em = PersistenceManager.getEntityManager();
		EntityTransaction tx = em.getTransaction();
		try {
			tx.begin();
	
			if (isAuthenticated())
				this.getEntityPublisher(em, body.getAuthInfo());
			
			BindingDetail result = new BindingDetail();
	
			List<String> bindingKeyList = body.getBindingKey();
			for (String bindingKey : bindingKeyList) {
				
				org.apache.juddi.model.BindingTemplate modelBindingTemplate = em.find(org.apache.juddi.model.BindingTemplate.class, bindingKey);
				if (modelBindingTemplate == null)
					throw new InvalidKeyPassedException(new ErrorMessage("errors.invalidkey.BindingTemplateNotFound", bindingKey));
				
				org.uddi.api_v3.BindingTemplate apiBindingTemplate = new org.uddi.api_v3.BindingTemplate();
				
				MappingModelToApi.mapBindingTemplate(modelBindingTemplate, apiBindingTemplate);
				
				result.getBindingTemplate().add(apiBindingTemplate);
			}
	
			tx.commit();
			return result;
		} finally {
			if (tx.isActive()) {
				tx.rollback();
			}
			em.close();
		}
	}

	public BusinessDetail getBusinessDetail(GetBusinessDetail body)
			throws DispositionReportFaultMessage {
		
		new ValidateInquiry(null).validateGetBusinessDetail(body);
		
		EntityManager em = PersistenceManager.getEntityManager();
		EntityTransaction tx = em.getTransaction();
		try {
			tx.begin();
	
			if (isAuthenticated())
				this.getEntityPublisher(em, body.getAuthInfo());
			
			BusinessDetail result = new BusinessDetail();
			
			List<String> businessKeyList = body.getBusinessKey();
			for (String businessKey : businessKeyList) {
				
				org.apache.juddi.model.BusinessEntity modelBusinessEntity = em.find(org.apache.juddi.model.BusinessEntity.class, businessKey);
				if (modelBusinessEntity == null)
					throw new InvalidKeyPassedException(new ErrorMessage("errors.invalidkey.BusinessNotFound", businessKey));
				
				org.uddi.api_v3.BusinessEntity apiBusinessEntity = new org.uddi.api_v3.BusinessEntity();
				
				MappingModelToApi.mapBusinessEntity(modelBusinessEntity, apiBusinessEntity);
				
				result.getBusinessEntity().add(apiBusinessEntity);
			}
	
			tx.commit();
			return result;
		} finally {
			if (tx.isActive()) {
				tx.rollback();
			}
			em.close();
		}
	}

	public OperationalInfos getOperationalInfo(GetOperationalInfo body)
			throws DispositionReportFaultMessage {

		new ValidateInquiry(null).validateGetOperationalInfo(body);

		EntityManager em = PersistenceManager.getEntityManager();
		EntityTransaction tx = em.getTransaction();
		try {
			tx.begin();
	
			if (isAuthenticated())
				this.getEntityPublisher(em, body.getAuthInfo());
			
			OperationalInfos result = new OperationalInfos();
			
			List<String> entityKeyList = body.getEntityKey();
			for (String entityKey : entityKeyList) {
				
				org.apache.juddi.model.UddiEntity modelUddiEntity = em.find(org.apache.juddi.model.UddiEntity.class, entityKey);
				if (modelUddiEntity == null)
					throw new InvalidKeyPassedException(new ErrorMessage("errors.invalidkey.EntityNotFound", entityKey));
				
				org.uddi.api_v3.OperationalInfo apiOperationalInfo = new org.uddi.api_v3.OperationalInfo();
				
				MappingModelToApi.mapOperationalInfo(modelUddiEntity, apiOperationalInfo);
				
				result.getOperationalInfo().add(apiOperationalInfo);
			}
	
			tx.commit();
			return result;
		} finally {
			if (tx.isActive()) {
				tx.rollback();
			}
			em.close();
		}
	}

	public ServiceDetail getServiceDetail(GetServiceDetail body)
			throws DispositionReportFaultMessage {

		new ValidateInquiry(null).validateGetServiceDetail(body);
		
		EntityManager em = PersistenceManager.getEntityManager();
		EntityTransaction tx = em.getTransaction();
		try {
			tx.begin();
	
			if (isAuthenticated())
				this.getEntityPublisher(em, body.getAuthInfo());
			
			ServiceDetail result = new ServiceDetail();
	
			List<String> serviceKeyList = body.getServiceKey();
			for (String serviceKey : serviceKeyList) {
				
				org.apache.juddi.model.BusinessService modelBusinessService = em.find(org.apache.juddi.model.BusinessService.class, serviceKey);
				if (modelBusinessService == null)
					throw new InvalidKeyPassedException(new ErrorMessage("errors.invalidkey.ServiceNotFound", serviceKey));
				
				org.uddi.api_v3.BusinessService apiBusinessService = new org.uddi.api_v3.BusinessService();
				
				MappingModelToApi.mapBusinessService(modelBusinessService, apiBusinessService);
				
				result.getBusinessService().add(apiBusinessService);
			}
	
			tx.commit();
			return result;
			
		} finally {
			if (tx.isActive()) {
				tx.rollback();
			}
			em.close();
		}
	}

	public TModelDetail getTModelDetail(GetTModelDetail body)
			throws DispositionReportFaultMessage {

		new ValidateInquiry(null).validateGetTModelDetail(body);

		EntityManager em = PersistenceManager.getEntityManager();
		EntityTransaction tx = em.getTransaction();
		try {
			tx.begin();
	
			if (isAuthenticated())
				this.getEntityPublisher(em, body.getAuthInfo());
			
			TModelDetail result = new TModelDetail();
			
			List<String> tmodelKeyList = body.getTModelKey();
			for (String tmodelKey : tmodelKeyList) {
				
				org.apache.juddi.model.Tmodel modelTModel = em.find(org.apache.juddi.model.Tmodel.class, tmodelKey);
				if (modelTModel == null) {
					throw new InvalidKeyPassedException(new ErrorMessage("errors.invalidkey.TModelNotFound", tmodelKey));
				}
				
				org.uddi.api_v3.TModel apiTModel = new org.uddi.api_v3.TModel();
				
				MappingModelToApi.mapTModel(modelTModel, apiTModel);
				
				result.getTModel().add(apiTModel);
			}
	
			tx.commit();	
			return result;
		} finally {
			if (tx.isActive()) {
				tx.rollback();
			}
			em.close();
		}
	}

	private boolean isAuthenticated() {
		boolean result = false;
		try {
			result = AppConfig.getConfiguration().getBoolean(Property.JUDDI_AUTHENTICATE_INQUIRY);
		} catch (ConfigurationException e) {
			log.error("Configuration exception occurred retrieving: " + Property.JUDDI_AUTHENTICATE_INQUIRY, e);
		}
		return result;
	}

}
