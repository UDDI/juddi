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


package org.uddi.v3_service;

import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.List;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.Holder;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;
import org.uddi.api_v3.AddPublisherAssertions;
import org.uddi.api_v3.AssertionStatusItem;
import org.uddi.api_v3.BindingDetail;
import org.uddi.api_v3.BusinessDetail;
import org.uddi.api_v3.CompletionStatus;
import org.uddi.api_v3.DeleteBinding;
import org.uddi.api_v3.DeleteBusiness;
import org.uddi.api_v3.DeletePublisherAssertions;
import org.uddi.api_v3.DeleteService;
import org.uddi.api_v3.DeleteTModel;
import org.uddi.api_v3.DispositionReport;
import org.uddi.api_v3.GetRegisteredInfo;
import org.uddi.api_v3.PublisherAssertion;
import org.uddi.api_v3.RegisteredInfo;
import org.uddi.api_v3.SaveBinding;
import org.uddi.api_v3.SaveBusiness;
import org.uddi.api_v3.SaveService;
import org.uddi.api_v3.SaveTModel;
import org.uddi.api_v3.ServiceDetail;
import org.uddi.api_v3.TModelDetail;


/**
 * This portType defines all of the UDDI publication operations.
 * 
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.1.5-b03-
 * Generated source version: 2.1
 * 
 */
@WebService(name = "UDDI_Publication_PortType", targetNamespace = "urn:uddi-org:api_v3_portType")
@XmlSeeAlso({
    org.uddi.custody_v3.ObjectFactory.class,
    org.uddi.repl_v3.ObjectFactory.class,
    org.uddi.subr_v3.ObjectFactory.class,
    org.uddi.api_v3.ObjectFactory.class,
    org.uddi.vscache_v3.ObjectFactory.class,
    org.uddi.vs_v3.ObjectFactory.class,
    org.uddi.sub_v3.ObjectFactory.class,
    org.w3._2000._09.xmldsig_.ObjectFactory.class,
    org.uddi.policy_v3.ObjectFactory.class,
    org.uddi.policy_v3_instanceparms.ObjectFactory.class
})
public interface UDDIPublicationPortType extends Remote{


    /**
     * 
     * @param body
     * @throws DispositionReportFaultMessage, RemoteException
     */
    @WebMethod(operationName = "add_publisherAssertions", action = "add_publisherAssertions")
    @WebResult(name = "dispositionReport", targetNamespace = "urn:uddi-org:api_v3", partName = "body")
    @SOAPBinding(parameterStyle = SOAPBinding.ParameterStyle.BARE)
    public DispositionReport addPublisherAssertions(
        @WebParam(name = "add_publisherAssertions", targetNamespace = "urn:uddi-org:api_v3", partName = "body")
        AddPublisherAssertions body)
        throws DispositionReportFaultMessage, RemoteException
    ;

    /**
     * 
     * @param body
     * @throws DispositionReportFaultMessage, RemoteException
     */
    @WebMethod(operationName = "delete_binding", action = "delete_binding")
    @WebResult(name = "dispositionReport", targetNamespace = "urn:uddi-org:api_v3", partName = "body")
    @SOAPBinding(parameterStyle = SOAPBinding.ParameterStyle.BARE)
    public DispositionReport deleteBinding(
        @WebParam(name = "delete_binding", targetNamespace = "urn:uddi-org:api_v3", partName = "body")
        DeleteBinding body)
        throws DispositionReportFaultMessage, RemoteException
    ;

    /**
     * 
     * @param body
     * @throws DispositionReportFaultMessage, RemoteException
     */
    @WebMethod(operationName = "delete_business", action = "delete_business")
    @WebResult(name = "dispositionReport", targetNamespace = "urn:uddi-org:api_v3", partName = "body")
    @SOAPBinding(parameterStyle = SOAPBinding.ParameterStyle.BARE)
    public DispositionReport deleteBusiness(
        @WebParam(name = "delete_business", targetNamespace = "urn:uddi-org:api_v3", partName = "body")
        DeleteBusiness body)
        throws DispositionReportFaultMessage, RemoteException
    ;

    /**
     * 
     * @param body
     * @throws DispositionReportFaultMessage, RemoteException
     */
    @WebMethod(operationName = "delete_publisherAssertions", action = "delete_publisherAssertions")
    @WebResult(name = "dispositionReport", targetNamespace = "urn:uddi-org:api_v3", partName = "body")
    @SOAPBinding(parameterStyle = SOAPBinding.ParameterStyle.BARE)
    public DispositionReport deletePublisherAssertions(
        @WebParam(name = "delete_publisherAssertions", targetNamespace = "urn:uddi-org:api_v3", partName = "body")
        DeletePublisherAssertions body)
        throws DispositionReportFaultMessage, RemoteException
    ;

    /**
     * 
     * @param body
     * @throws DispositionReportFaultMessage, RemoteException
     */
    @WebMethod(operationName = "delete_service", action = "delete_service")
    @WebResult(name = "dispositionReport", targetNamespace = "urn:uddi-org:api_v3", partName = "body")
    @SOAPBinding(parameterStyle = SOAPBinding.ParameterStyle.BARE)
    public DispositionReport deleteService(
        @WebParam(name = "delete_service", targetNamespace = "urn:uddi-org:api_v3", partName = "body")
        DeleteService body)
        throws DispositionReportFaultMessage, RemoteException
    ;

    /**
     * 
     * @param body
     * @throws DispositionReportFaultMessage, RemoteException
     */
    @WebMethod(operationName = "delete_tModel", action = "delete_tModel")
    @WebResult(name = "dispositionReport", targetNamespace = "urn:uddi-org:api_v3", partName = "body")
    @SOAPBinding(parameterStyle = SOAPBinding.ParameterStyle.BARE)
    public DispositionReport deleteTModel(
        @WebParam(name = "delete_tModel", targetNamespace = "urn:uddi-org:api_v3", partName = "body")
        DeleteTModel body)
        throws DispositionReportFaultMessage, RemoteException
    ;

    /**
     * 
     * @param completionStatus
     * @param authInfo
     * @return
     *     returns java.util.List<org.uddi.api_v3.AssertionStatusItem>
     * @throws DispositionReportFaultMessage, RemoteException
     */
    @WebMethod(operationName = "get_assertionStatusReport", action = "get_assertionStatusReport")
    @WebResult(name = "assertionStatusItem", targetNamespace = "urn:uddi-org:api_v3")
    @RequestWrapper(localName = "get_assertionStatusReport", targetNamespace = "urn:uddi-org:api_v3", className = "org.uddi.api_v3.GetAssertionStatusReport")
    @ResponseWrapper(localName = "assertionStatusReport", targetNamespace = "urn:uddi-org:api_v3", className = "org.uddi.api_v3.AssertionStatusReport")
    public List<AssertionStatusItem> getAssertionStatusReport(
        @WebParam(name = "authInfo", targetNamespace = "urn:uddi-org:api_v3")
        String authInfo,
        @WebParam(name = "completionStatus", targetNamespace = "urn:uddi-org:api_v3")
        CompletionStatus completionStatus)
        throws DispositionReportFaultMessage, RemoteException
    ;

    /**
     * 
     * @param authInfo
     * @return
     *     returns java.util.List<org.uddi.api_v3.PublisherAssertion>
     * @throws DispositionReportFaultMessage, RemoteException
     */
    @WebMethod(operationName = "get_publisherAssertions", action = "get_publisherAssertions")
    @WebResult(name = "publisherAssertion", targetNamespace = "urn:uddi-org:api_v3")
    @RequestWrapper(localName = "get_publisherAssertions", targetNamespace = "urn:uddi-org:api_v3", className = "org.uddi.api_v3.GetPublisherAssertions")
    @ResponseWrapper(localName = "publisherAssertionsResponse", targetNamespace = "urn:uddi-org:api_v3", className = "org.uddi.api_v3.PublisherAssertionsResponse")
    public List<PublisherAssertion> getPublisherAssertions(
        @WebParam(name = "authInfo", targetNamespace = "urn:uddi-org:api_v3")
        String authInfo)
        throws DispositionReportFaultMessage, RemoteException
    ;

    /**
     * 
     * @param body
     * @return
     *     returns org.uddi.api_v3.RegisteredInfo
     * @throws DispositionReportFaultMessage, RemoteException
     */
    @WebMethod(operationName = "get_registeredInfo", action = "get_registeredInfo")
    @WebResult(name = "registeredInfo", targetNamespace = "urn:uddi-org:api_v3", partName = "body")
    @SOAPBinding(parameterStyle = SOAPBinding.ParameterStyle.BARE)
    public RegisteredInfo getRegisteredInfo(
        @WebParam(name = "get_registeredInfo", targetNamespace = "urn:uddi-org:api_v3", partName = "body")
        GetRegisteredInfo body)
        throws DispositionReportFaultMessage, RemoteException
    ;

    /**
     * 
     * @param body
     * @return
     *     returns org.uddi.api_v3.BindingDetail
     * @throws DispositionReportFaultMessage, RemoteException
     */
    @WebMethod(operationName = "save_binding", action = "save_binding")
    @WebResult(name = "bindingDetail", targetNamespace = "urn:uddi-org:api_v3", partName = "body")
    @SOAPBinding(parameterStyle = SOAPBinding.ParameterStyle.BARE)
    public BindingDetail saveBinding(
        @WebParam(name = "save_binding", targetNamespace = "urn:uddi-org:api_v3", partName = "body")
        SaveBinding body)
        throws DispositionReportFaultMessage, RemoteException
    ;

    /**
     * 
     * @param body
     * @return
     *     returns org.uddi.api_v3.BusinessDetail
     * @throws DispositionReportFaultMessage, RemoteException
     */
    @WebMethod(operationName = "save_business", action = "save_business")
    @WebResult(name = "businessDetail", targetNamespace = "urn:uddi-org:api_v3", partName = "body")
    @SOAPBinding(parameterStyle = SOAPBinding.ParameterStyle.BARE)
    public BusinessDetail saveBusiness(
        @WebParam(name = "save_business", targetNamespace = "urn:uddi-org:api_v3", partName = "body")
        SaveBusiness body)
        throws DispositionReportFaultMessage, RemoteException
    ;

    /**
     * 
     * @param body
     * @return
     *     returns org.uddi.api_v3.ServiceDetail
     * @throws DispositionReportFaultMessage, RemoteException
     */
    @WebMethod(operationName = "save_service", action = "save_service")
    @WebResult(name = "serviceDetail", targetNamespace = "urn:uddi-org:api_v3", partName = "body")
    @SOAPBinding(parameterStyle = SOAPBinding.ParameterStyle.BARE)
    public ServiceDetail saveService(
        @WebParam(name = "save_service", targetNamespace = "urn:uddi-org:api_v3", partName = "body")
        SaveService body)
        throws DispositionReportFaultMessage, RemoteException
    ;

    /**
     * 
     * @param body
     * @return
     *     returns org.uddi.api_v3.TModelDetail
     * @throws DispositionReportFaultMessage, RemoteException
     */
    @WebMethod(operationName = "save_tModel", action = "save_tModel")
    @WebResult(name = "tModelDetail", targetNamespace = "urn:uddi-org:api_v3", partName = "body")
    @SOAPBinding(parameterStyle = SOAPBinding.ParameterStyle.BARE)
    public TModelDetail saveTModel(
        @WebParam(name = "save_tModel", targetNamespace = "urn:uddi-org:api_v3", partName = "body")
        SaveTModel body)
        throws DispositionReportFaultMessage, RemoteException
    ;

    /**
     * 
     * @param publisherAssertion
     * @param authInfo
     * @throws DispositionReportFaultMessage, RemoteException
     */
    @WebMethod(operationName = "set_publisherAssertions", action = "set_publisherAssertions")
    @RequestWrapper(localName = "set_publisherAssertions", targetNamespace = "urn:uddi-org:api_v3", className = "org.uddi.api_v3.SetPublisherAssertions")
    @ResponseWrapper(localName = "publisherAssertions", targetNamespace = "urn:uddi-org:api_v3", className = "org.uddi.api_v3.PublisherAssertions")
    public void setPublisherAssertions(
        @WebParam(name = "authInfo", targetNamespace = "urn:uddi-org:api_v3")
        String authInfo,
        @WebParam(name = "publisherAssertion", targetNamespace = "urn:uddi-org:api_v3", mode = WebParam.Mode.INOUT)
        Holder<List<PublisherAssertion>> publisherAssertion)
        throws DispositionReportFaultMessage, RemoteException
    ;

}
