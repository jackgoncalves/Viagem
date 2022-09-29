*** Settings ***
Library          SeleniumLibrary


*** Variables ***
${MENU_VOO}              //a[@class='active_flights waves-effect'][contains(.,'flights')]
${TXT_MENU_VOO}          SEARCH FOR BEST FLIGHTS

##Quando preencho os campos do voo 
${CAMPO_VOO_IDA}          autocomplete
${CAMPO_VOO_VOLTA}        autocomplete2

*** Keywords ***
E clico em voo
    Click Element                locator=${MENU_VOO} 
    Wait Until Page Contains     text=${TXT_MENU_VOO}

Quando preencho os campos do voo
    Input Text          locator=${CAMPO_VOO_IDA}      text=Brazil
    Press Keys          ${CAMPO_VOO_IDA}              ARROW_DOWN
    Press Keys          ${CAMPO_VOO_IDA}              ENTER

    Input Text          locator=${CAMPO_VOO_VOLTA}      text=Canada
    Press Keys          ${CAMPO_VOO_VOLTA}              ARROW_DOWN
    Press Keys          ${CAMPO_VOO_VOLTA}              ENTER

    Click Element                     locator=departure                
    Wait Until Element Is Visible     locator=(//table[@class=' table-condensed'])[1]
    Click Element                     locator=(//td[@class='day '][contains(.,'31')])[1]        

    Click Element                     locator=//a[@class='dropdown-toggle dropdown-btn waves-effect'][contains(.,'1')]
    Wait Until Element Is Visible     locator=//div[contains(@class,'dropdown-item adult_qty')]
    Click Element                     locator=(//i[contains(@class,'la la-plus')])[1]
    Wait Until Element Contains      locator=//span[@class='guest_flights d-block text-center'][contains(.,'2')]    text=2

Então clico em pesquisar voo
    Click Element      locator=//span[@class='ladda-label'][contains(.,'Search')]
    Title Should Be    title=Flights - PHPTRAVELS

