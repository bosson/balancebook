<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>View</title>
 
   <style>

    body {
      background.color: #c2e2f2;
      margin.left: 5;
      margin.right: 5;
      margin.top: 5;
      margin.bottom: 5;
    }

    h1,h2,h3,p,td,a,body {
      font-family: lucida, arial, sans-serif;
    }  

   </style>

  </head>

  <body>
    <h1>Välkommen till "plus.xml" <br/>- bokföring och redovisning</h1>

     <p>Book-keeping/Ledger application using XML/XSL and Java servlets.</p>
     <p>Bokföring enkelt, översiktligt, gratis och fritt att utveckla vidare!</p>
     <p>En funktion: ny transaktion; Oändligt med vyer och rapporter.</p>

     <h2> Bokf&ouml;ring med XML </h2>

     <p> XML g&ouml;r att det &auml;r enkelt att skapa vyer &ouml;ver information. Strukturen för en 'bok' (med konton, ingåeende saldon och transaktioner) består av just konton (accounts), saldon (saldo) och transaktioner (transactions) i en XML-fil. 
Nya transaktioner läggs till i slutet av transaktionslistan. Du har alltså all information i en xml-fil som enkelt kan hanteras som just din bokföringsfil. För varje nytt bokslutsår skapar du en ny fil för årets transaktioner.</p>
     <p> Bokföringen kan genom XSLT (se: <a href="http://w3.org" target="_new">W3C</a>) i en webberver formas till olika rapporter eller listor. Detta sker genom att du  väljer den xsl-fil som du vill ska forma visningen av informationen.</p>
     </p>
 
     <h2> Hur bokf&ouml;ring fungerar </h2>

     <p> Bokföring bygger på balans mellan konton (dubbel bokföring från 1400-talets italen) <a href="http://www2.nutek.se/snippets/startlinjen.taf?page=bokforing" target="_new"> Läs mer på startlinjen/nutek </a> </p>
     <p> I Svergie använder de flesta BAS-standarden för konton. BAS använder sig av fyra nummerserier f&ouml;r Tillgångar, Skulder (och eget kapital), Kostnader och Intäkter. BAS-kontoplanen och BAS-kontonummer (XXXX) hittar du p&aring; <a href="http://www.bas.se/" target="_new">www.bas.se</a>. Ett vanligt format för att dela information mellan bokföringsprogram är "SIE"-formatet som exporteras eller importeras mellan prorgammen. Se: <a href="http://www.sie.se/" target="_new">www.sie.se</a></p>
     <p> För balans ska: resultat =  - Intäkter - Kostnader = Tillgångar + Skulder </p>
     <p> Vid bokslutet förs resultatet in i balansen (tillgångar/skulder) och summan blir 0. För nästa år börjar Intäkter och Kostnader på noll och balanseras av att föregående resultat går in i skulder. Balansen utgör de ingående världen för det nya året.</p>

     <h3> BAS-konton </h3> 

     <table border="1" bgcolor="lightgreen" cellspacing="0" cellpadding="5" width="100%"> 
       <tr bgcolor="#c2c2c2" valign="top"><td><i>Resultat</i></td><td><i>Balans (och ingående saldo)</i></td><tr>
       <tr valign="top"><td><b> I</b>ntäkter (3XXX)</br>-Intäkter</br>-Bidrag</td><td><b>T</b>illgångar (1XXX)<br/>Inventarier<br/>Lager<br/>Kundfordringar<br/>Momsfordran<br/>Checkkonto</td><tr>
       <tr valign="top"><td><b>K</b>ostnader (4XXX-9XXX)<br/>Hyra</br>Datatillbehör</br>Förbrukningsinventarier</br>Resekonstnader</br>Representation</br>Telefon</br>Arbetsgivaravgifter<br/>Lön<br/>Redovisningstjänster</td><td><b>S</b>kulder (och eget kapital)(2XXX)<br/>-Aktiekapital<br/>-Resultat</br>Leveranörsskulder<br/>Utgående/Ingående moms<br/>Källskatt<br/>Upplupna Sociala avgifter</td><tr>

     </table>

     <h3> Transaktioner </h3>
 
     <p>För alla transaktioner ska summan vara 0, det betyder att hela bokföringen är i balans. Det krävs dock att du använder konton rätt och vet om värdet ska vara positivt eller negativt. Det kan verka helt tokigt hur man ska bokföra en transaktion, men allt har en förklaring i balansräkningen. För att undvika misstag bör du använda mallar för transaktioner eller tydligt se att konton är av rätt typ och du inte har minus där det ska vara positiva värden.</p><p>Här förljer några exempel på transaktioner med uppdelade efter konton (på samma vis som ovan):</p>

     <table border="1" bgcolor="lightblue" cellspacing="0" cellpadding="5" width="100%"> 
       <tr bgcolor="lightgray"><td width="50%">Direkt inköp telefon</td><td></td></tr>
       <tr><td>-</td><td>1930:Checkkonto -542.0</td></tr>
       <tr><td>6200:Telefon 434.0</td><td>2641:Ingående moms 108.0</td></tr>
     </table>

     <table border="1" bgcolor="lightblue" cellspacing="0" cellpadding="5" width="100%"> 
       <tr bgcolor="lightgray"><td width="50%">Faktura (till dig)</td><td></td></tr>
       <tr><td>-</td><td>-</td></tr>
       <tr><td>6530:Redovisningstjänster 900.0</td><td>2641:Ingående moms 225.0 <br/>2440:Leverantörsskulder -1125.0</td></tr>
     </table>

     <table border="1" bgcolor="lightblue" cellspacing="0" cellpadding="5" width="100%"> 
       <tr bgcolor="lightgray"><td width="50%">Faktura till kund</td><td></td></tr>
       <tr><td>3010:Intäkter -64408.0</td><td>1510:Kundfordringar 80510.0</td></tr>
       <tr><td>-</td><td>2610:Utgående moms -16102.0</td></tr>
     </table>

     <table border="1" bgcolor="lightblue" cellspacing="0" cellpadding="5" width="100%"> 
       <tr bgcolor="lightgray"><td width="50%">Faktura betald</td><td></td></tr>
       <tr><td>-</td><td>1510:Kundfordringar -80510.0<br/>1930:Checkkonto 80510.0</td></tr>
       <tr><td>-</td><td>-</td></tr>
     </table>

     <table border="1" bgcolor="lightblue" cellspacing="0" cellpadding="5" width="100%"> 
       <tr bgcolor="lightgray"><td width="50%">Löneutbetalning (den 25:e)</td><td></td></tr>
       <tr><td></td><td>1930:Checkkonto -19720.0 </td></tr>
       <tr><td>7011:Lön Pelle 30000<br/>7510:Arbetsgivaravgifter 9846.0</td><td>2710:Personalens källskatt -10280<br/>2940:Upplupna sociala avgifter -9846.0</td></tr>
     </table>

     <table border="1" bgcolor="lightblue" cellspacing="0" cellpadding="5" width="100%"> 
       <tr bgcolor="lightgray"><td width="50%">Momssammanställning (vid slutet av månaden)</td><td></td></tr>
       <tr><td>-</td><td>1650:Momsfordran 2500.0</td></tr>
       <tr><td>-</td><td>2610:Utgående moms 2500.0<br/>2641:Ingående moms -5000.0</td></tr>
     </table>


     <table border="1" bgcolor="lightblue" cellspacing="0" cellpadding="5" width="100%"> 
       <tr bgcolor="lightgray"><td width="50%">Betala skatt...</td><td></td></tr>
       <tr><td>-</td><td>1930:Checkkonto: -22626<br/>1650:Momsfordran 2500</td></tr>
       <tr><td>-</td><td>2940:Upplupna sociala avgifter 9846.0 <br/>2710:Personalens källskatt 10280.0</td></tr>
     </table>

     <h2>Att göra</h2>
	 <p>
	 <li>Testa SIE4-konvertering p&aring; fler k&auml;llor</li>
	 <li>Testa SIE4-export  p&aring; fler progam</li>
	 <li>EU-BAS 2000 konton i account.xml-format</li>
	 <li>Mall-funktion för fler vanliga transaktioner</li>
	 <li>Skattekonto-vy för 1630</li>
	 <li>Reskonto-vy</li>
	 <li></li>
	 </p>
    
     <h2> Transaktions makron </h2>
     <p>
        <li>Kund Faktura</li> 
        <li>Kund Faktura betaldad</li> 
        <li>In Faktura</li> 
        <li>In Faktura betald</li> 
        <li>Kontorsinköp</li> 
        <li>Lön</li> 
        <li>Moms/Skatte-betalning</li> 
     </p>

    <address><a href="mailto:jonas@c213.89.103.167.cm-upc.chello.se">Jonas Bosson</a></address>
<!-- Created: Wed Jul  3 16:04:09 CEST 2002 -->
<!-- hhmts start -->
Last modified: Fri Aug  9 14:51:10 CEST 2002
<!-- hhmts end -->
  </body>
</html>
