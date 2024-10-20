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
${REMOTE_URL}    https://${SAUCE_USERNAME}:%{SAUCE_ACCESS_KEY}@ondemand.us-west-1.saucelabs.com:443/wd/hub
${PRODUCT_NAME}      Buquê de 24 Rosas Vermelhas e Pink
${PRODUCT_PRICE}     R$ 189,90

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

    Esperar Até Que Elemento Esteja Visível    xpath=//android.widget.TextView[@text="Rosas"]
    Clicar Elemento    xpath=//android.widget.TextView[@text="Rosas"]
    
    Esperar Até Que Elemento Esteja Visível    xpath=//android.widget.TextView[@text="${PRODUCT_NAME}"]
    ${price}    Obter Texto    xpath=//android.widget.TextView[@text="${PRODUCT_NAME}"]/following-sibling::android.widget.TextView
    
    # Valida nome e preço na página do produto
    Deve Ser Igual    ${price}    ${PRODUCT_PRICE}
    
    Clicar Elemento    xpath=//android.widget.TextView[@text="${PRODUCT_NAME}"]
    
    Esperar Até Que Elemento Esteja Visível    xpath=//android.widget.TextView[@text="ADICIONAR AO CARRINHO"]
    Clicar Elemento    xpath=//android.widget.TextView[@text="ADICIONAR AO CARRINHO"]

    # Valida no carrinho
    Clicar Elemento    xpath=//android.widget.TextView[@text="CARRINHO"]
    Esperar Até Que Elemento Esteja Visível    xpath=//android.widget.TextView[@text="${PRODUCT_NAME}"]
    
    ${cart_price}    Obter Texto    xpath=//android.widget.TextView[@text="${PRODUCT_NAME}"]/following-sibling::android.widget.TextView
    Deve Ser Igual    ${cart_price}    ${PRODUCT_PRICE}