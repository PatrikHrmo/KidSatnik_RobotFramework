*** Settings ***
Resource    ../../Resources/Keywords/Login Keywords.resource
Resource    ../../Resources/Keywords/Home Keywords.resource
Resource    ../../Resources/Keywords/Index Keywords.resource
Variables    ../../Resources/Core/Private/user_credentials.py
Library    Collections
Library    String

Test Tags    FUNCTIONAL


*** Test Cases ***
User Can Login With Correct Credentials
    [Documentation]    Verifies that an existing user can login, no email check.

    Login Into KidSatnik    ${UserStaff}

    Verify That Index Page Loaded Correctly
    Verify That Home Page Loaded Correctly

    Logout From KidSatnik

User Cannot Login With Non-Existent Credentials
    [Documentation]    Verifies that a non-existent user cannot login, no email check.

    ${random_username}=    Generate Random String    10
    ${random_password}=    Generate Random String    5

    VAR    &{random_user_credentials}=    username=${random_username}
    ...    password=${random_password}
    ...    email=${EMPTY}

    ${LoginStatus}=    Login Into KidSatnik    User=${random_user_credentials}
    ...    ErrorMessage=${True}
    ...    ErrorType=Wrong Credentials
    Should Be Equal As Strings    ${LoginStatus}    Failed Login

User Cannot Login With Admin Credentials
    [Documentation]    Verifies that Admin user cannot login into KidSatnik, no email check.

    ${LoginStatus}=    Login Into KidSatnik    User=${AdminUser}
    ...    ErrorMessage=${True}
    ...    ErrorType=Admin
    Should Be Equal As Strings    ${LoginStatus}    Failed Login

Existing User Cannot Login With Incorrect Password
    [Documentation]    Verifies that a user cannot login with incorrect password, with email check.
    [Setup]    Delete All Emails

    ${random_password}=    Generate Random String    5

    ${Userwithincorrectcredentials}=    Copy Dictionary    ${UserStaff}    deepcopy=True
    Set To Dictionary    ${Userwithincorrectcredentials}    password    ${random_password}

    ${LoginStatus}=    Login Into KidSatnik    User=${Userwithincorrectcredentials}
    ...    ErrorMessage=${True}
    ...    ErrorType=Wrong Credentials
    Should Be Equal As Strings    ${LoginStatus}    Failed Login

    ${body}=    Check Received Email
    Should Contain    ${body}    Failed login attempt
