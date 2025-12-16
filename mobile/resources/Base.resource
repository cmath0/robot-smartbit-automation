*** Settings ***
Documentation        Arquivo principal do projeto de testes automatizados para mobile

Library        AppiumLibrary
Library        JSONLibrary

Library        ../../libs/Database.py

Resource        ../../services/Service.resource

Resource        ./actions/Login.resource
Resource        ./actions/Account.resource
Resource        ./actions/MyBody.resource
Resource        ./actions/components/Menu.resource
Resource        ./actions/components/Popup.resource

*** Keywords ***
Start session
    Open Application    http://localhost:4723
    ...    platformName=Android
    ...    automationName=UIAutomator2
    ...    deviceName=Emulator
    ...    udid=emulator-5554
    ...    app=${EXECDIR}/app/smartbit-beta.apk
    ...    autoGrantPermissions=true

    Wait Until Page Contains    IP da API    30

Finish session
    Capture Page Screenshot
    Close Application

Get JSON fixture
    [Arguments]    ${scenario}

    ${data}    Load Json From File    
    ...    ${EXECDIR}/resources/fixtures/data.json
    ...    encoding=utf-8
    
    RETURN    ${data}[${scenario}]