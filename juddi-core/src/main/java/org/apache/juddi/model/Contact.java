package org.apache.juddi.model;
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

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.OrderBy;

/**
 * @author <a href="mailto:kurt@apache.org">Kurt T Stam</a>
 * @author <a href="mailto:jfaath@apache.org">Jeff Faath</a>
 */
@Entity
@Table(name = "contact")
public class Contact implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Long id;
	private BusinessEntity businessEntity;
	private String useType;
	private Set<PersonName> personNames = new HashSet<PersonName>(0);
	private Set<ContactDescr> contactDescrs = new HashSet<ContactDescr>(0);
	private Set<Email> emails = new HashSet<Email>(0);
	private Set<Phone> phones = new HashSet<Phone>(0);
	private Set<Address> addresses = new HashSet<Address>(0);

	public Contact() {
	}

	public Contact(BusinessEntity businessEntity) {
		this.businessEntity = businessEntity;
	}
	public Contact(BusinessEntity businessEntity, String useType,
			Set<PersonName> personNames, Set<ContactDescr> contactDescrs,
			Set<Email> emails, Set<Phone> phones, Set<Address> addresses) {
		this.businessEntity = businessEntity;
		this.useType = useType;
		this.personNames = personNames;
		this.contactDescrs = contactDescrs;
		this.emails = emails;
		this.phones = phones;
		this.addresses = addresses;
	}

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Long getId() {
		return this.id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "entity_key", nullable = false, insertable = false, updatable = false)
	public BusinessEntity getBusinessEntity() {
		return this.businessEntity;
	}
	public void setBusinessEntity(BusinessEntity businessEntity) {
		this.businessEntity = businessEntity;
	}

	@Column(name = "use_type")
	public String getUseType() {
		return this.useType;
	}
	public void setUseType(String useType) {
		this.useType = useType;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "contact")
	@OrderBy
	public Set<PersonName> getPersonNames() {
		return this.personNames;
	}
	public void setPersonNames(Set<PersonName> personNames) {
		this.personNames = personNames;
	}
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "contact")
	@OrderBy
	public Set<ContactDescr> getContactDescrs() {
		return this.contactDescrs;
	}
	public void setContactDescrs(Set<ContactDescr> contactDescrs) {
		this.contactDescrs = contactDescrs;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "contact")
	@OrderBy
	public Set<Email> getEmails() {
		return this.emails;
	}
	public void setEmails(Set<Email> emails) {
		this.emails = emails;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "contact")
	@OrderBy
	public Set<Phone> getPhones() {
		return this.phones;
	}
	public void setPhones(Set<Phone> phones) {
		this.phones = phones;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "contact")
	@OrderBy
	public Set<Address> getAddresses() {
		return this.addresses;
	}
	public void setAddresses(Set<Address> addresses) {
		this.addresses = addresses;
	}

}
