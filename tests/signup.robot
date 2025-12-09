*** Settings ***
Documentation        Cenários de testes de pré-cadastro de clientes

Library        Browser

Resource        ../resources/base.resource

*** Test Cases ***
Deve iniciar o cadastro do cliente

    ${account}    Get Fake Account

    Start session

    Submit signup form    ${account}

    Wait For Elements State    
    ...    text=Falta pouco para fazer parte da família Smartbit!    
    ...    visible    5

Campo Nome completo deve ser obrigatório
    [Tags]    required

    ${account}    Create Dictionary
    ...    name=${EMPTY}
    ...    email=emaildeteste@email.com
    ...    cpf=12345678909

    Start session
    Submit signup form    ${account}
    Notice should be    Por favor informe o seu nome completo    

Campo Email deve ser obrigatório
    [Tags]    required

    ${account}    Create Dictionary
    ...    name=Matheus Cardoso
    ...    email=${EMPTY}
    ...    cpf=12345678909

    Start session
    Submit signup form    ${account}
    Notice should be    Por favor, informe o seu melhor e-mail

Campo CPF deve ser obrigatório
    [Tags]    required

    ${account}    Create Dictionary
    ...    name=Matheus Cardoso
    ...    email=emaildeteste@email.com
    ...    cpf=${EMPTY}

    Start session
    Submit signup form    ${account}
    Notice should be    Por favor, informe o seu CPF    

Email no formato inválido
    [Tags]    invalid

    ${account}    Create Dictionary
    ...    name=Matheus Cardoso
    ...    email=emaildeteste*email.com
    ...    cpf=12345678909

    Start session
    Submit signup form    ${account}
    Notice should be    Oops! O email informado é inválido

CPF no formato inválido
    [Tags]    invalid

    ${account}    Create Dictionary
    ...    name=Matheus Cardoso
    ...    email=emaildeteste@email.com
    ...    cpf=1234567890a

    Start session
    Submit signup form    ${account}
    Notice should be    Oops! O CPF informado é inválido

*** Keywords ***
Start session
    New Browser    chromium    headless=False
    New Page    http://localhost:3000

Submit signup form
    [Arguments]    ${account}

    Get Text    css=#signup h2    
    ...    equal
    ...    Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=name    ${account}[name]
    Fill Text    id=email    ${account}[email]
    Fill Text    id=cpf    ${account}[cpf]
    
    Click    css=button >> text=Cadastrar

Notice should be
    [Arguments]    ${target}

    ${element}    Set Variable    css=.notice >> text=${target}

    Wait For Elements State
    ...    ${element}
    ...    visible    5