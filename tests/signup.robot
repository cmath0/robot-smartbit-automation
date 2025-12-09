*** Settings ***
Documentation        Cenários de testes de pré-cadastro de clientes

Resource        ../resources/Base.resource

Test Setup        Start session
Test Teardown        Take Screenshot

*** Test Cases ***
Deve iniciar o cadastro do cliente

    ${account}    Get Fake Account

    Submit signup form    ${account}
    Verify welcome message

Tentativas inválidas de pré-cadastro
    [Tags]    invalid
    [Template]    Attempt signup
    ${EMPTY}           emaildeteste@email.com    12345678909    Por favor informe o seu nome completo
    Matheus Cardoso    ${EMPTY}                  12345678909    Por favor, informe o seu melhor e-mail
    Matheus Cardoso    emaildeteste@email.com    ${EMPTY}       Por favor, informe o seu CPF
    Matheus Cardoso    emaildeteste*email.com    12345678909    Oops! O email informado é inválido
    Matheus Cardoso    emaildeteste&email.com    12345678909    Oops! O email informado é inválido
    Matheus Cardoso    emaildeteste@email        12345678909    Oops! O email informado é inválido
    Matheus Cardoso    email.com                 12345678909    Oops! O email informado é inválido
    Matheus Cardoso    emaildeteste@email.com    1234567890a    Oops! O CPF informado é inválido
    Matheus Cardoso    emaildeteste@email.com    123            Oops! O CPF informado é inválido

*** Keywords ***
Attempt signup
    [Arguments]    ${name}    ${email}    ${cpf}    ${output_message}

    ${account}    Create Dictionary
    ...    name=${name}
    ...    email=${email}
    ...    cpf=${cpf}

    Submit signup form    ${account}
    Notice should be    ${output_message}