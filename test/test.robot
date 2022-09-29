*** Settings ***
Resource           ../resources/resources.robot
Resource           ../pages/cadastro.robot
Resource           ../pages/login.robot
Resource           ../pages/visto.robot
Resource           ../pages/voo.robot
Resource           ../pages/comprar_voo.robot
Test Setup         Abrir navegador
Test Teardown      Fechar navegador




*** Test Cases ***
TC01 - Criação de cadastro cliente
    [Documentation]        Esse teste efetua a criação de um novo usuário
    [Tags]                 Cadastro

    Dado que estou no site de viagem
    Quando seleciono para criação da conta
    E preencho os campos necessário 
    E clico em "Criar conta"
    
TC02 - Efetuar login    
    [Documentation]        Esse teste efetua o login 
    [Tags]                 Login   
    
    Dado que estou na tela de login    
    Quando preenche o login e senha
    Então efetuo o login no sistema

TC03 - Solicitar visto do Brazil para Japan
    [Documentation]        Esse teste solicita o visto    
    [Tags]                 Visto

    Dado que estou na tela de login    
    Quando preenche o login e senha
    Então efetuo o login no sistema
    E acesso a tela de solicitar visto
    E preencho de Brazil para Japan 
    E preencho a data 
    E clico em submit
    E preencho os campos necessário do visto
    Então clico em submit


TC04- buscar voo ida e volta
    [Documentation]        Esse teste buscar por voos 
    [Tags]                 Voo
    Dado que estou na tela de login    
    Quando preenche o login e senha
    Então efetuo o login no sistema
    E clico em voo
    Quando preencho os campos do voo
    Então clico em pesquisar voo

TC05- Comprar passagem   
    [Documentation]        Esse teste efetuar a compra da passagem        
    [Tags]                 Comprar_voo
    Dado que estou na tela de login    
    Quando preenche o login e senha
    Então efetuo o login no sistema
    E clico em voo
    Quando preencho os campos do voo
    Então clico em pesquisar voo  
    E seleciono a passagem desejada 
    E preencho os dados para efetuar a compra
