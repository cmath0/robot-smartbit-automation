*** Settings ***
Documentation        Ações e elementos do componente de Toast

Library        Browser

*** Keywords ***
Toast should be
    [Arguments]    ${expectedText}

    Wait For Elements State    css=.Toastify__toast-body
    ...    visible    5

    Get Text    css=.Toastify__toast-body
    ...    equal
    ...    ${expectedText}