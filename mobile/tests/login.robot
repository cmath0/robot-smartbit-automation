*** Settings ***
Documentation        Suite de testes de login

Resource        ../resources/Base.resource

Test Setup           Start session
Test Teardown        Finish session

*** Test Cases ***
Deve logar com IP e CPF
    ${data}    Get JSON fixture    login
    Insert Membership    ${data}

    Sign in with CPF    ${data}[account][cpf]
    User is logged in

Não deve logar com CPF não cadastrado
    Sign in with CPF    07049390534
    Popup have text     Acesso não autorizado! Entre em contato com a central de atendimento

Não deve logar com CPF inválido
    Sign in with CPF    12345678910
    Popup have text     CPF inválido, tente novamente