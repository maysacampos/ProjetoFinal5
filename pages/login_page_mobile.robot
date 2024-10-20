*** Settings ***
Library    AppiumLibrary

*** Variables ***
${txt_pg_quatro}    xpath=//span[contains(text(),'DIGITE SEU E-MAIL OU CPF')]


*** Keywords ***
Fazer Login
    [Arguments]    ${email}    ${senha}
    Click Element    xpath=//a[contains(text(),'Perfil')]  # Ajuste conforme necessário
    Click Element    xpath=//a[contains(text(),'Login/Cadastrar')]  # Ajuste conforme necessário
    Input Text    xpath=//input[@name='email']    ${email}  # Ajuste conforme necessário
    Input Text    xpath=//input[@name='senha']    ${senha}  # Ajuste conforme necessário
    Click Element    xpath=//button[contains(text(),'Continuar')] 