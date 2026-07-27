*** Settings ***
Resource    ../../Resources/Keywords/Login Keywords.resource
Resource    ../../Resources/Keywords/Clothes Keywords.resource
Variables    ../../Resources/Core/Private/user_credentials.py
Library    Collections
Library    String

Test Tags    E2E


*** Test Cases ***
User Can Perform Operations With Clothing Item
    [Documentation]    Verifies that user can add, update, and delete an item.
    [Setup]    Login Into KidSatnik    ${UserStaff}

    ${name}=    Generate Random String    5

    VAR    &{random_item_data}=    name=${name}
    ...    description=somedescripton
    ...    photo=${EXECDIR}/Resources/TestData/test.jpg
    ...    owner=Daisy
    ...    location=${UserStaff}[username]

    Click    ${Index_ClothesBnt}
    Verify That Clothes Page Loaded Correctly

    Add Clothing Item    ItemData=${random_item_data}
    Remove Clothing Item    ItemData=${random_item_data}

    [Teardown]    Logout From KidSatnik
