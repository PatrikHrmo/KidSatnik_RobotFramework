*** Settings ***
Resource    ../Data/Profile Data.resource


*** Keywords ***
Verify That Profile Page Loaded Correctly
    Wait For Elements State    ${Profile_MainContainer}    visible
    Wait For Elements State    ${Profile_Text}    visible
