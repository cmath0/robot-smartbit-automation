*** Settings ***
Documentation        Cenários de testes do Login SAC da Smartbit

Resource        ../resources/Base.resource

Test Setup        Start session
Test Teardown     Take Screenshot

*** Test Cases ***
Deve logar como Gestor de Academia
    Go to login page

    Submit login form    sac@smartbit.com    pwd123
    User is logged in    sac@smartbit.com

Não deve logar com senha incorreta
    [Tags]    invalid_password

    Go to login page
    Submit login form    sac@smartbit.com    abc123
    Toast should be    As credenciais de acesso fornecidas são inválidas. Tente novamente!

Não deve logar com email não cadastrado
    [Tags]    user_dont_exist

    Go to login page
    Submit login form    usuario.inexistente@smartbit.com    abc123
    Toast should be    As credenciais de acesso fornecidas são inválidas. Tente novamente!

Tentativas de login com dados incorretos
    [Template]    Login with verify notice
    ${EMPTY}            ${EMPTY}    Os campos email e senha são obrigatórios.
    ${EMPTY}            abc123      Os campos email e senha são obrigatórios.
    sac@smartbit.com    ${EMPTY}    Os campos email e senha são obrigatórios.
    sac*smartbit.com    abc123      Oops! O email informado é inválido
    smartbit.com        abc123      Oops! O email informado é inválido
    sac@smartbit        abc123      Oops! O email informado é inválido
    123456              abc123      Oops! O email informado é inválido
    email%$#com         abc123      Oops! O email informado é inválido

*** Keywords ***
Login with verify notice
    [Arguments]    ${email}    ${password}    ${output_message}

    Go to login page
    Submit login form    ${email}    ${password}
    Notice should be    ${output_message}