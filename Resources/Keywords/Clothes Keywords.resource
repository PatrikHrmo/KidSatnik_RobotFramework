*** Settings ***
Resource    ../Data/Clothes Data.resource
Resource    ../../Utility/Utility Keywords.resource


*** Keywords ***
Verify That Clothes Page Loaded Correctly
    Verify That Elements Are Loaded And Visible    ${Clothes_Main_Elements}
    Verify That Elements Are Loaded And Visible    ${Clothes_TableView_Elements}

Verify That Add New Clothing Item View Loaded Correctly
    Verify That Elements Are Loaded And Visible    ${Clothes_AddItemView_Elements}
