# This sample code supports Appium Robot client >=2
# pip install robotframework-appiumlibrary
# Then you can paste this into a file and simply run with Robot
#
# Find keywords at: http://serhatbolsu.github.io/robotframework-appiumlibrary/AppiumLibrary.html
#
# If your tests fails saying 'did not match any elements' consider using 'wait activity' or
# 'wait until page contains element' before a click command

*** Settings ***
Library           AppiumLibrary
Test Teardown     Close Application

*** Variables ***
${SAUCE_USERNAME}    oauth-maysacampos06-e170f    
${REMOTE_URL}        https://${SAUCE_USERNAME}:%{SAUCE_ACCESS_KEY}@ondemand.us-west-1.saucelabs.com:443/wd/hub
${PRODUCT_NAME}      Buquê de 24 Rosas Vermelhas e Pink
${PRODUCT_PRICE}     R$ 189,90
${SAUCE_USERNAME}    oauth-maysacampos06-e170f    
${CEP}               30411312
${DATA_ENTREGA}      2024.10.31
${NOME_PRODUTO}      Buquê Fascínio de Rosas Colombianas Vermelhas
${PRECO_PRODUTO}     $202,93
${btn_ok}            xpath=//body/form[@id='form1']/div[3]/main[1]/div[6]/div[1]/div[2]/div[14]/div[1]/div[1]/span[2]
${ico_continuar}     xpath=//a[@id='ContentSite_Basketcontrol1_rptBasket_imbFinalize_0']
${txt_login}         xpath=//span[contains(text(),'DIGITE SEU E-MAIL OU CPF')]

*** Test Cases ***
Selecionar Produto
    Open Application    ${REMOTE_URL}     
    ...    platformName=Android    
    ...    appium:platformVersion=13    
    ...    appium:deviceName=Samsung Galaxy A23 5G    
    ...    appium:deviceOrientation=portrait    
    ...    appium:app=storage:filename=Giuliana Flores_2.0.61_APKPure.apk    
    ...    appium:appPackage=br.com.giulianaflores.android    
    ...    appium:ensureWebviewsHavePages=${True}    
    ...    appium:nativeWebScreenshot=${True}    
    #...    sauce:options={"name":"Selecionar Produto"}    
    ...    appium:newCommandTimeout=${3600}    
    ...    appium:connectHardwareKeyboard=${True}

Go To App  
    #Escolher Produtos
    Wait Until Page Contains Element    ${NOME_PRODUTO}   10000ms
    Element Text Should Be    ${NOME_PRODUTO}    Buquê Fascínio de Rosas Colombianas Vermelhas
    Element Text Should Be    ${PRECO_PRODUTO}    $202,93
    
    #Escolher dia e turno entrega  
    Click Element    ${CEP} 
    Input Text    ${CEP}    30411312
    
    Click Element    ${btn_ok}
    
    Wait Until Page Contains Element    ${DATA_ENTREGA}   10000ms
    Click Element    ${DATA_ENTREGA}   
   
    #Confirmar compra
    Wait Until Page Contains Element    ${NOME_PRODUTO}   20000ms
    Element Text Should Be    ${NOME_PRODUTO}    Buquê Fascínio de Rosas Colombianas Vermelhas
    Element Text Should Be    ${PRECO_PRODUTO}    $202,93

    Wait Until Page Contains Element    ${ico_continuar}   10000ms
    Click Element    ${ico_continuar}

    #Digite seu e-mail ou CPF
    Wait Until Page Contains Element    ${txt_login}   10000ms
    Element Text Should Be   ${txt_login}    DIGITE SEU E-MAIL OU CPF    