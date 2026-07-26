*** Variables ***
${Requests_MainContainer}=    xpath=//*[@data-testid="dashboard-main-content"]
${Requests_Text}=    ${Requests_MainContainer}//*[contains(text(), "REQUESTS view is not implemented yet")]
