<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dc="http://purl.org/dc/elements/1.1/">
    <xsl:output method="html" encoding="utf-8"/>
    <xsl:template match="/">
        <xsl:variable name="date_en" select="item/pubDate"/>
        <xsl:variable name="jour_en" select="substring-before($date_en,',')"/>
        <xsl:variable name="jour_num" select="substring($date_en,6,2)"/>
        <xsl:variable name="mois_en" select="substring($date_en,9,3)"/>
        <xsl:variable name="annee" select="substring($date_en,13,4)"/>
        <xsl:variable name="heure" select="substring($date_en,18,5)"/>
        <div class="meta">
            <span class="article-auteur"><xsl:value-of select="item/dc:creator"/></span>
            <span class="article-date">
                <xsl:choose>
                    <xsl:when test="$jour_en ='Mon'">Lundi </xsl:when>
                    <xsl:when test="$jour_en ='Tue'">Mardi </xsl:when>
                    <xsl:when test="$jour_en ='Wed'">Mercredi </xsl:when>
                    <xsl:when test="$jour_en ='Thu'">Jeudi </xsl:when>
                    <xsl:when test="$jour_en ='Fri'">Vendredi </xsl:when>
                    <xsl:when test="$jour_en ='Sat'">Samedi </xsl:when>
                    <xsl:when test="$jour_en ='Sun'">Dimanche </xsl:when>
                </xsl:choose>
                <xsl:value-of select="$jour_num"/>
                <xsl:choose>
                    <xsl:when test="$mois_en ='Jan'">/01/</xsl:when>
                    <xsl:when test="$mois_en ='Feb'">/02/</xsl:when>
                    <xsl:when test="$mois_en ='Mar'">/03/</xsl:when>
                    <xsl:when test="$mois_en ='Apr'">/04/</xsl:when>
                    <xsl:when test="$mois_en ='May'">/05/</xsl:when>
                    <xsl:when test="$mois_en ='Jun'">/06/</xsl:when>
                    <xsl:when test="$mois_en ='Jul'">/07/</xsl:when>
                    <xsl:when test="$mois_en ='Aug'">/08/</xsl:when>
                    <xsl:when test="$mois_en ='Sep'">/09/</xsl:when>
                    <xsl:when test="$mois_en ='Oct'">/10/</xsl:when>
                    <xsl:when test="$mois_en ='Nov'">/11/</xsl:when>
                    <xsl:when test="$mois_en ='Dec'">/12/</xsl:when>
                </xsl:choose>
                <xsl:value-of select="$annee"/>
                <!--
                à
                <xsl:value-of select="$heure"/> GMT
                -->
            </span>
        </div>

        <div class="article">

            <a class="article-title"><h1><xsl:value-of select="/item/title"/></h1></a>
            <div class="replierArticle" style="display:none">
                <a href="#" class="readnext">Replier...</a>
            </div>

            <div class="resumeArticle">
                <xsl:value-of select="/item/description" disable-output-escaping="yes"/>
                <br/>
                <div class="clear"></div>
                <div class="article-block">
                    <a target="_blank" class="readnext" href="{/item/link}"
                        title="{/item/title}">Lire la suite...</a>
                </div>
            </div>
            <div class="contenuArticle"/>
            <div class="clear"></div>

        </div>
    </xsl:template>
</xsl:stylesheet>
