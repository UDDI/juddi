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
package org.apache.juddi.api.impl;

/**
 * @author <a href="mailto:jfaath@apache.org">Jeff Faath</a>
 */
import static junit.framework.Assert.assertEquals;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBElement;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

import org.apache.juddi.query.PersistenceManager;
import org.apache.log4j.Logger;
import org.uddi.api_v3.CategoryBag;
import org.uddi.api_v3.Contact;
import org.uddi.api_v3.Contacts;
import org.uddi.api_v3.Description;
import org.uddi.api_v3.DiscoveryURL;
import org.uddi.api_v3.DiscoveryURLs;
import org.uddi.api_v3.KeyedReference;
import org.uddi.api_v3.Name;
import org.uddi.api_v3.PersonName;
import org.uddi.v3_service.DispositionReportFaultMessage;

public class UDDIApiTestHelper {

	private static Logger logger = Logger.getLogger(UDDIApiTestHelper.class);
	
	@SuppressWarnings("unchecked")
	public static Object buildEntityFromDoc(String fileName, String thePackage) throws JAXBException, IOException {
		Object obj = null;
		URL url = Thread.currentThread().getContextClassLoader().getResource(fileName);
		if (url==null) {
			logger.error("Could not find resource: " + fileName);
		} else {
			InputStream resourceStream =url.openStream();
	
			JAXBContext jc = JAXBContext.newInstance(thePackage);
			Unmarshaller unmarshaller = jc.createUnmarshaller();
			obj = ((JAXBElement)unmarshaller.unmarshal(resourceStream)).getValue();
		}
		return obj;
	}

	public static void outputEntity(Object obj, String thePackage) throws JAXBException {
		JAXBContext jc = JAXBContext.newInstance(thePackage);
		Marshaller marshaller = jc.createMarshaller();
		marshaller.marshal( new JAXBElement<Object>(new javax.xml.namespace.QName("uri","local"), Object.class, obj), System.out);
		
	}

	public static void deleteEntity(Class<?> entityClass, Object entityKey) {
		EntityManager em = PersistenceManager.getEntityManager();
		EntityTransaction tx = em.getTransaction();
		tx.begin();

		Object obj = em.find(entityClass, entityKey);
		em.remove(obj);
		
		tx.commit();
		em.close();
	}

	public static void removeAuthTokens() {
		
		EntityManager em = PersistenceManager.getEntityManager();
		EntityTransaction tx = em.getTransaction();
		tx.begin();

		Query qry = em.createQuery("delete from AuthToken");
		qry.executeUpdate();
		
		tx.commit();
		em.close();

	}

	
	public static String getAuthToken(String pubId) throws DispositionReportFaultMessage {
		UDDISecurityImpl securityService = new UDDISecurityImpl();

		org.uddi.api_v3.GetAuthToken ga = new org.uddi.api_v3.GetAuthToken();
		ga.setUserID(pubId);
		ga.setCred("");

		org.uddi.api_v3.AuthToken token = securityService.getAuthToken(ga);
		
		return token.getAuthInfo();
	}


	public static void checkNames(List<Name> names1, List<Name> names2) {
		if (names1 == null || names2 == null) {
			assertEquals(names1, names2);
			return;
		}
		assertEquals(names1.size(), names2.size());
		Iterator<Name> names1Itr = names1.iterator();
		Iterator<Name> names2Itr = names2.iterator();
		while (names1Itr.hasNext()) {
			Name name1 = names1Itr.next();
			Name name2 = names2Itr.next();
			assertEquals(name1.getLang(), name2.getLang());
			assertEquals(name1.getValue(), name2.getValue());
		}
	}
	
	public static void checkDescriptions(List<Description> descriptions1, List<Description> descriptions2) {
		if (descriptions1 == null || descriptions2 == null) {
			assertEquals(descriptions1, descriptions2);
			return;
		}
		assertEquals(descriptions1.size(), descriptions2.size());
		Iterator<Description> descriptions1Itr = descriptions1.iterator();
		Iterator<Description> descriptions2Itr = descriptions2.iterator();
		while (descriptions1Itr.hasNext()) {
			Description description1 = descriptions1Itr.next();
			Description description2 = descriptions2Itr.next();
			assertEquals(description1.getLang(), description2.getLang());
			assertEquals(description1.getValue(), description2.getValue());
		}
	}
	
	public static void checkDiscoveryUrls(DiscoveryURLs discs1, DiscoveryURLs discs2) {
		if (discs1 == null || discs2 == null) {
			assertEquals(discs1, discs2);
			return;
		}
		List<DiscoveryURL> discList1 = discs1.getDiscoveryURL();
		List<DiscoveryURL> discList2 = discs2.getDiscoveryURL();
		
		if (discList1 == null || discList2 == null) {
			assertEquals(discList1, discList2);
			return;
		}
		assertEquals(discList1.size(), discList2.size());
		Iterator<DiscoveryURL> discList1Itr = discList1.iterator();
		Iterator<DiscoveryURL> discList2Itr = discList2.iterator();
		while (discList1Itr.hasNext()) {
			DiscoveryURL disc1 = discList1Itr.next();
			DiscoveryURL disc2 = discList2Itr.next();
			assertEquals(disc1.getUseType(), disc2.getUseType());
			assertEquals(disc1.getValue(), disc2.getValue());
		}
	}
	
	public static void checkContacts(Contacts contacts1, Contacts contacts2) {
		if (contacts1 == null || contacts2 == null) {
			assertEquals(contacts1, contacts2);
			return;
		}
		List<Contact> contactList1 = contacts1.getContact();
		List<Contact> contactList2 = contacts2.getContact();
		if (contactList1 == null || contactList2 == null) {
			assertEquals(contactList1, contactList2);
			return;
		}
		assertEquals(contactList1.size(), contactList2.size());
		Iterator<Contact> contactList1Itr = contactList1.iterator();
		Iterator<Contact> contactList2Itr = contactList2.iterator();
		while (contactList1Itr.hasNext()) {
			Contact contact1 = contactList1Itr.next();
			Contact contact2 = contactList2Itr.next();
			assertEquals(contact1.getUseType(), contact2.getUseType());
			
			checkPersonNames(contact1.getPersonName(), contact2.getPersonName());
			checkDescriptions(contact1.getDescription(), contact2.getDescription());
		}
	}
	
	public static void checkPersonNames(List<PersonName> names1, List<PersonName> names2) {
		if (names1 == null || names2 == null) {
			assertEquals(names1, names2);
			return;
		}
		assertEquals(names1.size(), names2.size());
		Iterator<PersonName> names1Itr = names1.iterator();
		Iterator<PersonName> names2Itr = names2.iterator();
		while (names1Itr.hasNext()) {
			PersonName name1 = names1Itr.next();
			PersonName name2 = names2Itr.next();
			assertEquals(name1.getLang(), name2.getLang());
			assertEquals(name1.getValue(), name2.getValue());
		}
	}

	public static void checkCategories(CategoryBag cbag1, CategoryBag cbag2) {
		if (cbag1 == null || cbag2 == null) {
			assertEquals(cbag1, cbag2);
			return;
		}
		List<JAXBElement<?>> elemList1 = cbag1.getContent();
		List<JAXBElement<?>> elemList2 = cbag2.getContent();
		if (elemList1 == null || elemList2 == null) {
			assertEquals(elemList1, elemList2);
			return;
		}
		// In object could have KeyedReferenceGroups which are ignored.  For now, only solo KeyedReferences are checked.
		//assertEquals(elemList1.size(), elemList2.size());
		Iterator<JAXBElement<?>> elemList1Itr = elemList1.iterator();
		Iterator<JAXBElement<?>> elemList2Itr = elemList2.iterator();
		while (elemList1Itr.hasNext()) {
			JAXBElement<?> elem1 = elemList1Itr.next();
			if (elem1.getValue() instanceof org.uddi.api_v3.KeyedReference) {
				JAXBElement<?> elem2 = elemList2Itr.next();
				KeyedReference kr1 = (KeyedReference)elem1.getValue();
				KeyedReference kr2 = (KeyedReference)elem2.getValue();;
				assertEquals(kr1.getTModelKey(), kr2.getTModelKey());
				assertEquals(kr1.getKeyName(), kr2.getKeyName());
				assertEquals(kr1.getKeyValue(), kr2.getKeyValue());
			}
			
		}
	}
	
}