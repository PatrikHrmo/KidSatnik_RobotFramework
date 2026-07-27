*** Settings ***
Resource    ../../Resources/Keywords/Login Keywords.resource
Resource    ../../Resources/Keywords/Clothes Keywords.resource
Variables    ../../Resources/Core/Private/user_credentials.py
Resource    ../../Utility/API Keywords.resource
Library    Collections
Library    String
Library    Browser

Test Tags    E2E


*** Test Cases ***
User Can Add And Update Operations With Clothing Item
    [Documentation]    Verifies that user can add, update, and delete an item.
    [Setup]    Run Keywords    Login Into KidSatnik    ${UserStaff}
    ...        AND    Remove All Clothing Items

    ${name}=    Generate Random String    5

    VAR    &{random_item_data}=    name=${name}
    ...    description=somedescripton
    ...    photo=${EXECDIR}/Resources/TestData/test.jpg
    ...    owner=Daisy
    ...    location=${UserStaff}[username]

    Click    ${Index_ClothesBnt}
    Verify That Clothes Page Loaded Correctly

    ${Headers}=    Set Up API Authorization Headers    User=${UserStaff}

    ${TableRow}=    Add Clothing Item    ItemData=${random_item_data}

    ${Response}=    API Get Specific Clothing Item    Headers=${Headers}
    ...    ItemName=${random_item_data["name"]}
    Sleep    2s

    ${Description}=    Get From Dictionary    ${Response}    item_description
    Should Be Equal    ${Description}    ${random_item_data["description"]}

    ${NewName}=    Generate Random String    5
    ${Id}=    Get From Dictionary    ${Response}    id

    ${Response}=    API Update Specific Clothing Item    Headers=${Headers}
    ...    ItemId=${Id}
    ...    UpdatedName=${NewName}

    ${ActualId}=    Get From Dictionary    ${Response}    id
    Should Be Equal    ${ActualId}    ${Id}
    ${ActualName}=    Get From Dictionary    ${Response}    item_name
    Should Be Equal    ${NewName}    ${ActualName}

    Logout From KidSatnik
    Login Into KidSatnik    User=${UserStaff}

    Click    ${Index_ClothesBnt}
    Verify That Clothes Page Loaded Correctly
    Sleep    2s

    ${TableRow}=    Evaluate    ${TableRow} + 1
    Get Text    ${ClothesTable_Rows}//tr[${TableRow}]    contains    ${NewName}
    Get Text    ${ClothesTable_Rows}//tr[${TableRow}]    not contains    ${random_item_data["name"]}

    Logout From KidSatnik
