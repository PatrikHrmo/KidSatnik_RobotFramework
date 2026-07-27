*** Settings ***
Resource    ../Data/Clothes Data.resource
Resource    ../../Utility/Utility Keywords.resource
Library    Browser


*** Keywords ***
Verify That Clothes Page Loaded Correctly
    Verify That Elements Are Loaded And Visible    ${Clothes_Main_Elements}
    Verify That Elements Are Loaded And Visible    ${Clothes_TableView_Elements}

Verify That Add New Clothing Item View Loaded Correctly
    Verify That Elements Are Loaded And Visible    ${Clothes_AddItemView_Elements}

Add Clothing Item
    [Arguments]    ${ItemData}

    ${NumberOfRows}=    Get Number Of Rows In The Items Table

    Click    ${ClothesPanel_AddItem}
    Verify That Add New Clothing Item View Loaded Correctly

    Type Text    ${AddItem_NameInput}    ${ItemData["name"]}
    Type Text    ${AddItem_DescriptionInput}    ${ItemData["description"]}
    Upload File By Selector    ${AddItem_PhotoInput}    ${ItemData["photo"]}
    Select Options By    ${AddItem_WhichKidInput}    text    ${ItemData["owner"]}
    Select Options By    ${AddItem_WhereInput}    text    ${ItemData["location"]}

    Click    ${AddItem_SaveBtn}

    ${Row}=    Evaluate    ${NumberOfRows} + 1
    Check Added Clothing Item In The Table    ItemData=${ItemData}    Row=${Row}

Get Number Of Rows In The Items Table
    ${NumberOfRows}=    Get Element Count    ${ClothesTable_Rows}//tr

    IF    $NumberOfRows == 1
        TRY
            Get Text    ${ClothesTable_Rows}//tr[1]    *=    No item
            VAR    ${NumberOfRows}=    0
        EXCEPT
            No Operation
        END
    END

    RETURN    ${NumberOfRows}

Check Added Clothing Item In The Table
    [Arguments]    ${ItemData}
    ...            ${Row}=1

    Get Text    ${ClothesTable_Rows}//tr[${Row}]//td[1]    *=    ${ItemData["name"]}
    Get Text    ${ClothesTable_Rows}//tr[${Row}]//td[2]    *=    ${ItemData["description"]}
    Get Text    ${ClothesTable_Rows}//tr[${Row}]//td[4]    *=    ${ItemData["owner"]}
    Get Text    ${ClothesTable_Rows}//tr[${Row}]//td[5]    *=    ${ItemData["location"]}

Remove Clothing Item
    [Arguments]    ${ItemData}

    ${NumberOfRows}=    Get Number Of Rows In The Items Table

    VAR    ${ItemRow}=    ${ClothesTable_Rows}//td[contains(text(), "${ItemData["name"]}")]/ancestor::tr[1]
    VAR    ${RemoveBtn}=    ${ItemRow}//button[contains(text(), "Remove")]

    Handle Future Dialogs    action=accept
    Click    ${RemoveBtn}

    Wait For Elements State    ${ItemRow}    hidden

    ${FinalNumberOfRows}=    Get Number Of Rows In The Items Table
    ${Result}=    Evaluate    ${NumberOfRows} - ${FinalNumberOfRows}
    Should Be Equal As Integers    ${Result}    1
