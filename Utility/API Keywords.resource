*** Settings ***
Library    Collections
Library    RequestsLibrary
Variables    ../Resources/Core/env_variables.py
Library    Browser
Resource    ../Resources/Data/Login Page Data.resource


*** Keywords ***
Set Up API Authorization Headers
    [Arguments]    ${User}
    ...            ${API_URL}=${URL}

    Create Session    kidsatnik    ${API_URL}
    ${response}=    GET On Session    kidsatnik    /
    ${CSRF}=    Set Variable    ${response.cookies['csrftoken']}
    VAR    &{Headers}=    X-CSRFToken=${CSRF}

    ${AuthHeaders}=    API Login Into KidSatnik    User=${User}    Headers=${Headers}

    RETURN    ${AuthHeaders}

API Login Into KidSatnik
    [Arguments]    ${User}
    ...            ${Headers}

    VAR    &{payload}=    username=${User["username"]}
    ...    password=${User["password"]}

    ${response}=    POST On Session    kidsatnik    api/login/
    ...    json=${payload}
    ...    headers=${Headers}
    Status Should Be    200    ${response}

    ${Token}=    Set Variable    ${response.json()}[token]
    VAR    &{AuthHeaders}=    Authorization=Token ${Token}

    RETURN    ${AuthHeaders}

API Get Clothing Items
    [Arguments]    ${Headers}

    ${response}=    GET On Session    kidsatnik    clothes/api/clothes/
    ...    headers=${Headers}

    Status Should Be    200    ${response}

    VAR    ${APIResponse}=    ${response.json()}

    RETURN    ${APIResponse}

API Get Specific Clothing Item
    [Arguments]    ${Headers}
    ...            ${ItemName}

    ${response}=    GET On Session    kidsatnik    clothes/api/clothes/${ItemName}/
    ...    headers=${Headers}

    Status Should Be    200    ${response}

    VAR    ${APIResponse}=    ${response.json()}

    RETURN    ${APIResponse}

API Update Specific Clothing Item
    [Arguments]    ${Headers}
    ...            ${ItemId}
    ...            ${UpdatedName}

    VAR    &{data}=    item_name=${UpdatedName}

    ${response}=    PATCH On Session    kidsatnik    clothes/api/clothes/${ItemId}/
    ...    json=${data}
    ...    headers=${Headers}

    Status Should Be    200    ${response}

    VAR    ${APIResponse}=    ${response.json()}

    RETURN    ${APIResponse}
