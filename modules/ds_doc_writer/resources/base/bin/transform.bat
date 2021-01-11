@ECHO OFF
REM %1 Input file (xml)
REM %2 XSL Stylesheet (xls)
REM %3 Outputfile (html)
SET XSLT_PROCESSOR=%~dp0saxon-he-10.2.jar
pushd %~dp0
ECHO Source: %~dp0..\data\%1
ECHO Xsl:    %~dp0..\xsl\%2
ECHO Html:   %~dp0..\html\%3
REM
REM Run an installed version:
REM
REM "C:\Program Files\Saxonica\SaxonHE10.2N\bin\Transform.exe" -s:%~dp0..\data\%1 -xsl:%~dp0..\xsl\%2 -o:%~dp0..\html\%3
REM
REM Run the Java version in the module:
REM
"%JAVA_HOME%"\bin\java.exe -cp %XSLT_PROCESSOR% net.sf.saxon.Transform -s:%~dp0..\data\%1 -xsl:%~dp0..\xsl\%2 -o:%~dp0..\html\%3
REM
REM Open the output:
REM
%~dp0..\html\%3
