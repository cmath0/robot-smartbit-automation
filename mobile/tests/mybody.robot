*** Settings ***
Documentation        Suite de testes da funcionalidade de cadastro e de medidas no aplicativo Android

Resource        ../resources/Base.resource

Test Setup        Start session
Test Teardown     Finish session

*** Test Cases ***
Deve ser possível cadastrar medidas
    ${data}    Get JSON fixture    update
    Insert Membership    ${data}

    Sign in with CPF    ${data}[account][cpf]
    User is logged in
    Touch My Body

    Send weight and height     ${data}[account]
    Popup have text            Seu cadastro foi atualizado com sucesso

    Set user token
    ${account}    Get account by name    ${data}[account][name]

    Should Be Equal    ${account}[weight]    ${data}[account][weight]
    Should Be Equal    ${account}[height]    ${data}[account][height]
