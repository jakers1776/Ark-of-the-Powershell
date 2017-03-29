function Get-Stockquote {
<#
.Synopsis
Get Stock quote for a company Symbol 
.Description
Get Stock quote for a company Symbol 
Parameter symbol
Enter the Symbol of the company/
.Example
./Get-stockquote -Symbols ge
This example shows how to return the stock quote for the GE stock. 
.Example
./Get-stockquote -Symbols "ge","mmm" | format-table
In this example the function will return the stock quotes for GE and 3m
 
#>
 [cmdletBinding()]
Param(
    [parameter(ValueFromPipeline=$true,ValueFromPipelineByPropertyName=$true,Mandatory=$TRUE)]
    $Symbols
    )
  foreach ($symbol in $symbols)
  {
   $webservice = New-WebServiceProxy -Uri 'http://www.webservicex.com/stockquote.asmx?WSDL'
[xml]$Quote = $webservice.getquote($symbol)
 $props = @{
                                                'Symbol' = $Quote.Stockquotes.stock.symbol;
                                                'Last' = $Quote.Stockquotes.stock.last;
                                                'Date' = $Quote.Stockquotes.stock.date;
                                                'Time' = $Quote.Stockquotes.stock.time;
                                                'Change' = $Quote.Stockquotes.stock.change;
                                                'Open' = $Quote.Stockquotes.stock.open;
                                                'High' = $Quote.Stockquotes.stock.high;
                                                'Low' = $Quote.Stockquotes.stock.low;
                                                'Volume' = $Quote.Stockquotes.stock.volume;
                                                'MktCap' = $Quote.Stockquotes.stock.MktCap;
                                                'Previous Close' = $Quote.Stockquotes.stock.PreviousClose;
                                                'Precentage Change' = $Quote.Stockquotes.stock.PercentageChange;
                                                'AnnRange' = $Quote.Stockquotes.stock.annrange;
                                                'Earns' = $Quote.Stockquotes.stock.earns;
                                                'P-E' = $Quote.Stockquotes.stock.'P-E';
                                                'Name' = $Quote.Stockquotes.stock.name
 
                                                }
                          
                                     $obj = New-Object -TypeName PSObject -Property $props
                                     $obj.PSobject.typenames.insert(0,'VT.Weather')
                                     Write-Output $obj
  
 
}   
}