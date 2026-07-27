*** Settings ***
Resource    ../Data/Login Page Data.resource
Resource    ../Data/Index Data.resource
Resource    ../../Utility/Utility Keywords.resource
Variables    ../Core/Private/user_credentials.py
Variables    ../Core/env_variables.py
Resource    Index Keywords.resource
Library    Browser


*** Keywords ***
Verify That Login Page Loaded Correctly
    Verify That Elements Are Loaded And Visible    ${LoginPage_Elements}

Type Login Credentials
    [Arguments]    ${User}
    ...            ${ErrorMessage}=${False}
    ...            ${ErrorType}=${None}

    Type Text    ${LoginPage_LoginField_UsernameInput}    ${User["username"]}
    Type Text    ${LoginPage_LoginField_PasswordInput}    ${User["password"]}
    Click    ${LoginPage_LoginField_SubmitBtn}

    IF    $ErrorMessage
        IF    "${ErrorType}" == "Admin"
            Get Text    ${LoginPage_LoginField_Error}    *=    Forbidden: Administrator cannot login.
            VAR    ${LoginStatus}=    Failed Login
        ELSE IF    "${ErrorType}" == "Wrong Credentials"
            Get Text    ${LoginPage_LoginField_Error}    *=    Incorrect credentials.
            VAR    ${LoginStatus}=    Failed Login
        END
        RETURN    ${LoginStatus}
    END

Login Into KidSatnik
    [Arguments]    ${User}
    ...            ${ErrorMessage}=${False}
    ...            ${ErrorType}=${None}

    ${ActualURL}=    Get Url
    IF    $ActualUrl != $URL
        TRY
            Logout From KidSatnik
        EXCEPT
            Open KidSatnik Login Page
        END
    END

    TRY
        ${LoginStatus}=    Type Login Credentials    User=${User}
        ...    ErrorMessage=${ErrorMessage}
        ...    ErrorType=${ErrorType}
        IF    $ErrorMessage    RETURN    ${LoginStatus}
    EXCEPT
        Reload
        ${LoginStatus}=    Type Login Credentials    User=${User}
        ...    ErrorMessage=${ErrorMessage}
        ...    ErrorType=${ErrorType}
        IF    $ErrorMessage    RETURN    ${LoginStatus}
    END

    Verify That Index Page Loaded Correctly

Logout From KidSatnik
    ${ActualUrl}=    Get Url

    IF    $ActualUrl != $URL
        TRY
            Click    ${Index_LogoutBnt}
        EXCEPT
            Reload
            Click    ${Index_LogoutBnt}
        FINALLY
            Wait For Load State    domcontentloaded    timeout=5s
            Verify That Login Page Loaded Correctly
        END
    END
