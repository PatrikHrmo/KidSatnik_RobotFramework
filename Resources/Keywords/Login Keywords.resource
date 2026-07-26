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

    Type Text    ${LoginPage_LoginField_UsernameInput}    ${User["username"]}
    Type Text    ${LoginPage_LoginField_PasswordInput}    ${User["password"]}
    Click    ${LoginPage_LoginField_SubmitBtn}

Login Into KidSatnik
    [Arguments]    ${User}

    ${ActualURL}=    Get Url
    IF    $ActualUrl != $URL    Go To KidSatnik Login Page

    TRY
        Type Login Credentials    ${User}
        Verify That Index Page Loaded Correctly
    EXCEPT
        Reload
        Type Login Credentials    ${User}
        Verify That Index Page Loaded Correctly
    END

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
