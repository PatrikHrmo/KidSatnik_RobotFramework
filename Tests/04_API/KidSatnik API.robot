*** Settings ***
Resource    ../../Utility/API Keywords.resource
Variables    ../../Resources/Core/Private/user_credentials.py
Resource    ../../Resources/Data/Clothes Data.resource
Resource    ../../Resources/Keywords/Login Keywords.resource
Resource    ../../Resources/Keywords/Clothes Keywords.resource

Test Tags    API


*** Test Cases ***
Get Clothes Via API
    [Documentation]    Gets all clothes via API.

    ${Headers}=    Set Up API Authorization Headers    User=${UserStaff}
    ${Response}=    API Get Clothing Items    Headers=${Headers}
    Log    ${Response}

Get Clothing Item Via API
    [Documentation]    Gets specific clothing item based on item name.

    ${Headers}=    Set Up API Authorization Headers    User=${UserStaff}
    ${Response}=    API Get Clothing Items    Headers=${Headers}
    ${JSON}=    Get From List    ${Response}    0
    ${Name}=    Get From Dictionary    ${JSON}    item_name

    ${Response}=    API Get Specific Clothing Item    ItemName=${Name}    Headers=${Headers}
    Log    ${Response}

Update Clothing Item Name Via API
    [Documentation]    Updates specific clothing item name using item id.

    ${Headers}=    Set Up API Authorization Headers    User=${UserStaff}
    ${Response}=    API Get Clothing Items    Headers=${Headers}
    ${JSON}=    Get From List    ${Response}    0
    ${Id}=    Get From Dictionary    ${JSON}    id

    ${Response}=    API Update Specific Clothing Item    ItemId=${Id}    UpdatedName=Sveter    Headers=${Headers}
    Log    ${Response}
