*** Settings ***

#Library    SeleniumLibrary
Library    AppiumLibrary
Resource    
Resource    login_page_mobile.robot
Resource    confirma_dados_compra_page_mobile.robot
Resource    selecionar_dia_entrega_page_mobile.robot
Resource    selecionar_produto_page_mobile.robot

*** Variables ***

${timeout}    5000ms
${REMOTE_URL}    https://${SAUCE_USERNAME}:%{SAUCE_ACCESS_KEY}@ondemand.us-west-1.saucelabs.com:443/wd/hub

*** Keywords ***
 Abrir Application       
    Open Application    ${REMOTE_URL}     
    ...    platformName=Android    
    ...    appium:platformVersion=13    
    ...    appium:deviceName=Samsung Galaxy A23 5G    
    ...    appium:deviceOrientation=portrait    
    ...    appium:app=storage:filename=Giuliana Flores_2.0.61_APKPure.apk    
    ...    appium:appPackage=br.com.giulianaflores.android    
    ...    appium:ensureWebviewsHavePages=${True}    
    ...    appium:nativeWebScreenshot=${True}    
    ...    sauce:options=[object Object]    
    ...    appium:newCommandTimeout=${3600}    
    ...    appium:connectHardwareKeyboard=${True}

    # Verifique os contextos disponíveis
    ${contexts}=    Get Contexts
    Log    ${contexts}
    Log To Console    ${contexts}

    # Troque para o contexto nativo
    Switch To Context    NATIVE_APP

Fechar Application  
    Close All Applications

*** Keywords ***
Abrir Application
    Open Application    ${REMOTE_URL}
    