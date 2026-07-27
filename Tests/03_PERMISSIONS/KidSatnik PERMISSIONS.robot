*** Settings ***
Resource    ../../Resources/Keywords/Login Keywords.resource
Resource    ../../Resources/Keywords/Home Keywords.resource
Resource    ../../Resources/Keywords/Index Keywords.resource
Resource    ../../Resources/Keywords/Profile Keywords.resource
Resource    ../../Resources/Keywords/Kids Keywords.resource
Resource    ../../Resources/Keywords/Clothes Keywords.resource
Resource    ../../Resources/Keywords/Requests Keywords.resource
Variables    ../../Resources/Core/Private/user_credentials.py

Test Tags    PERMISSIONS


*** Test Cases ***
Staff User Has All Menu Tabs
    Login Into KidSatnik    ${UserStaff}

    Click    ${Index_ProfileBnt}
    Verify That Profile Page Loaded Correctly

    Click    ${Index_KidsBnt}
    Verify That Kids Page Loaded Correctly

    Click    ${Index_ClothesBnt}
    Verify That Clothes Page Loaded Correctly

    Click    ${Index_RequestsBnt}
    Verify That Requests Page Loaded Correctly

    Click    ${Index_HomeBnt}
    Verify That Home Page Loaded Correctly

    Logout From KidSatnik

Not Staff User Does Have All Menu Tabs Except Kids
    Login Into KidSatnik    ${UserNotStaff}

    Click    ${Index_ProfileBnt}
    Verify That Profile Page Loaded Correctly

    Click    ${Index_ClothesBnt}
    Verify That Clothes Page Loaded Correctly

    Click    ${Index_RequestsBnt}
    Verify That Requests Page Loaded Correctly

    ${status}    ${error}=    Run Keyword And Ignore Error    Click    ${Index_KidsBnt}
    Should Be Equal As Strings    ${status}    FAIL
    Should Not Be Empty    ${error}
    Wait For Elements State    ${Index_KidsBnt}    hidden

    Click    ${Index_HomeBnt}
    Verify That Home Page Loaded Correctly

    Logout From KidSatnik
