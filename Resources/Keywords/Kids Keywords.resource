*** Settings ***
Resource    ../Data/Kids Data.resource


*** Keywords ***
Verify That Kids Page Loaded Correctly
    Wait For Elements State    ${Kids_MainContainer}    visible
    Wait For Elements State    ${Kids_Text}    visible
