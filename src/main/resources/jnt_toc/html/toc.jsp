<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<template:addResources type="javascript" resources="jquery.min.js,jquery.toc.js"/>

<c:set var="heading" value="${currentNode.properties.heading.string}"/>
<c:if test="${empty heading}">
    <c:set var="heading" value="h2"/>
</c:if>
<c:set var="depth" value="${currentNode.properties.depth.string}"/>
<c:if test="${empty depth}">
    <c:set var="depth" value="1"/>
</c:if>
<c:choose>
    <c:when test="${heading eq 'h1'}">
        <c:choose>
            <c:when test="${depth eq '1'}"><c:set var="tocHeadings" value="h1"/></c:when>
            <c:when test="${depth eq '2'}"><c:set var="tocHeadings" value="h1,h2"/></c:when>
            <c:when test="${depth eq '3'}"><c:set var="tocHeadings" value="h1,h2,h3"/></c:when>
            <c:when test="${depth eq '4'}"><c:set var="tocHeadings" value="h1,h2,h3,h4"/></c:when>
        </c:choose>
    </c:when>
    <c:when test="${heading eq 'h2'}">
        <c:choose>
            <c:when test="${depth eq '1'}"><c:set var="tocHeadings" value="h2"/></c:when>
            <c:when test="${depth eq '2'}"><c:set var="tocHeadings" value="h2,h3"/></c:when>
            <c:when test="${depth eq '3'}"><c:set var="tocHeadings" value="h2,h3,h4"/></c:when>
            <c:when test="${depth eq '4'}"><c:set var="tocHeadings" value="h2,h3,h4,h5"/></c:when>
        </c:choose>
    </c:when>
    <c:when test="${heading eq 'h3'}">
        <c:choose>
            <c:when test="${depth eq '1'}"><c:set var="tocHeadings" value="h3"/></c:when>
            <c:when test="${depth eq '2'}"><c:set var="tocHeadings" value="h3,h4"/></c:when>
            <c:when test="${depth eq '3'}"><c:set var="tocHeadings" value="h3,h4,h5"/></c:when>
            <c:when test="${depth eq '4'}"><c:set var="tocHeadings" value="h3,h4,h5,h6"/></c:when>
        </c:choose>
    </c:when>
    <c:when test="${heading eq 'h4'}">
        <c:choose>
            <c:when test="${depth eq '1'}"><c:set var="tocHeadings" value="h4"/></c:when>
            <c:when test="${depth eq '2'}"><c:set var="tocHeadings" value="h4,h5"/></c:when>
            <c:when test="${depth eq '3'}"><c:set var="tocHeadings" value="h4,h5,h6"/></c:when>
            <c:when test="${depth eq '4'}"><c:set var="tocHeadings" value="h4,h5,h6,h7"/></c:when>
        </c:choose>
    </c:when>
</c:choose>
<c:set var="bindedComponent" value="${ui:getBindedComponent(currentNode, renderContext, 'j:bindedComponent')}"/>
<c:choose>
    <c:when test="${bindedComponent.path eq renderContext.mainResource.node.path}">
        <c:set var="toc" value="body"/>
    </c:when>
    <c:otherwise>
        <c:set var="toc" value="div#toc_${currentNode.identifier}"/>
    </c:otherwise>

</c:choose>

<ul data-toc="${toc}" data-toc-headings="${tocHeadings}" class="toc"></ul>
