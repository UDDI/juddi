package org.apache.juddi.test;

import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.fail;

import java.io.File;
import java.util.List;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBElement;
import javax.xml.bind.Unmarshaller;
import javax.xml.bind.JAXBException;

import org.apache.juddi.api.impl.UDDIInquiryImpl;
import org.apache.juddi.api.impl.UDDIPublicationImpl;
import org.testng.annotations.*;
import org.uddi.api_v3.ServiceDetail;
import org.uddi.api_v3.BusinessService;
import org.uddi.api_v3.DeleteService;
import org.uddi.api_v3.GetServiceDetail;
import org.uddi.api_v3.SaveService;
import org.uddi.v3_service.DispositionReportFaultMessage;

public class BusinessServiceTest {
	private UDDIPublicationImpl publish = new UDDIPublicationImpl();
	private UDDIInquiryImpl inquiry = new UDDIInquiryImpl();

	@Parameters({ "serviceFile", "serviceKey" })
	@Test
	public void saveService(String serviceFile, String serviceKey) {
		try {
			// First save the entity
			SaveService ss = new SaveService();
			org.uddi.api_v3.BusinessService bsIn = (org.uddi.api_v3.BusinessService)UDDIApiTestHelper.buildEntityFromDoc(serviceFile);
			ss.getBusinessService().add(bsIn);
			publish.saveService(ss);
			
			// Now get the entity and check the values
			GetServiceDetail gs = new GetServiceDetail();
			gs.getServiceKey().add(serviceKey);
			ServiceDetail sd = inquiry.getServiceDetail(gs);
			List<BusinessService> bsOutList = sd.getBusinessService();
			BusinessService bsOut = bsOutList.get(0);

			assertEquals(bsIn.getServiceKey(), bsOut.getServiceKey());
			
			UDDIApiTestHelper.checkNames(bsIn.getName(), bsOut.getName());
			UDDIApiTestHelper.checkDescriptions(bsIn.getDescription(), bsOut.getDescription());
			UDDIApiTestHelper.checkCategories(bsIn.getCategoryBag(), bsOut.getCategoryBag());
		}
		catch(DispositionReportFaultMessage dr) {
			fail("No exception should be thrown");
		}
		catch(JAXBException je) {
			fail("No exception should be thrown");
		}
		
	}
	
	@Parameters({ "serviceKey" })
	@Test
	public void deleteService(String serviceKey) {
		try {
			// Delete the entity and make sure it is removed
			DeleteService ds = new DeleteService();
			ds.getServiceKey().add(serviceKey);
			publish.deleteService(ds);
		}
		catch(DispositionReportFaultMessage dr) {
			fail("No exception should be thrown");
		}
		
	}

}