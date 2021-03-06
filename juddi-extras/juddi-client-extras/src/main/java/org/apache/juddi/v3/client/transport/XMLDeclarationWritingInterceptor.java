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
package org.apache.juddi.v3.client.transport;

import org.apache.cxf.binding.soap.SoapMessage;
import org.apache.cxf.interceptor.Fault;
import org.apache.cxf.interceptor.StaxOutInterceptor;
import org.apache.cxf.binding.soap.interceptor.AbstractSoapInterceptor;
import java.io.OutputStream;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamWriter;
import org.apache.cxf.message.Message;
import org.apache.cxf.phase.Phase;
import org.apache.cxf.phase.AbstractPhaseInterceptor;

/**
 * Add a CXF interceptor to add the XML declaration.
 * 
 * * @author Tom Cunningham <tcunning@apache.org>
 *
 */
public class XMLDeclarationWritingInterceptor extends AbstractPhaseInterceptor<SoapMessage> {
	
    public XMLDeclarationWritingInterceptor () { 
        super(Phase.PRE_STREAM); 
        addBefore(StaxOutInterceptor.class.getName());
    } 

    @Override 
    public void handleMessage(SoapMessage message) throws Fault { 
    	message.put("org.apache.cxf.stax.force-start-document", Boolean.TRUE);      
    } 
} 
