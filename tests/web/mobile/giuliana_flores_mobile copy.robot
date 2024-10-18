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
    ...    sauce:options=[object Object]    
    ...    appium:newCommandTimeout=${3600}    
    ...    appium:connectHardwareKeyboard=${True}


     
    ${el1} =    Set Variable     xpath=/hierarchy/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.ImageView
    Click Element    ${el1}
    ${el2} =    Set Variable     xpath=//android.widget.TextView[@text="Pular"]
    Click Element    ${el2}
    ${el3} =    Set Variable     xpath=//android.widget.TextView[@text="Criar minha conta depois"]
    Click Element    ${el3}
    ${el4} =    Set Variable     id=com.android.permissioncontroller:id/permission_deny_button
    Click Element    ${el4}
    ${el5} =    Set Variable     xpath=//android.widget.TextView[@text="NÃO, OBRIGADO"]
    Click Element    ${el5}
    ${el6} =    Set Variable     xpath=//android.widget.ScrollView/android.view.ViewGroup/android.widget.HorizontalScrollView[2]/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup/android.widget.ImageView
    Click Element    ${el6}
    ${el7} =    Set Variable     xpath=//android.widget.TextView[@text="Rosas"]
    Click Element    ${el7}
    ${el8} =    Set Variable     xpath=//android.widget.TextView[@text="Buquê de 24 Rosas Vermelhas e Pink"]
    Click Element    ${el8}
    ${el9} =    Set Variable     xpath=(//android.widget.TextView[@text="Buquê de 24 Rosas Vermelhas e Pink"])[2]
    Click Element    ${el9}
    ${el10} =    Set Variable     xpath=//android.widget.TextView[@text="R$ 189,90"]
    Click Element    ${el10}
    ${el11} =    Set Variable     class=android.widget.EditText
    Click Element    ${el11}
    ${el12} =    Set Variable     xpath=//android.widget.TextView[@text="CONTINUAR"]
    Click Element    ${el12}

