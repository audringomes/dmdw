<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:dmdw="https://boogert-lab.nl/dmdw">

  <!-- All matching templates have two variants, one for the interactive
       and one for the static content. The latter are accessed by the mode
       parameter 'static' -->
  
  <!-- The template that creates the static content -->
  <xsl:template name="CreateTopologyContentStatic">
    <div class="container">  
      <xsl:apply-templates select="/datamodel/explicit_topology_rules" mode="static"/>
    </div>
  </xsl:template>

  <!-- The template that creates the interactive content -->
  <xsl:template name="CreateTopologyContentInteractive">
    
    <div class="container">
      <div class="navbox">
	<xsl:apply-templates select="/datamodel/explicit_topology_rules"/>
      </div>
      <div class="elementbox">
	<h4 id="righthead"></h4>
	<xsl:apply-templates select="//collection2"/>
      </div>
    </div>
    
  </xsl:template>

  <!-- A helper function to get the 'external name' of a manifold-->
  <xsl:template name="ExternalManifoldName">
    <xsl:param name="intname"/>
    <xsl:value-of select="//global_properties/manifold_definitions/manifold[@name=$intname]/manifold_name"/>
  </xsl:template>
  
  <!-- The element processing templates: -->
  
  <!-- STATIC Page -->
  
  <xsl:template match="manifold" mode="static">  
    <xsl:variable name="curman" select="@name"/>
    <table class="dmTable dmTopology float">
      <tr class="HeadStyle">
	<th colspan="3">
	  <xsl:text>Manifold </xsl:text>
	  <span class="name">
	    <xsl:call-template name="ExternalManifoldName">
	      <xsl:with-param name="intname" select="$curman"/>
	    </xsl:call-template>
	  </span>
	</th>
      </tr>
      <xsl:apply-templates mode="static"/>
    </table>
  </xsl:template>

  <xsl:template match="collection1" mode="static">
    <tr class="name">
      <td colspan="3">
	<xsl:value-of select="@external_name"/>
      </td>
    </tr>
    <xsl:apply-templates mode="static"/>
  </xsl:template>

  <xsl:template match="field1" mode="static">
    <tr>
      <xsl:attribute name="id">
	<xsl:value-of select="ancestor::collection1/attribute::name"/>
	<xsl:text>.</xsl:text>
	<xsl:value-of select="@name"/>
      </xsl:attribute>

      <td class="geometry field1">
	<xsl:value-of select="@external_name"/>
      </td>
      <td>
	<xsl:apply-templates mode="static"/>
      </td>
    </tr>    
  </xsl:template>

  <xsl:template match="collection2" mode="static">
    <div>
      <xsl:attribute name="class">
	<xsl:text>col2s name </xsl:text>
	<xsl:value-of select="ancestor::collection1/attribute::name"/>
	<xsl:text> </xsl:text>
	<xsl:value-of select="parent::field1/attribute::name"/>
      </xsl:attribute>
      <div class="TopologyHeadStyle">
	<div class="TopologyHeadStyle name" colspan="4">
	  <xsl:value-of select="@external_name"/>
	</div>
      </div>
      <xsl:apply-templates mode="static"/>
    </div>
  </xsl:template>

  <xsl:template match="field2" mode="static">
    <div class="fld2sStatic geometry">
      <span class="field2">
	<xsl:value-of select="@external_name"/>
      </span>
      <span class="rulesStatic">
	<xsl:apply-templates mode="static"/>
      </span>
    </div>
  </xsl:template>
  
  <xsl:template match="rule1" mode="static">
    <span class="rule1Static">
      <xsl:value-of select="."/>
    </span>
    <span class="betweenrules">
      <xsl:text/>
    </span>
  </xsl:template>
  
  <xsl:template match="rule2" mode="static">
    <span class="rule2Static">
      <xsl:value-of select="."/>
    </span>
  </xsl:template>
  

  
  <!-- INTERACTIVE Page -->

  <xsl:template match="manifold">
    <!-- Interactive -->
    <xsl:variable name="curman" select="@name"/>
    <table class="dmTable IntTopol">
      <tr class="HeadStyle">
	<th class="name" colspan="3">
	  <xsl:text>Manifold </xsl:text>
	  <span class="name">
	    <xsl:call-template name="ExternalManifoldName">
	      <xsl:with-param name="intname" select="$curman"/>
	    </xsl:call-template>
	  </span>
	</th>
      </tr>
      <xsl:apply-templates/>
    </table>
  </xsl:template>

  <xsl:template match="collection1">
    <!-- Interactive -->    
    <xsl:variable name="aps">&apos;</xsl:variable>
    <xsl:variable name="elemclass">fld1s</xsl:variable>	  
    <tr class="name">

      <td>
	<a name="{@name}" class="ListLink" href="#" onclick="{concat('ShowMyGeoms(',$aps,@name,$aps,',',$aps,'fld1s',$aps,')')}">
	  <xsl:value-of select="@external_name"/>
	</a>
      </td>
    </tr>

    <tr>
      <td>
	<xsl:apply-templates/>
      </td>
    </tr>
    
  </xsl:template>

  
  <xsl:template match="collection2">
    <!-- Interactive -->
    <table>

      <xsl:attribute name="class">
	<xsl:text>col2s name </xsl:text>
	<xsl:value-of select="ancestor::collection1/attribute::name"/>
	<xsl:text> </xsl:text>
	<xsl:value-of select="parent::field1/attribute::name"/>
      </xsl:attribute>
      <xsl:attribute name="style">
	<xsl:text>display:none;</xsl:text>
      </xsl:attribute>
      
      <tr class="TopologyHeadStyle">
	<th class="TopologyHeadStyle name" colspan="4">
	  <xsl:value-of select="@external_name"/>
	</th>
      </tr>
      <xsl:apply-templates/>
    </table>

  </xsl:template>

  

  
  <xsl:template match="field1">
    <!-- Interactive -->
    <xsl:variable name="aps">&apos;</xsl:variable>

    <xsl:variable name="MyDadsName">
      <xsl:value-of select="parent::collection1/attribute::name"/>
    </xsl:variable>
    <xsl:variable name="Description">
      <xsl:value-of select="parent::collection1/attribute::external_name"/>
      <xsl:text>.</xsl:text>
      <xsl:value-of select="@external_name"/>
    </xsl:variable>

    <div>
      <a name="{@name}" href="#" onclick="{concat('ShowThyGeoms(',$aps,$MyDadsName,$aps,',',$aps,@name,$aps,',',$aps,'col2s',$aps,',',$aps,$Description,$aps,')')}">
	<xsl:attribute name="class">
	  <xsl:text>fld1s geometry </xsl:text>
	  <xsl:value-of select="$MyDadsName"/>
	</xsl:attribute>
	<xsl:attribute name="style">
	  <xsl:text>display:none;</xsl:text>
	</xsl:attribute>
	<xsl:value-of select="@external_name"/>
      </a>
    </div>
    
  </xsl:template>

  
  <xsl:template match="field2">
    <!-- interactive -->    
    <tr class="fld2s geometry">
      <td class="spacer"></td>
      <td class="Fld2GeometryName"><xsl:value-of select="@external_name"/></td>
      <xsl:apply-templates/>
    </tr>
  </xsl:template>


  
  <xsl:template match="rule1">
    <!-- interactive -->
    <td>
      <xsl:attribute name="class">
	<xsl:text>rule1 </xsl:text>
	<xsl:value-of select="."/>
      </xsl:attribute>
      <xsl:value-of select="."/>
    </td>
    
  </xsl:template>

  <xsl:template match="rule2">
    <!-- intercative -->
    <td>
      <xsl:attribute name="class">
	<xsl:text>rule2 </xsl:text>
	<xsl:value-of select="."/>
      </xsl:attribute>
      <xsl:value-of select="."/>
    </td>
  </xsl:template>
  
  
</xsl:stylesheet>
