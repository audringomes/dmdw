<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <!-- The following variables contain the Page titles. -->
  <xsl:variable name="diagram_title" select="'Object-relations Diagram'"/>

  <!-- NOTE: This stylesheet is loaded after Common.xsl

       The next templates are used to provide text for every major chapter 
       They should not be removed, but left empty if wanted.

       As they are templates, xsl instructions can be used, 
       see e.g. the content of the template 'collections_info'

       They are inserted within <div class="ChapterInfo"></div>
  -->
  
  <xsl:template name="toc_info">
    <!-- Content below the 'Table of Contents' -->
    <p></p>
  </xsl:template>

  
  <xsl:template name="technical_details_info">
    <!-- Content below the title 'Technical Details'in the technical details page -->
    <p></p>
  </xsl:template>

  
  <xsl:template name="collections_info">
    <!-- Content below the 'Collections by Category' title in the Collection list page -->
    <p>The descriptions of the collections are supplied seperately. Their origin is not the datamodel. The collections are grouped as in the ACE used. All collections that are not referenced in the ACE used are grouped in the 'not in ACE '<xsl:value-of select="//dm_ace_name"/>'</p>
  </xsl:template>

  
  <xsl:template name="global_properties_info">
    <!-- Content below the 'Global Properties' title in the Global Properties page -->
    <p>These properties are global to the datamodel. It includes the default topology interaction, commonly used field(types) that have a global description. Except for the default topology, this information is not dervied from the datamodel itself, but supplied seperately.</p>
  </xsl:template>

  
  <xsl:template name="enumerators_info_static">
    <!-- Content below the 'List of Enumerators' title in the Enumerators list page -->
    <p></p>
  </xsl:template>

  <xsl:template name="enumerators_info">
    <!-- Content below the 'List of Enumerators' title in the Enumerators list page -->
    <p></p>
  </xsl:template>

  
  <xsl:template name="topology_info">
    <!-- Content below Pagetitle of one merged topology page -->
    <p></p>
  </xsl:template>

  
  <xsl:template name="topology_info_static">
    <!-- Content below the Pagetitle of the static Topology relations page -->
    <p></p>
  </xsl:template>

  
  <xsl:template name="topology_info_interactive">
    <!-- Content below the Pagetitle of the interactive Topology relations page -->
    <p>When you select a Table on the left side, the geometries are shown. Then select one of the geometries of that table and the explicit topology rules are shown on the right</p>
  </xsl:template>

  
  <xsl:template name="soft_joins_info">
    <!-- Content below the Pagetitle of the list of Soft Joins page -->
    <p>Soft joins are completely managed in Magik. Soft joins can hold equally important relationships as normal joins from the data dictionary. Therefore, this page contains a full list of these joins. Soft joins is a concept from GE Common Office.
    Below are the configurations for the reported dataset. The data is retrieved by examining every record exemplar of a collection for the result of the method: cs_soft_joins. 
    .</p>
  </xsl:template>
  
</xsl:stylesheet>
