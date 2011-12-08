<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
    <html>
	<head>
	    <title>Sales by date</title>
	    <xsl:element name="link">
	    <xsl:attribute name="rel">stylesheet</xsl:attribute>
	    <xsl:attribute name="type">text/css</xsl:attribute>
	    <xsl:attribute name="href">sales.css</xsl:attribute>
	    </xsl:element>
	</head>
        <body>
	    <div id="contain">
		<h1 align="center"><u>Sales by date</u></h1>
		<table>
		    <thead id="sans">
			<tr>
			    <th><u>Date</u></th>
			    <th><u>Amount</u></th>
			    <th><u>Paid</u></th>
			    <th><u>Description</u></th>
			    <th><u>Salesperson</u></th>
			</tr>
		    </thead>
		    <xsl:for-each select="//sale">
			<xsl:sort select="//@date" data-type="number" order="ascending" />
		      <tr>
			<td align="center"><xsl:value-of select="//@date" /></td>
			<td align="right"><xsl:value-of select="amount" /></td>
			<td align="right"><xsl:value-of select="paid" /></td>
			<td align="center"><xsl:value-of select="description" /></td>
			<td align="center"><xsl:value-of select="salesperson" /></td>
		      </tr>
		    </xsl:for-each>
			<xsl:variable name="totalRecords" select="count(//sale)" />
			<xsl:variable name="totalAmount" select="sum(//sale/amount)" />
			<xsl:variable name="average" select="$totalAmount div $totalRecords"/>
		    <tr id="sans">			
			<td colspan="5" align="center"><b>Number of sales:<xsl:value-of select="$totalRecords"/></b></td>
		    </tr>
		    <tr id="sans"> 
			<td colspan="5" align="center"><b>Total sales:<xsl:value-of select='format-number($totalAmount,"$###,###.00")'/></b></td>
		    </tr>
		    <tr id="sans">
			<td colspan="5" align="center"><b>Average sales:<xsl:value-of select='format-number($average,"$###,###.00")'/></b></td>
		    </tr>
		</table>

	    </div>
	</body>
    </html>
</xsl:template>
</xsl:stylesheet>