*** Settings ***
Documentation        Ações e elementos do componente de Toast

Library        Browser

*** Keywords ***
Toast should be
    [Arguments]    ${expectedText}

    ${toastSelector}    Set Variable    .Toastify__toast-body

    Wait For Elements State    css=${toastSelector}
    ...    visible    5

    Get Text    css=${toastSelector}
    ...    equal
    ...    ${expectedText}

    Take Screenshot    selector=${toastSelector}