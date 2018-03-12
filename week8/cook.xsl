<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template match="/">
  <html>
  <head>
    <title>My Cookbook</title>
    <style type="text/css">
      h1 { font-style: italic ; 
      color: green ;
     text-align: center;
      }
      table{
      width:800px;
      height:500px;
      margin: 0 auto;
      }
       table {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	border-width: 1px;
	border-color: #999999;
	border-collapse: collapse;
}
th {
	background-color:#c3dde0;
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9c6c9;
}
 tr {
	background-color:#d4e3e5;
}
td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9c6c9;
}
      td.prep { font-style: italic ; bgcolor: orange ; colspan: 2}
    </style>
  </head>
  <body>
    <h1>My Recipe Collection</h1>
    <table border="1">

    <xsl:for-each select="cookbook/recipe">
      <tr bgcolor="#9acd32">
        <th bgcolor="green" colspan="2"><xsl:value-of select="name"/></th>
      </tr>
      <xsl:for-each select="ingredient">
      <tr>
        <td><xsl:value-of select="name"/></td>
        <td><xsl:value-of select="amount"/><xsl:value-of select="unit"/></td>
      </tr>
      </xsl:for-each>
      <tr>
      <td>prepare</td>
        <td class="prep" colspan="2"><xsl:value-of select="preparation"/></td>
      </tr>
      <tr>
      <td>cooking</td>
        <td bgcolor="lightyellow" colspan="2"><xsl:value-of select="cooking"/></td>
      </tr><br></br>
    </xsl:for-each>
    
    </table>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>


