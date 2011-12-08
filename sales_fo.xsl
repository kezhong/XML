<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" omit-xml-declaration="yes" indent="yes"/>

    
<xsl:template match="/">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:kso="nothin">
        <fo:layout-master-set>
	    <fo:simple-page-master master-name="sequence" page-height="11in"
	     page-width="8.5in" margin-top=".5in" margin-bottom=".5in"
	     margin-left=".5in" margin-right=".5in">
		<fo:region-body margin=".5in"/>
	    </fo:simple-page-master>
	</fo:layout-master-set>
	
				
	<fo:page-sequence master-reference="sequence">
		<fo:flow flow-name="xsl-region-body">
		    <fo:block text-align="center" font-size="14pt" font-family="sans-serif" text-decoration="underline" font-weight="bold">Sales by date</fo:block>
		<fo:table table-layout="fixed" border-width="1mm" border-style="solid" font-size="12pt" space-before="5pt" >
		    <fo:table-column column-width="30mm" />
		    <fo:table-column column-width="30mm" />
		    <fo:table-column column-width="30mm" />
		    <fo:table-column column-width="40mm" />
		    <fo:table-column column-width="40mm" />
			
			<fo:table-header text-align="center">
			    <fo:table-row>
			      <fo:table-cell>
				<fo:block font-weight="bold">Date</fo:block>
			      </fo:table-cell>
			      <fo:table-cell>
				<fo:block font-weight="bold">Amount</fo:block>
			      </fo:table-cell>
			      <fo:table-cell>
				<fo:block font-weight="bold">Paid</fo:block>
			      </fo:table-cell>
			      <fo:table-cell>
				<fo:block font-weight="bold">Description</fo:block>
			      </fo:table-cell>
			      <fo:table-cell>
				<fo:block font-weight="bold">Salesperson</fo:block>
			      </fo:table-cell>
			    </fo:table-row>
			  </fo:table-header>
			
    			<fo:table-body text-align="center">
			    <xsl:for-each select="//sale">
				<fo:table-row>
				<fo:table-cell>
				    <fo:block><xsl:value-of select="//@date" /></fo:block>
				</fo:table-cell>
				<fo:table-cell>
				    <fo:block text-align="right"><xsl:value-of select="amount" /></fo:block>
				</fo:table-cell>
				<fo:table-cell>
				    <fo:block text-align="right"><xsl:value-of select="paid" /></fo:block>
				</fo:table-cell>
				<fo:table-cell>
				    <fo:block><xsl:value-of select="description" /></fo:block>
				</fo:table-cell>
				<fo:table-cell>
				    <fo:block><xsl:value-of select="salesperson" /></fo:block>
				</fo:table-cell>
				</fo:table-row>
			    </xsl:for-each>
			    
			    
			    <xsl:variable name="totalRecords" select="count(//sale)" />
			    <xsl:variable name="totalAmount" select="sum(//sale/amount)" />
			    <xsl:variable name="average" select="$totalAmount div $totalRecords" />
			    <fo:table-row>
			    <fo:table-cell number-columns-spanned="5">
				<fo:block>Number of Sales:<xsl:value-of select="$totalRecords"/></fo:block>
			    </fo:table-cell>
			    </fo:table-row>
			    <fo:table-row>
			    <fo:table-cell number-columns-spanned="5">
				<fo:block>Total sales:<xsl:value-of select='format-number($totalAmount,"$###,###.00")'/></fo:block>
			    </fo:table-cell>
			    </fo:table-row>
			    <fo:table-row>
			    <fo:table-cell number-columns-spanned="5">
				<fo:block>Average sales:<xsl:value-of select='format-number($average,"$###,###.00")'/></fo:block>
			    </fo:table-cell>
			    </fo:table-row>
	    
		      </fo:table-body>          	    
		</fo:table>
		</fo:flow>
	</fo:page-sequence>		
    </fo:root>
    
</xsl:template>
</xsl:stylesheet>

