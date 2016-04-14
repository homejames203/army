<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<table class="table table-striped table-hover">
    <thead>
        <tr>
            <th class="date">Submitted Date</th>
            <th>Application Name</th>
            <th class="nosort">Submission</th>
            <th>Created By</th>
            <th>Status</th>

        </tr>
    </thead>
    <tbody>
        <c:forEach items="${submissionsList}" var="submission">
            <tr>
                <td>${submission.createdAt}</td>
                <td>${text.escape(submission.getValue('Application Name'))}</td>
                <td>
                  <c:choose>
                    <c:when test="${submission.coreState eq 'Draft'}">
                      <a href="${bundle.spaceLocation}/submissions/${submission.id}">${text.escape(submission.label)}</a>
                    </c:when>
                    <c:otherwise>
                      <a href="${bundle.kappLocation}?page=submission&type=${param.page}&id=${submission.id}">${text.escape(submission.label)}</a>
                    </c:otherwise>
                  </c:choose>
                </td>
                <td>${text.escape(submission.createdBy)}</td>
                <td>${text.escape(submission.getValue('Status'))}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
