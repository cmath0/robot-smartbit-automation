*** Settings ***
Documentation        Suite de testes de adesões de planos / matrículas

Resource        ../resources/Base.resource

Test Setup        Start session
Test Teardown        Take Screenshot

*** Test Cases ***
Deve poder realizar uma nova matrícula
    
    ${data}           Get JSON fixture    memberships    create
    ${account}        Set Variable    ${data}[account]

    Delete Account By Email     ${data}[account][email]
    Insert Account              ${data}[account]

    Login with admin user
    Go to Memberships
    Create new membership    ${data}

    Toast should be    Matrícula cadastrada com sucesso.

Não deve permitir incluir uma matrícula duplicada
    [Tags]    duplicate

    ${data}           Get JSON fixture    memberships    duplicate

    Insert Membership    ${data}

    Login with admin user
    Go to Memberships
    Create new membership    ${data}

    Toast should be    O usuário já possui matrícula.