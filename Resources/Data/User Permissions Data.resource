*** Settings ***
Resource    Index Data.resource


*** Variables ***
${StaffUserMenuButtons}=    ${Index_Navbar}
...    ${Index_HomeBnt}
...    ${Index_ProfileBnt}
...    ${Index_KidsBnt}
...    ${Index_ClothesBnt}
...    ${Index_RequestsBnt}
...    ${Index_LogoutBnt}

${NotStaffUserMenuButtons}=    ${Index_Navbar}
...    ${Index_HomeBnt}
...    ${Index_ProfileBnt}
...    ${Index_ClothesBnt}
...    ${Index_RequestsBnt}
...    ${Index_LogoutBnt}
