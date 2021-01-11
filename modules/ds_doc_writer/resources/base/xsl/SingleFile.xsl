<?xml version="1.0" encoding="UTF-8"?>
<!-- SVN $Rev: 790 $ -->
<xsl:stylesheet 
	version="2.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	
	<xsl:variable name="maintitle" select="concat('Datamodel information ',/datamodel/@external_name)"/>

	<xsl:template match="/">
		<html> 
		<head>
			<title><xsl:value-of select="$maintitle"/></title>
			<link rel="Stylesheet" href="html.css" /> 
			<link rel="stylesheet" href="dm.css" />
			<link rel="stylesheet" href="custom.css" />

			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
			</script>
			<script>
				$(document).ready(function(){
				  $("#toggledetail").click(function(){
					$(".technical").toggle();
					});
				  $("#togglevisibility").click(function(){
					$(".VisFalse").toggle();
				  });
				  $("#toggleclist").click(function(){
					$(".overview").toggle();
				  });
				  $("#togglecollections").click(function(){
					$(".collections").toggle();
				  });
				  $("#toggleenumerators").click(function(){
					$(".enumerators").toggle();
				  });
				  $("#toggletopology").click(function(){
					$(".topology").toggle();
				  });
				  $("#toggledmhistory").click(function(){
					$(".dmHistory").toggle();
				  });
				  $("#togglemapped").click(function(){
					$(".MappedTo").toggle();
				  });
				});
			</script>
		</head>
			<body>
				<h1>Datamodel information <xsl:value-of select="/datamodel/@external_name"/></h1>
				
				<xsl:apply-templates select="/datamodel/datamodel_info"/>
				<xsl:call-template name="document_info"/>				
				<xsl:apply-templates select="/datamodel/datamodel_history"/>
				
				<button id="toggledetail" class="high">Toggle Overview/Detail</button>
				<button id="toggleclist" class="high">Toggle Collection List</button>
				<div class="overview">
				<h2>Collection list</h2>
				<xsl:for-each select="datamodel/category">
					<table class="dmTable">
						<tr class="HeadStyle">
							<th colspan="3"><xsl:value-of select="@name"/></th>
						</tr>
						<xsl:for-each select="collection">
							<tr class="overview">
								<td class="overview_name">
								
									<xsl:element name="a">
										<xsl:attribute name="href">
											<xsl:text>#</xsl:text>
											<xsl:value-of select="@name"/>
										</xsl:attribute>
										<xsl:attribute name="class">
											<xsl:text>CollectionLink</xsl:text>
										</xsl:attribute>
										<xsl:value-of select="@external_name"/>
									</xsl:element>
									
								</td>
								<td class="InternalName technical">
									<xsl:value-of select="@name"/>
								</td>
								<td class="overview_description">
									<xsl:value-of select="@description"/>
								</td>
							</tr>
						</xsl:for-each>
					</table>					
				</xsl:for-each>
				</div>
				
				<button id="togglecollections" class="high">Toggle Collections</button>
				<div class="collections">
				<h2>Collections</h2>
				<xsl:for-each select="datamodel/category/collection">
					
						<button class="high" id="togglevisibility">Toggle Visible fields</button>
						<button class="high" id="togglemapped">Toggle Mapped fields</button>
						<br></br>
						<table class="dmCollection" id="{@name}">
							<tr class="TableName">
								<td colspan="7"><h3 class="InTable"><xsl:value-of select="@external_name"/></h3></td>
							</tr>
							<tr class="TableCategory">
								<td colspan="7">Category: <xsl:value-of select="@category"/></td>
							</tr>
							<tr>
								<td colspan="7" class="description">
									<xsl:value-of select="@description"/>
								</td>
							</tr>
							<tr class="HeadStyle">
								<th>Name</th>
								<th class="technical">Internal name</th>
								<th class="technical">Type</th>
								<th class="technical">Sub type</th>
								<th class="technical">Key?</th>
								<th class="technical">Mandatory?</th>
								<th class="technical">Description</th>
							</tr>
							<xsl:apply-templates/>
						</table>
						
				</xsl:for-each>
				</div>
				
				<button id="toggleenumerators" class="high">Toggle Enumerators</button>
				<div class="enumerators">
					<h2>Enumerators</h2>
					<xsl:for-each select="datamodel/enumerators">
						<br></br>
						<xsl:apply-templates/>
					</xsl:for-each>
				</div>

				<button id="toggletopology" class="high">Toggle Topology</button>
				<div class="topology">
					<h2>Topology Interactions</h2>
					<xsl:for-each select="datamodel/topology_by_manifold">
						<xsl:apply-templates/>
					</xsl:for-each>
				</div>
				
			</body>
		</html>
	</xsl:template>
	
	<xsl:template name="document_info">
		<table>
 			<tr class="Info">
				<td>
					<xsl:text>Document Generation Date</xsl:text>				
				</td>
				<td>
					<b>Aug 2019</b>
				</td>
			</tr>
			<tr class="Info">
				<td><xsl:text>Copyright 2019</xsl:text></td>
				<td><b><xsl:text>Realworld Software Products</xsl:text></b></td>
			</tr>
		</table>
	</xsl:template>
	
	<xsl:template match="datamodel_info">
		<table class="dmTable">
			<tr>
				<td><xsl:text>XML Export date: </xsl:text></td>
				<td><b><xsl:value-of select="../@date"/></b></td>
			</tr>
			<xsl:apply-templates/>
		</table>
	</xsl:template>
	
	<xsl:template match="dm_datamodel_version">
		<tr>
			<td><xsl:text>Version: </xsl:text></td>
			<td>
				<b><xsl:value-of select="."/></b>
				<xsl:text> based on product </xsl:text>
				<b><xsl:value-of select="@dm_product_name"/></b>
				<xsl:text> module </xsl:text>
				<b><xsl:value-of select="@dm_module_name"/></b>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="dm_current_dd_version">
		<tr>
			<td><xsl:text>Current DD version: </xsl:text></td>
			<td><b><xsl:value-of select="."/></b></td>
		</tr>
	</xsl:template>

	<xsl:template match="dm_version">
	</xsl:template>
	
	<xsl:template match="dm_dataset">
		<tr>
			<td><xsl:text>Dataset Internal Name: </xsl:text></td>
			<td><b><xsl:value-of select="."/></b></td>
		</tr>
	</xsl:template>

	<xsl:template match="dm_ace_name">
		<tr>
			<td><xsl:text>Ace used: </xsl:text></td>
			<td><b><xsl:value-of select="."/></b></td>
		</tr>
	</xsl:template>
	
	<xsl:template match="datamodel_history">
		<button id="toggledmhistory" class="high">Toggle Datamodel History</button>
		<div class="dmHistory">
			<h3>Datamodel History Table</h3>
			<xsl:for-each select="datamodel_history_record">
				<table class="dmDataModelHistory">
					<tr class="HeadStyle">
						<th colspan="2">
							<xsl:text>Product: </xsl:text>
							<xsl:value-of select="product_name"/>
							<br></br>
							<xsl:text>Module: </xsl:text>
							<xsl:value-of select="mod_name"/>
						</th>
					</tr>
					<xsl:for-each select="*">
						<tr class="mcTableRowStyle">
							<td>
								<xsl:value-of select="name()"/>
							</td>
							<td>
								<xsl:value-of select="."/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:for-each>
		</div>
	</xsl:template>


	<xsl:template match="field">
		<xsl:element name="tr">

			<xsl:attribute name="class">
				<xsl:text>Field Vis</xsl:text>
				<xsl:value-of select="@visible"/>
				<xsl:if test="@mapped_to">
					<xsl:text> MappedTo</xsl:text>
				</xsl:if>
				<xsl:if test="@mapped">
					<xsl:text> Mapped</xsl:text>
				</xsl:if>
			</xsl:attribute>

			<xsl:apply-templates/>

		</xsl:element>
	</xsl:template>
	
	
	<!-- START Templates for the properties of a field -->

	<xsl:template match="external_name">
		<td class="name">
		<xsl:element name="div">
			<xsl:attribute name="class">
				<xsl:value-of select="../@type"/>
			</xsl:attribute>
			<xsl:value-of select="."/>
		</xsl:element>
		</td>
	</xsl:template>

	<xsl:template match="name">
		<td class="technical"><xsl:value-of select="."/></td>
	</xsl:template>
	
	<xsl:template match="key">
		<td class="technical"><xsl:value-of select="."/></td>
	</xsl:template>

	<xsl:template match="mandatory">
		<td class="technical"><xsl:value-of select="."/></td>
	</xsl:template>

	<xsl:template match="help_text">
		<td class="technical">
			<xsl:if test="parent::field/field_sub_type/enumerated">
				<xsl:text></xsl:text>
			</xsl:if>
			<xsl:value-of select="."/>
		</td>
	</xsl:template>
	
	<xsl:template match="field_type">
		<td class="technical"><xsl:value-of select="@type"/></td>
	</xsl:template>
	
	<xsl:template match="field_sub_type">
		<td class="technical">
			<xsl:apply-templates/>
		</td>
	</xsl:template>
	
	<xsl:template match="enumerated">
		<xsl:text> </xsl:text>
		<xsl:element name="a">
			<xsl:attribute name="href">
				<xsl:text>#</xsl:text>
				<xsl:value-of select="@enumerator_name"/>
			</xsl:attribute>
			<xsl:attribute name="class">
				<xsl:text>EnumeratorLink</xsl:text>
			</xsl:attribute>
			<xsl:value-of select="@enumerator_name"/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="phys_type">
		<xsl:value-of select="@type"/>
	</xsl:template>
	
	<xsl:template match="geom_type">
		<xsl:value-of select="@type"/>
	</xsl:template>
	
	<xsl:template match="inmanifold">
		<!-- create a link to the manifold rule at
			 collectionname.fieldname
		-->
		<xsl:text>(</xsl:text>
			<xsl:element name="a">
				<xsl:attribute name="href">
					<xsl:text>#</xsl:text>
					<xsl:value-of select="../../../@name"/>
					<xsl:text>.</xsl:text>
					<xsl:value-of select="../../name"/>
				</xsl:attribute>
				<xsl:value-of select="@name"/>
			</xsl:element>
		<xsl:text>)</xsl:text>
	</xsl:template>

	<xsl:template match="mapped">
		<xsl:text>*</xsl:text>
	</xsl:template>

	<xsl:template match="mapped_to">
		<br></br>
		<xsl:text>Mapped to </xsl:text>
		<span class="geometry">
			<xsl:value-of select="@external_name"/>
		</span>
		
	</xsl:template>
	
	<xsl:template match="join_type">
		<xsl:value-of select="@join_type"/>
		<xsl:text> with:</xsl:text>
		<br></br>
		<ul>
			<xsl:for-each select="target_table">
				<li class="Join">
					<xsl:element name="a">
					<xsl:attribute name="href">
						<xsl:text>#</xsl:text>
						<xsl:value-of select="@name"/>
					</xsl:attribute>
						<xsl:value-of select="@external_name"/>
					</xsl:element>
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>
	
	<xsl:template match="logical">
		<td class="technical">Logical</td>
	</xsl:template>
 	<!-- END Templates for the properties of a field -->
	
	<xsl:template match="enumerator">
		<table class="dmEnumerator" id="{@name}">
			<tr class="HeadStyle">
				<th class="name" colspan="3">
					<xsl:value-of select="@name"/>
				</th>
			</tr>
			<tr class="HeadStyle">
				<th class="technical">Type</th>
				<th class="technical">Domain Class</th>
				<th class="technical">Storage Class</th>
			</tr>
			<tr class="McTableRowStyle">
				<td class="technical"><xsl:value-of select="@type"/></td>
				<td class="technical"><xsl:value-of select="@domain_class"/></td>
				<td class="technical"><xsl:value-of select="@storage_class"/></td>
			</tr>
			<tr>
				<td colspan="3">
					<ul class="EnumeratorValues">
						<xsl:apply-templates/>
					</ul>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template match="enumerator/value">
			<li class="EnumeratorValue"><xsl:value-of select="."/></li>
	</xsl:template>
	
	<xsl:template match="topology">
		<div class="manifold">
			<xsl:attribute name="id">
				<xsl:value-of select="@manifold_name"/>
			</xsl:attribute>

			<h3>Manifold 
				<span class="name">
					<xsl:value-of select="@manifold_name"/>
				</span>
			</h3>
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	
	<xsl:template match="topology_table">
		<!-- interactions for all fields of a collection -->
		<table class="dmTopology">
			<tr class="HeadStyle">
				<th colspan="2"><xsl:value-of select="@table_external_name"/></th>
			</tr>
			<xsl:for-each select="topology_interaction">
				<tr>
					<xsl:attribute name="class">
						<xsl:choose>
							<xsl:when test="(position() mod 2) != 1">
								<xsl:text>evenRow</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>oddRow</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:attribute name="id">
						<xsl:value-of select="parent::topology_table/attribute::table_name"/>
						<xsl:text>.</xsl:text>
						<xsl:value-of select="@field_name"/>
					</xsl:attribute>
					
					<td class="TopologicalField"><xsl:value-of select="@field_external_name"/></td>
					<td>
						<xsl:apply-templates/>
					</td>						
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>

	<xsl:template match="interacts_with">
			<ul class="TopologyList">
				<li class="TopologyFieldItem">
					<span class="name">
						<xsl:value-of select="@table_external_name"/>
						<xsl:text>.</xsl:text>
						<span class="geometry">
							<xsl:value-of select="@field_external_name"/>
						</span>
						<xsl:text>: </xsl:text>
					</span>
					<span class="TopologyRules">
						<xsl:for-each select="rule">
							<xsl:value-of select="@rule"/>
							<xsl:text> </xsl:text>
						</xsl:for-each>
					</span>			
				</li>
			</ul>
	</xsl:template>

</xsl:stylesheet>