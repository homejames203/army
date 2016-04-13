<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<%--
    * /ID
    * /ID?embedded
--%>
<c:choose>
    <c:when test="${param.embedded != null}">
        <bundle:yield/>
    </c:when>
    <c:otherwise>
        <bundle:layout page="layout.jsp">
          <script>
            // Initialize Bootstrappy field overrides.
            bundle.config.fields = {
              text: function(field, triggerFn) {
                $(field.wrapper()).addClass('form-group');
                $(field.wrapper()).find('label').addClass('control-label');
                $(field.element()).addClass('form-control');
                $(field.element()).on('change', triggerFn);
              },
              dropdown: function(field, triggerFn) {
                $(field.wrapper()).addClass('form-group');
                $(field.wrapper()).find('label').addClass('control-label');
                $(field.element()).addClass('form-control');
                $(field.element()).on('change', triggerFn);
              },
              checkbox: function(field, triggerFn) {
                $(field.wrapper()).removeClass('checkbox');
                $(field.wrapper()).find('label').first().addClass('control-label');
                $(field.wrapper()).find('label').first().removeClass('field-label');
                $(field.wrapper()).children().not(':first-child').addClass('checkbox');
                $(field.wrapper()).children().not(':first-child').attr('style', 'margin-left:20px;');
             },
              radio: function(field, triggerFn) {
                $(field.wrapper()).removeClass('radio');
                $(field.wrapper()).find('label').first().addClass('control-label');
                $(field.wrapper()).find('label').first().removeClass('field-label');
                $(field.wrapper()).children().not(':first-child').addClass('radio');
                $(field.wrapper()).children().not(':first-child').attr('style', 'margin-left:20px;');
              }
            };
            bundle.config.ready = function() {
              $('[data-element-type="button"]').addClass('btn btn-default');
              $('[data-element-name="Submit Button"]').addClass('pull-right');
            };
          </script>
          <bundle:variable name="head">
              <bundle:yield name="head"/>
          </bundle:variable>
          <bundle:yield/>
        </bundle:layout>
    </c:otherwise>
</c:choose>
