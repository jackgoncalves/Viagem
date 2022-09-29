*** Settings ***
Library        SeleniumLibrary

*** Variables ***



*** Keywords ***
E seleciono a passagem desejada
    Click Element    locator=(//span[contains(.,'Book Now')])[1]


 E preencho os dados para efetuar a compra
   Execute Javascript             window.scrollTo(0,200)
   Input Text                   locator=firstname_1    text=Jack
   Input Text                   locator=lastname_1    text=Gonca    
   Click Element                locator=nationality_1
   Select From List By Label    //select[contains(@name,'nationality_1')]        Brazil

   Click Element                locator=dob_month_1
   Select From List By Label    dob_month_1       04 April

   Click Element                locator=dob_day_1
   Select From List By Label    dob_day_1       5

   Click Element                locator=dob_year_1
   Select From List By Label    dob_year_1       2022

   Input Text    locator=passport_1    text=6236446464646
   Execute Javascript             window.scrollTo(0,300)

   Select From List By Label    passport_issuance_month_1       06 June
   Select From List By Label    passport_issuance_day_1         4

    Execute Javascript             window.scrollTo(0,1000)
    Click Element    locator=//input[contains(@value,'stripe')]
    Execute Javascript             window.scrollTo(0,2000)
    Click Element    locator=//label[contains(@for,'agreechb')]
    Click Element    locator=booking

    Wait Until Element Is Visible    locator=//div[@class='infobox infobox-danger'][contains(.,'Your booking status is ( Pending ) and payment status is stripe ( Unpaid )')]
    




