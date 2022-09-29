*** Settings ***
Library            SeleniumLibrary
Resource           cadastro.robot

*** Variables ***
##Dado que estou na tela de login 
${URL_LOGIN}                   https://phptravels.net/login
${TITUTLO_LOGIN}               Login - PHPTRAVELS
${TEXTO_LOGIN}                 Please enter your account credentials below

##Quando preenche o login e senha
${CAMPO_LOGIN_EMAIL}           name:email   
${CAMPO_LOGIN_SENHA}           name:password

##Então efetuo o login no sistema
${BTN_LOGIN}                   //button[@type='submit'][contains(.,'Login')]
${MSG_LOGIN_OK}                Welcome Back

*** Keywords ***

Dado que estou na tela de login    
    Set Selenium Speed             value=0.3
    Go To                            url=${URL_LOGIN}  
    # Title Should Be                  title=${TITUTLO_LOGIN}
    Wait Until Page Contains         text=${TEXTO_LOGIN}
    

Quando preenche o login e senha
    Input Text    locator=${CAMPO_LOGIN_EMAIL}      text=${EMAIL} 
    Input Text    locator=${CAMPO_LOGIN_SENHA}      text=${SENHA}


Então efetuo o login no sistema
    Click Element                    locator=${BTN_LOGIN}
    Wait Until Page Contains         text=${MSG_LOGIN_OK}
