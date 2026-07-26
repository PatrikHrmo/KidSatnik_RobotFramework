*** Variables ***
#Header Section
${Index_Header}=    xpath=//*[@data-testid="main_header"]
${Index_Header_Kid}=    ${Index_Header}//*[contains(text(), "Kid")]
${Index_Header_Satnik}=    ${Index_Header}//*[contains(text(), "Šatník")]

#Buttons Section - Navbar
${Index_Navbar}=    xpath=//*[@data-testid="navigation-panel"]
${Index_HomeBnt}=    ${Index_Navbar}//button[contains(text(), "Home")]
${Index_ProfileBnt}=    ${Index_Navbar}//button[contains(text(), "Profile")]
${Index_KidsBnt}=    ${Index_Navbar}//button[contains(text(), "Kids")]
${Index_ClothesBnt}=    ${Index_Navbar}//button[contains(text(), "Clothes")]
${Index_RequestsBnt}=    ${Index_Navbar}//button[contains(text(), "Requests")]
${Index_LogoutBnt}=    ${Index_Navbar}//button[contains(text(), "Logout")]

#Footer Section
${Index_Footer}=    xpath=//*[@data-testid="dashboard-footer"]
${Index_Footer_Copyright}=    ${Index_Footer}//*[contains(text(), "© Patrik Hrmo 2026")]

@{IndexHeaderFooter_Elements}=    ${Index_Header_Kid}
...    ${Index_Header_Satnik}
...    ${Index_Footer_Copyright}
