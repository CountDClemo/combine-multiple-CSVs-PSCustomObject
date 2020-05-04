<# 

 NOTES
  Version:        1.0
  Author:         CountDClem
  Creation Date:  2020-05-04
  Purpose/Change: N/A Initial script development

This posting is provided "AS IS" with no warranties, and confers no rights.

This Sample Code is provided for the purpose of illustration only and is not
intended to be used in a production environment.  THIS SAMPLE CODE AND ANY
RELATED INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF
MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE.  We grant You a
nonexclusive, royalty-free right to use and modify the Sample Code and to
reproduce and distribute the object code form of the Sample Code, provided
that You agree: (i) to not use Our name, logo, or trademarks to market Your
software product in which the Sample Code is embedded; (ii) to include a valid
copyright notice on Your software product in which the Sample Code is embedded;
and (iii) to indemnify, hold harmless, and defend Us and Our suppliers from and
against any claims or lawsuits, including attorneys’ fees, that arise or result
from the use or distribution of the Sample Code.

#>

Import-CSV "$home\Desktop\test-custom-object\Name-Phone-Stnumber-Stname.csv" | ForEach-Object {

$Streetname = $_.'Street Name'
$Streetnumber = $_.'Street number'

    [PSCustomObject]@{

    Name = $_.name 

	Phone = $_.Phone

	'Street number' = $_.'Street number'

	'Street Name' = $_.'Street Name'

        'Date Purchased' = (import-csv "$home\Desktop\test-custom-object\stnumber-stname-datepurchased.csv" | 
	where-object {$_.'Street Name' -eq $Streetname -and $_.'Street number' -eq $Streetnumber}).'Date Purchased'
 
        'Home Value' = (import-csv "$home\Desktop\test-custom-object\stnumber-stname-homeval-tax.csv" | 
	where-object {$_.'Street Name' -eq $Streetname -and $_.'Street number' -eq $Streetnumber}).'Home Value'

        Tax = (import-csv "$home\Desktop\test-custom-object\stnumber-stname-homeval-tax.csv" | 
	where-object {$_.'Street Name' -eq $Streetname -and $_.'Street number' -eq $Streetnumber}).Tax


}
   }  |  
   
   Export-Csv -Path "$home\Desktop\test-custom-object\Final-Combination.csv" -NoTypeInformation -Append