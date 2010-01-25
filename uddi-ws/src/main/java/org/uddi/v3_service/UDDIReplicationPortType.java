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

import java.math.BigInteger;
import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.List;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;
import org.uddi.repl_v3.ChangeRecord;
import org.uddi.repl_v3.ChangeRecordIDType;
import org.uddi.repl_v3.DoPing;
import org.uddi.repl_v3.HighWaterMarkVectorType;
import org.uddi.repl_v3.NotifyChangeRecordsAvailable;
import org.uddi.repl_v3.TransferCustody;


/**
 * This portType defines all of the UDDI replication operations.
 * 
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.1.5-b03-
 * Generated source version: 2.1
 * 
 */
@WebService(name = "UDDI_Replication_PortType", targetNamespace = "urn:uddi-org:v3_service")
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
public interface UDDIReplicationPortType extends Remote{


    /**
     * 
     * @param responseLimitVector
     * @param requestingNode
     * @param changesAlreadySeen
     * @param responseLimitCount
     * @return
     *     returns java.util.List<org.uddi.repl_v3.ChangeRecord>
     * @throws DispositionReportFaultMessage, RemoteException
     */
    @WebMethod(operationName = "get_changeRecords", action = "get_changeRecords")
    @WebResult(name = "changeRecord", targetNamespace = "urn:uddi-org:repl_v3")
    @RequestWrapper(localName = "get_changeRecords", targetNamespace = "urn:uddi-org:repl_v3", className = "org.uddi.repl_v3.GetChangeRecords")
    @ResponseWrapper(localName = "changeRecords", targetNamespace = "urn:uddi-org:repl_v3", className = "org.uddi.repl_v3.ChangeRecords")
    public List<ChangeRecord> getChangeRecords(
        @WebParam(name = "requestingNode", targetNamespace = "urn:uddi-org:repl_v3")
        String requestingNode,
        @WebParam(name = "changesAlreadySeen", targetNamespace = "urn:uddi-org:repl_v3")
        HighWaterMarkVectorType changesAlreadySeen,
        @WebParam(name = "responseLimitCount", targetNamespace = "urn:uddi-org:repl_v3")
        BigInteger responseLimitCount,
        @WebParam(name = "responseLimitVector", targetNamespace = "urn:uddi-org:repl_v3")
        HighWaterMarkVectorType responseLimitVector)
        throws DispositionReportFaultMessage, RemoteException
    ;

    /**
     * 
     * @param body
     * @throws DispositionReportFaultMessage, RemoteException
     */
    @WebMethod(operationName = "notify_changeRecordsAvailable", action = "notify_changeRecordsAvailable")
    @SOAPBinding(parameterStyle = SOAPBinding.ParameterStyle.BARE)
    public void notifyChangeRecordsAvailable(
        @WebParam(name = "notify_changeRecordsAvailable", targetNamespace = "urn:uddi-org:repl_v3", partName = "body")
        NotifyChangeRecordsAvailable body)
        throws DispositionReportFaultMessage, RemoteException
    ;

    /**
     * 
     * @param body
     * @return
     *     returns java.lang.String
     * @throws DispositionReportFaultMessage, RemoteException
     */
    @WebMethod(operationName = "do_ping", action = "do_ping")
    @WebResult(name = "operatorNodeID", targetNamespace = "urn:uddi-org:repl_v3", partName = "body")
    @SOAPBinding(parameterStyle = SOAPBinding.ParameterStyle.BARE)
    public String doPing(
        @WebParam(name = "do_ping", targetNamespace = "urn:uddi-org:repl_v3", partName = "body")
        DoPing body)
        throws DispositionReportFaultMessage, RemoteException
    ;

    /**
     * 
     * @return
     *     returns java.util.List<org.uddi.repl_v3.ChangeRecordIDType>
     * @throws DispositionReportFaultMessage, RemoteException
     */
    @WebMethod(operationName = "get_highWaterMarks", action = "get_highWaterMarks")
    @WebResult(name = "highWaterMark", targetNamespace = "urn:uddi-org:repl_v3")
    @RequestWrapper(localName = "get_highWaterMarks", targetNamespace = "urn:uddi-org:repl_v3", className = "org.uddi.repl_v3.GetHighWaterMarks")
    @ResponseWrapper(localName = "highWaterMarks", targetNamespace = "urn:uddi-org:repl_v3", className = "org.uddi.repl_v3.HighWaterMarkVectorType")
    public List<ChangeRecordIDType> getHighWaterMarks()
        throws DispositionReportFaultMessage, RemoteException
    ;

    /**
     * 
     * @param body
     * @throws DispositionReportFaultMessage, RemoteException
     */
    @WebMethod(operationName = "transfer_custody", action = "transfer_custody")
    @SOAPBinding(parameterStyle = SOAPBinding.ParameterStyle.BARE)
    public void transferCustody(
        @WebParam(name = "transfer_custody", targetNamespace = "urn:uddi-org:repl_v3", partName = "body")
        TransferCustody body)
        throws DispositionReportFaultMessage, RemoteException
    ;

}
