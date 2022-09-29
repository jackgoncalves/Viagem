*** Settings ***
Library            SeleniumLibrary
Resource           cadastro.robot
*** Variables ***

##E acesso a tela de solicitar visto
${ELEMENT_VISA}          //a[@class='active_visa waves-effect'][contains(.,'visa')]  
${TXT_VISTO}             Submit Your Visa Today!
 
## E preencho de Brazil para Canada 
${SELECIONAR_PAIS}       select2-from_country-container
${PAIS_BRAZIL}           //input[contains(@class,'select2-search__field')]
${BRAZIL}                Brazil
${SELECIONAR_DESTINO}    select2-to_country-container
${PAIS_CANADA}            //input[contains(@class,'select2-search__field')]
${CANADA}                 Canada


##E preencho a data 
${CAMPO_DATA_VISTO}      date
${MODAL_DATA}            //table[@class=' table-condensed']
${PROXIMA_DATA}          (//th[@class='next'])[1]
${DATA_VISTO}            //td[@class='day '][contains(.,'12')]

##E clico em submit
${MODAL_DATA_VISTO}      //h5[@data-wow-duration='0.3s'][contains(.,'12-11-2022')]

##E preencho os campos necessário do visto
${NOME_VISTO}                 first_name
${SOBRENOME_VISTO}            last_name
${EMAIL_VISTO}                email
${PHONE_VISTO}                phone


*** Keywords ***

E acesso a tela de solicitar visto
    Click Element                  locator=${ELEMENT_VISA}
    Wait Until Page Contains       text=${TXT_VISTO} 


 E preencho de Brazil para Japan 
     Click Element        locator=${SELECIONAR_PAIS}
     Input Text           locator=${PAIS_BRAZIL}    text=${BRAZIL}
     Press Keys           ${PAIS_BRAZIL}            ENTER
     Click Element        locator=${SELECIONAR_DESTINO}
     Input Text           locator=${PAIS_CANADA}    text=${CANADA}
     Press Keys           ${SELECIONAR_DESTINO}      ENTER

E preencho a data     
    Click Element                      locator=${CAMPO_DATA_VISTO}
    Wait Until Element Is Visible      locator=${MODAL_DATA} 
    Click Element                      locator=${PROXIMA_DATA}
    Click Element                      locator=${DATA_VISTO} 

E clico em submit
    Click Element                    locator=submit
    Wait Until Element Is Visible    locator=${MODAL_DATA_VISTO} 

E preencho os campos necessário do visto
    Input Text    locator=${NOME_VISTO}          text=${NOME}
    Input Text    locator=${SOBRENOME_VISTO}     text=${SOBRENOME}
    Input Text    locator=${EMAIL_VISTO}         text=${EMAIL}
    Input Text    locator=${PHONE_VISTO}         text=${PHONE}
    Input Text    locator=notes                 text=Solicitando visto


 Então clico em submit
     Execute Javascript             window.scrollTo(0,200)
     Click Element    locator=//button[@type='submit'][contains(.,'Submit')]
     Wait Until Page Contains    text=Your visa form has been submitted

    

    




     