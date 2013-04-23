<%-- 
/*
 * Copyright 2001-2013 The Apache Software Foundation.
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
    Document   : view subscriptions
    Created on : March 28, 2013, 9:31:19 PM
    Author     : Alex O'Ree
--%>



<%@page import="java.util.List"%>
<%@page import="org.uddi.sub_v3.Subscription"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="org.uddi.api_v3.*"%>
<%@page import="org.apache.juddi.webconsole.PostBackConstants"%>
<%@page import="org.apache.juddi.webconsole.hub.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header-top.jsp" %>
<div class="container">

    <!-- Main hero unit for a primary marketing message or call to action -->
    <div class="well">
        <h1><%=ResourceLoader.GetResource(session, "navbar.subscriptions")%></h1>
    </div>

    <!-- Example row of columns -->
    <div class="row">
        <div class="span12">
            <p>
                <%=ResourceLoader.GetResource(session, "pages.viewsubscriptions.content")%>

            </p>
            <h2><%=ResourceLoader.GetResource(session, "pages.viewsubscriptions.listingheader")%></h2>
            <%
                UddiHub x = UddiHub.getInstance(application, session);
//TODO more internationalization
                List<Subscription> list = x.GetSubscriptions();
                if (list == null) {
                    out.write(ResourceLoader.GetResource(session, "errors.notsignedin"));
                }

            %>

            <%
                if (list != null) {
                    if (!list.isEmpty()) {
            %>
            <table class="table table-hover">
                <tr><th><%=ResourceLoader.GetResource(session, "items.key")%></th><th><%=ResourceLoader.GetResource(session, "items.expires")%></th><th><%=ResourceLoader.GetResource(session, "items.actions")%></th></tr>

                <%
                    for (int i = 0; i < list.size(); i++) {
                        out.write("<tr><td>");
                        out.write(StringEscapeUtils.escapeHtml(list.get(i).getSubscriptionKey()));
                        out.write("</td><td>");
                        out.write(StringEscapeUtils.escapeHtml(list.get(i).getExpiresAfter().toString()));
                        out.write("</td><td>");
                          out.write(StringEscapeUtils.escapeHtml(list.get(i).getBindingKey()));
                        out.write("</td><td>");
                        
                        
                        out.write("<i class=\"icon-edit icon-large\"></i> ");
                        out.write("<i class=\"icon-remove icon-large\"></i> ");
                        out.write("<i class=\"icon-zoom-in icon-large\"></i> ");
                        out.write(list.get(i).getBindingKey());
                        if (list.get(i).getMaxEntities() != null)
                            out.write(list.get(i).getMaxEntities().toString());
                        if (list.get(i).getNotificationInterval()!=null)
                        out.write(list.get(i).getNotificationInterval().toString());
//out.write(list.get(i).getSubscriptionFilter());
                        out.write("</td></tr>");
                      //  out.write("<tr><td colspan=\"3\"><div id=\"" + StringEscapeUtils.escapeHtml(list.get(i).getSubscriptionKey()) + "\"></div></td></tr>");
                    }
                %>
            </table>
            <%
                    } else
                        out.write(ResourceLoader.GetResource(session, "pages.viewsubscriptions.nosubs"));

                }
            %>


        </div>
    </div>
    <%@include file="header-bottom.jsp" %>