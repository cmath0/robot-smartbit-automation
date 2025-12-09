*** Settings ***
Documentation        Cenários de testes de pré-cadastro de clientes

Resource        ../resources/Base.resource

*** Test Cases ***
Deve iniciar o cadastro do cliente

    ${account}    Get Fake Account

    Start session

    Submit signup form    ${account}

    Verify welcome message

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