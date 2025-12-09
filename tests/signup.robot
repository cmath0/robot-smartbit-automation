*** Settings ***
Documentation        Cenários de testes de pré-cadastro de clientes

Library        Browser

Resource        ../resources/base.resource

*** Test Cases ***
Deve iniciar o cadastro do cliente

    ${account}    Get Fake Account

    New Browser    chromium    headless=False
    New Page    http://localhost:3000

    Get Text    css=#signup h2    
    ...    equal
    ...    Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=name    ${account}[name]
    Fill Text    id=email    ${account}[email]
    Fill Text    id=document    ${account}[document]
    
    Click    css=button >> text=Cadastrar

    Wait For Elements State    
    ...    text=Falta pouco para fazer parte da família Smartbit!    
    ...    visible    5

Campo Nome completo deve ser obrigatório
    [Tags]    required

    New Browser    chromium    headless=False
    New Page    http://localhost:3000

    Get Text    css=#signup h2    
    ...    equal
    ...    Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=email    emaildeteste@email.com
    Fill Text    id=document    12345678909
    
    Click    css=button >> text=Cadastrar

    Wait For Elements State    
    ...    css=.notice >> text=Por favor informe o seu nome completo    
    ...    visible    5

Campo Email deve ser obrigatório
    [Tags]    required

    New Browser    chromium    headless=False
    New Page    http://localhost:3000

    Get Text    css=#signup h2    
    ...    equal
    ...    Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=name    Matheus Cardoso
    Fill Text    id=document    12345678909
    
    Click    css=button >> text=Cadastrar

    Wait For Elements State    
    ...    css=.notice >> text=Por favor, informe o seu melhor e-mail    
    ...    visible    5

Campo CPF deve ser obrigatório
    [Tags]    required

    New Browser    chromium    headless=False
    New Page    http://localhost:3000

    Get Text    css=#signup h2    
    ...    equal
    ...    Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=name    Matheus Cardoso
    Fill Text    id=email    emaildeteste@email.com
    
    Click    css=button >> text=Cadastrar

    Wait For Elements State    
    ...    css=.notice >> text=Por favor, informe o seu CPF    
    ...    visible    5

Email no formato inválido
    [Tags]    invalid

    New Browser    chromium    headless=False
    New Page    http://localhost:3000

    Get Text    css=#signup h2    
    ...    equal
    ...    Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=name    Matheus Cardoso
    Fill Text    id=email    emaildeteste*email.com
    Fill Text    id=document    12345678909
    
    Click    css=button >> text=Cadastrar

    Wait For Elements State
    ...    css=.notice >> text=Oops! O email informado é inválido
    ...    visible    5

CPF no formato inválido
    [Tags]    invalid

    New Browser    chromium    headless=False
    New Page    http://localhost:3000

    Get Text    css=#signup h2    
    ...    equal
    ...    Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=name    Matheus Cardoso
    Fill Text    id=email    emaildeteste@email.com
    Fill Text    id=document    1234567890a
    
    Click    css=button >> text=Cadastrar

    Wait For Elements State
    ...    css=.notice >> text=Oops! O CPF informado é inválido
    ...    visible    5