*** Settings ***
Library           AppiumLibrary
Resource          ../../pages/base_page_mobile.robot
Resource          ../../pages/login_page_mobile.robot
Resource          ../../pages/selecionar_produto_page_mobile.robot
Resource          ../../pages/confirma_dados_compra_page_mobile.robot
Resource          ../../pages/selecionar_dia_entrega_page_mobile.robot
Test Teardown     Close Application


*** Variables ***
${SAUCE_USERNAME}    oauth-maysacampos06-e170f    
${REMOTE_URL}    https://${SAUCE_USERNAME}:%{SAUCE_ACCESS_KEY}@ondemand.us-west-1.saucelabs.com:443/wd/hub
${EMAIL}          lavinia_aurora_alves@eton.com.br
${SENHA}          Teste123
${CEP}            30411312
${DATA_ENTREGA}   2024.10.31
${NOME_PRODUTO}   Buquê Fascínio de Rosas Colombianas Vermelhas
${PRECO_PRODUTO}  $202,93


*** Test Cases ***
Teste de Compra no App Giuliana Flores
    Open Application    ${REMOTE_URL} 
    Fazer Login    ${EMAIL}    ${SENHA}
    Confirmar Login
    Selecionar Produto    ${NOME_PRODUTO}
    Adicionar ao Carrinho
    Escolher CEP    ${CEP}
    Selecionar Data de Entrega    ${DATA_ENTREGA}
    Confirmar Turno de Entrega
    Verificar Itens no Carrinho    1    ${NOME_PRODUTO}

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
    Wait Until Element Is Visible    xpath=//h1[contains(text(),'Bem-vindo')]  # Ajuste conforme necessário

Selecionar Produto
    [Arguments]    ${produto}
    Click Element    xpath=//h3[contains(text(), '${produto}')]  # Ajuste conforme necessário

Adicionar ao Carrinho
    [Documentation]    Adiciona o produto ao carrinho
    Click Element    xpath=//button[contains(text(),'Adicionar ao Carrinho')]  # Ajuste conforme necessário

Escolher CEP
    [Arguments]    ${cep}
    Click Element    css=#placeholder-mobile  # Ajuste conforme necessário
    Input Text    ${cep_parte_um}   ${cep}  # Use a palavra-chave apropriada para preencher o CEP

Selecionar Data de Entrega
    [Arguments]    ${data}
    Click Element    xpath=//a[contains(text(),'${data}')]  # Ajuste conforme necessário

Confirmar Turno de Entrega
    [Documentation]    Seleciona o turno de entrega
    Click Element    xpath=//label[contains(text(),'Comercial')]  # Ajuste conforme necessário

Verificar Itens no Carrinho
    [Arguments]    ${quantidade}    ${nome_produto}
    ${item_count}=    Get Text    css=#cart-item-count  # Ajuste conforme necessário
    Should Be Equal    ${item_count}    ${quantidade}
    ${nome_produto_no_carrinho}=    Get Text    css=.product-name  # Ajuste conforme necessário
    Should Be Equal    ${nome_produto_no_carrinho}    ${nome_produto}