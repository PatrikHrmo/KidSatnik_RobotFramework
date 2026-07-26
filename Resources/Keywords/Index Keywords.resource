*** Settings ***
Resource    ../Data/Index Data.resource
Resource    ../../Utility/Utility Keywords.resource


*** Keywords ***
Verify That Index Page Loaded Correctly
    Verify That Elements Are Loaded And Visible    ${IndexHeaderFooter_Elements}
