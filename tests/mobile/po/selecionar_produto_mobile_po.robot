*** Settings ***
Library           AppiumLibrary
Resource          :\ITERASYS\ProjetoFinal5\pages\base_page_mobile.robot
Test Setup        Abrir Application
Test Teardown     Close Application

*** Test Cases ***
Teste de Compra no App Giuliana Flores
    Open Application    ${REMOTE_URL} 
    Fazer Login    ${email}    ${senha}
    Confirmar Login
    Selecionar Produto    ${nome_produto}
    Adicionar ao Carrinho
    Escolher CEP    ${cep}
    Selecionar Data de Entrega    ${data_entrega}
    Confirmar Turno de Entrega
    Verificar Itens no Carrinho    1    ${nome_produto}

*** Keywords ***
Fazer Login
    [Arguments]    ${email}    ${senha}
    Click Element    xpath=//a[contains(text(),'Perfil')]  # Ajuste conforme necessário
    Click Element    xpath=//a[contains(text(),'Login/Cadastrar')]  # Ajuste conforme necessário
    Input Text    xpath=//input[@name='email']    ${email}  # Ajuste conforme necessário
    Input Text    xpath=//input[@name='senha']    ${senha}  # Ajuste conforme necessário
    Click Element    xpath=//button[contains(text(),'Continuar')]  # Ajuste conforme necessário

Confirmar Login
    [Documentation]    Verifica se o login foi bem-sucedido
    Wait Until Element Is Visible    xpath=//h1[contains(text(),'Bem-vindo')]  

Selecionar Produto
    [Arguments]    ${produto}
    Click Element    xpath=//h3[contains(text(), '${produto}')]  

Adicionar ao Carrinho
    [Documentation]    
    Click Element    xpath=//button[contains(text(),'Adicionar ao Carrinho')] 

Escolher CEP
    [Arguments]    ${cep}
    Click Element    css=#placeholder-mobile  
    Input Text    ${cep}   ${cep} 

Selecionar Data de Entrega
    [Arguments]    ${data}
    Click Element    xpath=//a[contains(text(),'${data}')] 
Confirmar Turno de Entrega
    [Documentation]    
    Click Element    xpath=//label[contains(text(),'Comercial')] 

Verificar Itens no Carrinho
    [Arguments]    ${quantidade}    ${nome_produto}
    ${item_count}=    Get Text    css=#cart-item-count  
    Should Be Equal    ${item_count}    ${quantidade}
    Should Be Equal    ${nome_produto_no_carrinho}    ${nome_produto}