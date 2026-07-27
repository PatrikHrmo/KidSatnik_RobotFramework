*** Variables ***
${LoginPage_Header}=    xpath=//*[@data-testid="welcome-page-header"]
${LoginPage_Header_Kid}=    ${LoginPage_Header}//*[contains(text(), "Kid")]
${LoginPage_Header_Satnik}=    ${LoginPage_Header}//*[contains(text(), "Šatník")]
${LoginPage_Text}=    xpath=//*[contains(text(), "Clothing manager for divorced parents who do not want to lose time texting each other")]
${LoginPage_LoginField}=    xpath=//*[@data-testid="login-page"]
${LoginPage_LoginField_Header}=    ${LoginPage_LoginField}//*[@data-testid="login-header" and text()="Login"]
${LoginPage_LoginField_Form}=    ${LoginPage_LoginField}//*[@data-testid="login-form"]
${LoginPage_LoginField_Error}=    ${LoginPage_LoginField}//*[@id="login-error-alert"]//span
${LoginPage_LoginField_UsernameLabel}=    ${LoginPage_LoginField}//label[@data-testid="username" and contains(text(), "Username")]
${LoginPage_LoginField_UsernameInput}=    ${LoginPage_LoginField}//input[@id="username"]
${LoginPage_LoginField_PasswordLabel}=    ${LoginPage_LoginField}//label[@data-testid="username" and contains(text(), "Password")]
${LoginPage_LoginField_PasswordInput}=    ${LoginPage_LoginField}//input[@id="password"]
${LoginPage_LoginField_SubmitBtn}=    ${LoginPage_LoginField}//button[@data-testid="login-btn"]

@{LoginPage_Elements}=    ${LoginPage_Header_Kid}
...    ${LoginPage_Header_Satnik}
...    ${LoginPage_Text}
...    ${LoginPage_LoginField_Header}
...    ${LoginPage_LoginField_Form}
...    ${LoginPage_LoginField_UsernameLabel}
...    ${LoginPage_LoginField_UsernameInput}
...    ${LoginPage_LoginField_PasswordLabel}
...    ${LoginPage_LoginField_PasswordInput}
...    ${LoginPage_LoginField_SubmitBtn}
