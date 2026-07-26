*** Settings ***
Library    Browser


*** Keywords ***
Open And Setup Test Browser
    [Documentation]    Opens a new browser with new context and blank page.
    [Arguments]    ${TEST_BROWSER}
    ...            ${TEST_HEADLESS}
    ...            ${VIEWPORT_WIDTH}=1920
    ...            ${VIEWPORT_HEIGHT}=1080
    ...            ${AcceptDownloads}=${False}

    New Browser    browser=${TEST_BROWSER}
    ...    headless=${TEST_HEADLESS}
    New Context    acceptDownloads=${AcceptDownloads}
    ...    viewport={'width': ${VIEWPORT_WIDTH}, 'height': ${VIEWPORT_HEIGHT}}
    New Page
    Get Url    ==    about:blank
    ${BrowserID}=    Get Browser Ids    ACTIVE

    RETURN    ${BrowserID}

Close Test Browser
    [Documentation]    Closes all browsers.

    Close Browser    ALL

Verify That Elements Are Loaded And Visible
    [Arguments]    ${ElementsList}
    
    FOR    ${element}    IN    @{ElementsList}
        Wait For Elements State    ${element}    visible
    END
