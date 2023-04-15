<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>Library Management System</title>
        <style>
          table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
            padding: 5px;
          }
          th {
            background-color: lightgrey;
            font-weight: bold;
          }
          body {
            display: flex;
            justify-content: center;
            
          }
          h1 {
            text-align: center;
            margin-bottom: 4rem;
          }
        </style>
      </head>
      <body>
        <h1>Library Management System</h1>
        <h2>Books</h2>
        <table>
          <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Author</th>
            <th>Year</th>
            <th>Publisher</th>
            <th>ISBN</th>
            <th>Copies</th>
          </tr>
          <xsl:for-each select="/library/books/book">
            <tr>
              <td><xsl:value-of select="@id"/></td>
              <td><xsl:value-of select="title"/></td>
              <td><xsl:value-of select="author"/></td>
              <td><xsl:value-of select="year"/></td>
              <td><xsl:value-of select="publisher"/></td>
              <td><xsl:value-of select="isbn"/></td>
              <td>
                <xsl:for-each select="copies/copy">
                  <xsl:value-of select="@id"/>
                  <xsl:if test="@available = 'true'"> (available)</xsl:if>
                  <xsl:if test="@available = 'false'"> (checked out)</xsl:if>
                  <br/>
                </xsl:for-each>
              </td>
            </tr>
          </xsl:for-each>
        </table>
        <h2>Members</h2>
        <table>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Address</th>
            <th>Phone</th>
            <th>Borrowed Books</th>
          </tr>
          <xsl:for-each select="/library/members/member">
            <tr>
              <td><xsl:value-of select="@id"/></td>
              <td><xsl:value-of select="name"/></td>
              <td><xsl:value-of select="email"/></td>
              <td><xsl:value-of select="address"/></td>
              <td><xsl:value-of select="phone"/></td>
              <td>
                <xsl:for-each select="borrowed/book">
                  <xsl:value-of select="@id"/> - <xsl:value-of select="@copy"/>
                  <br/>
                </xsl:for-each>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
