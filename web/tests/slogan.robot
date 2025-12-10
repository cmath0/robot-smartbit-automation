*** Settings ***
Documentation        Teste para verificar o slogan da Smartbit na webapp

Library        Browser

*** Test Cases ***
Deve exibir o Slogan na Landing Page
    New Browser    chromium    headless=False
    New Page    http://localhost:3000
    Get Text    .headline h2    equal    Sua Jornada Fitness Começa aqui!