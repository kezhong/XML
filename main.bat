@echo off
start SalesXSLToSalesHTML.bat
start Sales_foXSLToSalesFo.bat
pause 4
start /wait SalesFoToSalesPDF.bat
start /wait SalesFoToSalesPNG.bat
start /wait SalesFoToSalesRTF.bat

EXIT