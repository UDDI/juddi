package org.apache.ws.juddi.model;
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
 */

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * @author <a href="mailto:kurt@apache.org">Kurt T Stam</a>
 */
@Entity
@Table(name = "business_entity")
public class BusinessEntity implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private String businessKey;
	private UddiEntity uddiEntity;
	private String authorizedName;
	private String publisherId;
	private String operator;
	private Date lastUpdate;
	private Set<Contact> contacts = new HashSet<Contact>(0);
	private Set<BusinessIdentifier> businessIdentifiers = new HashSet<BusinessIdentifier>(0);
	private Set<PublisherAssertion> publisherAssertionsForFromKey = new HashSet<PublisherAssertion>(0);
	private Set<DiscoveryUrl> discoveryUrls = new HashSet<DiscoveryUrl>(0);
	private Set<BusinessName> businessNames = new HashSet<BusinessName>(0);
	private Set<PublisherAssertion> publisherAssertionsForToKey = new HashSet<PublisherAssertion>(0);
	private Set<BusinessCategory> businessCategories = new HashSet<BusinessCategory>(0);
	private Set<BusinessService> businessServices = new HashSet<BusinessService>(0);
	private Set<BusinessDescr> businessDescrs = new HashSet<BusinessDescr>(0);

	public BusinessEntity() {
	}

	public BusinessEntity(String businessKey, UddiEntity uddiEntity,
			String authorizedName, String operator, Date lastUpdate) {
		this.businessKey = businessKey;
		this.uddiEntity = uddiEntity;
		this.authorizedName = authorizedName;
		this.operator = operator;
		this.lastUpdate = lastUpdate;
	}
	public BusinessEntity(String businessKey, UddiEntity uddiEntity,
			String authorizedName, String publisherId, String operator,
			Date lastUpdate, Set<Contact> contacts,
			Set<BusinessIdentifier> businessIdentifiers,
			Set<PublisherAssertion> publisherAssertionsForFromKey,
			Set<DiscoveryUrl> discoveryUrls, Set<BusinessName> businessNames,
			Set<PublisherAssertion> publisherAssertionsForToKey,
			Set<BusinessCategory> businessCategories,
			Set<BusinessService> businessServices,
			Set<BusinessDescr> businessDescrs) {
		this.businessKey = businessKey;
		this.uddiEntity = uddiEntity;
		this.authorizedName = authorizedName;
		this.publisherId = publisherId;
		this.operator = operator;
		this.lastUpdate = lastUpdate;
		this.contacts = contacts;
		this.businessIdentifiers = businessIdentifiers;
		this.publisherAssertionsForFromKey = publisherAssertionsForFromKey;
		this.discoveryUrls = discoveryUrls;
		this.businessNames = businessNames;
		this.publisherAssertionsForToKey = publisherAssertionsForToKey;
		this.businessCategories = businessCategories;
		this.businessServices = businessServices;
		this.businessDescrs = businessDescrs;
	}

	@Id
	@Column(name = "business_key", unique = true, nullable = false, length = 41)
	public String getBusinessKey() {
		return this.businessKey;
	}

	public void setBusinessKey(String businessKey) {
		this.businessKey = businessKey;
	}
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "business_key", unique = true, nullable = false, insertable = false, updatable = false)

	public UddiEntity getUddiEntity() {
		return this.uddiEntity;
	}

	public void setUddiEntity(UddiEntity uddiEntity) {
		this.uddiEntity = uddiEntity;
	}

	@Column(name = "authorized_name", nullable = false)

	public String getAuthorizedName() {
		return this.authorizedName;
	}

	public void setAuthorizedName(String authorizedName) {
		this.authorizedName = authorizedName;
	}

	@Column(name = "publisher_id", length = 20)
	public String getPublisherId() {
		return this.publisherId;
	}

	public void setPublisherId(String publisherId) {
		this.publisherId = publisherId;
	}

	@Column(name = "operator", nullable = false)

	public String getOperator() {
		return this.operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "last_update", nullable = false, length = 29)

	public Date getLastUpdate() {
		return this.lastUpdate;
	}

	public void setLastUpdate(Date lastUpdate) {
		this.lastUpdate = lastUpdate;
	}
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "businessEntity")
	public Set<Contact> getContacts() {
		return this.contacts;
	}

	public void setContacts(Set<Contact> contacts) {
		this.contacts = contacts;
	}
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "businessEntity")
	public Set<BusinessIdentifier> getBusinessIdentifiers() {
		return this.businessIdentifiers;
	}

	public void setBusinessIdentifiers(
			Set<BusinessIdentifier> businessIdentifiers) {
		this.businessIdentifiers = businessIdentifiers;
	}
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "businessEntityByFromKey")
	public Set<PublisherAssertion> getPublisherAssertionsForFromKey() {
		return this.publisherAssertionsForFromKey;
	}

	public void setPublisherAssertionsForFromKey(
			Set<PublisherAssertion> publisherAssertionsForFromKey) {
		this.publisherAssertionsForFromKey = publisherAssertionsForFromKey;
	}
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "businessEntity")
	public Set<DiscoveryUrl> getDiscoveryUrls() {
		return this.discoveryUrls;
	}

	public void setDiscoveryUrls(Set<DiscoveryUrl> discoveryUrls) {
		this.discoveryUrls = discoveryUrls;
	}
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "businessEntity")
	public Set<BusinessName> getBusinessNames() {
		return this.businessNames;
	}

	public void setBusinessNames(Set<BusinessName> businessNames) {
		this.businessNames = businessNames;
	}
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "businessEntityByToKey")
	public Set<PublisherAssertion> getPublisherAssertionsForToKey() {
		return this.publisherAssertionsForToKey;
	}

	public void setPublisherAssertionsForToKey(
			Set<PublisherAssertion> publisherAssertionsForToKey) {
		this.publisherAssertionsForToKey = publisherAssertionsForToKey;
	}
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "businessEntity")
	public Set<BusinessCategory> getBusinessCategories() {
		return this.businessCategories;
	}

	public void setBusinessCategories(Set<BusinessCategory> businessCategories) {
		this.businessCategories = businessCategories;
	}
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "businessEntity")
	public Set<BusinessService> getBusinessServices() {
		return this.businessServices;
	}

	public void setBusinessServices(Set<BusinessService> businessServices) {
		this.businessServices = businessServices;
	}
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "businessEntity")
	public Set<BusinessDescr> getBusinessDescrs() {
		return this.businessDescrs;
	}

	public void setBusinessDescrs(Set<BusinessDescr> businessDescrs) {
		this.businessDescrs = businessDescrs;
	}

}