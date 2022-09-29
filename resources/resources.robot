*** Settings ***
Library            SeleniumLibrary
# Resource           ../test/test.robot
           



*** Keywords ***
Abrir navegador    
    Open Browser      browser=chrome
    Maximize Browser Window
    # Dado que estou na tela de login    
    # Quando preenche o login e senha
    # Então efetuo o login no sistema

Fechar navegador
    Close Browser



    