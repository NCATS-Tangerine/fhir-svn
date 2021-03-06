<?xml version="1.0" encoding="UTF-8"?>
<!--
  - Strip off schema declaration and unofficial extension
  -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xsi xs f">
<!--  <xsl:import href="convertIgs.xslt"/>-->
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
  <xsl:template match="/">
    <xsl:comment>DO NOT EDIT THIS FILE - It is generated and any changes made here will be overwritten</xsl:comment>
    <xsl:apply-templates select="*"/>
  </xsl:template>
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="f:page/f:title">
    <xsl:choose>
      <xsl:when test="starts-with(/f:ImplementationGuide/f:fhirVersion/@value, '1.')">
        <name>
          <xsl:apply-templates select="@*|node()"/>
        </name>
      </xsl:when>
      <xsl:otherwise>
        <xsl:copy>
          <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="f:jurisdiction">
    <xsl:choose>
      <xsl:when test="starts-with(/f:ImplementationGuide/f:fhirVersion/@value, '1.')">
        <useContext>
          <xsl:apply-templates select="@*|node()"/>
        </useContext>
      </xsl:when>
      <xsl:otherwise>
        <xsl:copy>
          <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="@xsi:schemaLocation|f:extension[@url=('http://hl7.org/fhir/tools-profile-spreadsheet')]"/>
  <xsl:template match="f:resource[f:extension[@url='http://hl7.org/fhir/StructureDefinition/implementationguide-spreadsheet-profile' and f:valueBoolean/@value=true()]]"/>
  <xsl:template match="f:package">
    <xsl:if test="f:resource[not(f:extension[@url='http://hl7.org/fhir/StructureDefinition/implementationguide-spreadsheet-profile' and f:valueBoolean/@value=true()])]">
      <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
      </xsl:copy>
    </xsl:if>
  </xsl:template>
  <xsl:template match="f:page[f:source/@value='artifacts.html']">
    <xsl:variable name="name">
      <xsl:choose>
        <xsl:when test="f:name or starts-with(/f:ImplementationGuide/f:fhirVersion/@value, '1.')">name</xsl:when>
        <xsl:otherwise>title</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:copy>
      <xsl:apply-templates select="@*|node()[not(self::f:page)]"/>
      <xsl:if test="not(f:page[f:format/@value='generated'])">
        <xsl:copy-of select="f:page"/>
        <xsl:for-each select="ancestor::f:ImplementationGuide/f:package/f:resource">
          <xsl:variable name="id" select="substring-after(f:sourceReference/f:reference/@value, '/')"/>
          <page>
            <xsl:variable name="source">
              <xsl:if test="starts-with($id, 'ext-')">extension-</xsl:if>
              <xsl:value-of select="concat($id, '.html')"/>
            </xsl:variable>
            <source value="{$source}"/>
            <xsl:element name="{$name}">
              <xsl:attribute name="value">
                <xsl:value-of select="f:name/@value"/>
              </xsl:attribute>
            </xsl:element>
            <xsl:variable name="kind">
              <xsl:choose>
                <xsl:when test="starts-with($id, 'ext-')">resource</xsl:when>
                <xsl:when test="starts-with($id, 'sp-')">example</xsl:when>
                <xsl:when test="starts-with($id, 'conformance-')">example</xsl:when>
                <xsl:when test="starts-with($id, 'example-')">example</xsl:when>
                <xsl:when test="starts-with($id, 'codesystem-') or starts-with($id, 'valueset-')">resource</xsl:when>
                <xsl:otherwise>resource</xsl:otherwise>
              </xsl:choose>
            </xsl:variable>
            <kind value="{$kind}"/>
            <xsl:choose>
              <xsl:when test="starts-with($id, 'sp-') or starts-with($id, 'conformance-')">
                <format value="generated-resource"/>
              </xsl:when>
              <xsl:otherwise>
                <format value="generated"/>
              </xsl:otherwise>
            </xsl:choose>
          </page>
        </xsl:for-each>
      </xsl:if>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
