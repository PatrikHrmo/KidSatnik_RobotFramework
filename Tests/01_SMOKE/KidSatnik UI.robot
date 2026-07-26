*** Settings ***
Resource    ../../Resources/Keywords/Login Keywords.resource
Resource    ../../Resources/Keywords/Home Keywords.resource
Resource    ../../Resources/Keywords/Index Keywords.resource
Resource    ../../Resources/Keywords/Profile Keywords.resource
Resource    ../../Resources/Keywords/Kids Keywords.resource
Resource    ../../Resources/Keywords/Clothes Keywords.resource
Resource    ../../Resources/Keywords/Requests Keywords.resource
Variables    ../../Resources/Core/Private/user_credentials.py

Test Tags    SMOKE


*** Test Cases ***
Login Page Smoke Test

    Open KidSatnik Login Page
    Verify That Login Page Loaded Correctly

KidSatnik Smoke Test
    [Setup]    Login Into KidSatnik    ${UserStaff}

    Verify That Index Page Loaded Correctly
    Verify That Home Page Loaded Correctly

    Click    ${Index_HomeBnt}
    Verify That Home Page Loaded Correctly

    Click    ${Index_ProfileBnt}
    Verify That Profile Page Loaded Correctly

    Click    ${Index_KidsBnt}
    Verify That Kids Page Loaded Correctly

    Click    ${Index_ClothesBnt}
    Verify That Clothes Page Loaded Correctly
    Click    ${ClothesPanel_AddItem}
    Verify That Add New Clothing Item View Loaded Correctly
    Click With Options    ${Index_HomeBnt}    force=True

    Click    ${Index_RequestsBnt}
    Verify That Requests Page Loaded Correctly

    Click    ${Index_HomeBnt}
    Verify That Home Page Loaded Correctly

    [Teardown]    Logout From KidSatnik
