<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei">
    
    <xsl:output method="html" indent="yes"/>
    
    <!-- Identity template to copy everything as is, excluding tei:rdg -->
    <xsl:template match="text[@type='literary-text']">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Match the <lem> element and apply a style -->
    <xsl:template match="tei:lem">
        
        <xsl:variable name="atributoConcatenado">
            <xsl:for-each select="../tei:rdg">
                <xsl:value-of select="concat(., ' (', @wit, ')&#10;')"/>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="atributoConcatenado2">
            <xsl:value-of select="concat(., ' (', @wit, ')&#10;', $atributoConcatenado)"/>
        </xsl:variable>
        <span style="color: blue;" title="{$atributoConcatenado2}">
            <xsl:apply-templates select="./text()"/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:rdg">
    </xsl:template>   
    
    <xsl:template match="tei:hi[@rend='bold']">
        <b><xsl:apply-templates/>
        </b>
    </xsl:template>
    <xsl:template match="tei:rdg">
    </xsl:template>   
    
    <xsl:template match="tei:hi[@rend='italic']">
        <i><xsl:apply-templates/>
        </i>
    </xsl:template>
    
    <xsl:template match="tei:l">
        <xsl:apply-templates/><br/>
    </xsl:template>
    
    <xsl:template match="tei:sp">
        <xsl:apply-templates/><br/>
    </xsl:template>
    
    <xsl:template match="tei:speaker">
        <b><xsl:apply-templates/>
        </b>
    </xsl:template>
    <xsl:template match="tei:head">
        <b><xsl:apply-templates/>
        </b>
    </xsl:template>
</xsl:stylesheet>
