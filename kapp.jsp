<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="bundle/initialization.jspf" %>
<%@include file="bundle/router.jspf" %>
<c:set var="bundleCategories" value="${CategoryHelper.getCategories(kapp)}"/>

<bundle:layout page="${bundle.path}/layouts/layout.jsp">
    <bundle:variable name="head">
        <title>Kinetic Data ${text.escape(kapp.name)}</title>
    </bundle:variable>
    <h3>CIO/G6 Enterprise Service ${text.escape(kapp.name)}</h3>
    <div class="row">
        <div class="col-md-8">
            <%-- For each of the categories --%>
            <c:forEach items="${bundleCategories}" var="category">
                <%-- If the category is not hidden, and it contains at least 1 form --%>
                <c:if test="${!category.hasAttributeValue('Hidden',true)}">
                    <div class="category">
                        <h3>${text.escape(category.getDisplayName())}</h3>
                        <div class="row">
                            <%-- Show the first x number of forms of the category --%>
                            <c:forEach items="${category.getForms()}" var="categoryForm" begin="0" end="8">
                            <%-- Only show New or Active forms --%>
                            <c:if test="${categoryForm.status eq 'New' || categoryForm.status eq 'Active'}">
                            <%-- Render the form panel --%>
                            <c:set scope="request" var="thisForm" value="${categoryForm}"/>
                            <c:import url="${bundle.path}/partials/formCard.jsp" charEncoding="UTF-8" />
                            </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
        <div class="col-md-4">
            <a class="twitter-timeline" href="https://twitter.com/ArmyCIOG6" data-widget-id="720368495431516160">Tweets by @ArmyCIOG6</a>
            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
        </div>
    </div>
</bundle:layout>