*** Settings ***
Library            SeleniumLibrary


*** Variables *** 
##Dado que estou no site de viagem 
${URL}                  https://phptravels.net/ 
${MSG_HOME}             Let’s book your next trip!   

##Quando seleciono para criação da conta
${BTN_ACCOUNT}          id:ACCOUNT
${BTN_ACCOUNT2}         //a[@class='dropdown-item waves-effect'][contains(.,'Customer Signup')]


##E preencho os campos necessário
${MSG_NO_CADASTRO}      Please enter all credentials to signup
${CAMPO_NOME}          first_name
${NOME}                Jack
${CAMPO_SOBRENOME}     last_name
${SOBRENOME}           Gonca
${CAMPO_PHONE}         phone
${PHONE}               4196969696
${CAMPO_EMAIL}         email
${EMAIL}               jacks@gmail.com
${CAMPO_SENHA}         password
${SENHA}               12345
${CAMPO_TYPE}          id:select2-account_type-container
${CAMPO_VAZIO}         //input[contains(@class,'select2-search__field')]
${CAPTCHA}             //div[@class='g-recaptcha']

##E clico em "Criar conta"
${BTN}                 id:button


##Então deverá exibir mensagem de "Sucesso"        
${TXT_SUCESSO_LOGIN}  Signup successfull please login. 



*** Keywords ***
Dado que estou no site de viagem    
    Set Selenium Speed             value=0.3
    Go To                       url=${URL} 
    Wait Until Page Contains    text= ${MSG_HOME}

Quando seleciono para criação da conta
    Set Selenium Speed             value=0.3
    Click Element                          locator=${BTN_ACCOUNT} 
    Wait Until Element Is Visible          locator=${BTN_ACCOUNT2}
    Click Element                          locator=${BTN_ACCOUNT2}

E preencho os campos necessário
    Set Selenium Speed             value=0.3
    Wait Until Page Contains       text=${MSG_NO_CADASTRO}
    Input Text                     locator=${CAMPO_NOME}           text=${NOME}
    Input Text                     locator=${CAMPO_SOBRENOME}      text=${SOBRENOME} 
    Input Text                     locator=${CAMPO_PHONE}          text=${PHONE} 
    Input Text                     locator=${CAMPO_EMAIL}          text=${EMAIL}
    Input Text                     locator=${CAMPO_SENHA}          text=${SENHA}
    Execute Javascript             window.scrollTo(0,500)
    
   
    Click Element                  locator=${CAMPO_TYPE}
    Wait Until Element Is Visible  locator=${CAMPO_VAZIO}
    Input Text                     locator=${CAMPO_VAZIO}          text=A
    Press Keys                     ${CAMPO_VAZIO}                  ARROW_DOWN
    Press Keys                     ${CAMPO_VAZIO}                  ENTER
    Click Element                  locator=${CAPTCHA} 
    

     
E clico em "Criar conta"         
    Click Element                  locator=${BTN} 

Então deverá exibir mensagem de "Sucesso"        
    Wait Until Page Contains      text=${TXT_SUCESSO_LOGIN}   
    




        

    