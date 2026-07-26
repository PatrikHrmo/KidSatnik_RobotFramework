*** Variables ***
${Profile_MainContainer}=    xpath=//*[@data-testid="dashboard-main-content"]
${Profile_Text}=    ${Profile_MainContainer}//*[contains(text(), "ACCOUNTS view is not implemented yet")]
