*** Settings ***
Resource    ../Data/Requests Data.resource


*** Keywords ***
Verify That Requests Page Loaded Correctly
    Wait For Elements State    ${Requests_MainContainer}    visible
    Wait For Elements State    ${Requests_Text}    visible
