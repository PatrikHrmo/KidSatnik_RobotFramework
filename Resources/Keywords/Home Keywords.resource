*** Settings ***
Resource    ../Data/Home Data.resource


*** Keywords ***
Verify That Home Page Loaded Correctly
    Wait For Elements State    ${Home_MainContainer}    visible
    Wait For Elements State    ${Home_Text}    visible
