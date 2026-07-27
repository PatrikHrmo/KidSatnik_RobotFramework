*** Settings ***
Library    Browser
Resource    ../Resources/Keywords/Login Keywords.resource
Variables    ../Resources/Core/env_variables.py
Library    RequestsLibrary


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

    Set Browser Timeout    3s

    RETURN    ${BrowserID}

Close Test Browser
    [Documentation]    Closes all browsers.

    Close Browser    ALL

Verify That Elements Are Loaded And Visible
    [Arguments]    ${ElementsList}

    FOR    ${element}    IN    @{ElementsList}
        Wait For Elements State    ${element}    visible
    END

Open KidSatnik Login Page
    Go To    ${URL}
    Get Url    ==    ${URL}
    Wait For Load State    domcontentloaded    timeout=5s

Delete All Emails
    [Arguments]    ${URL}=${MAIL_URL}

    Create Session    mail    ${URL}
    DELETE On Session    mail    /api/v1/messages

Check Received Email
    [Arguments]    ${URL}=${MAIL_URL}

    Create Session    mail    ${URL}

    ${list}=    GET On Session    mail    /api/v1/messages    expected_status=200
    ${id}=      Set Variable    ${list.json()}[messages][0][ID]
    ${msg}=     GET On Session    mail    /api/v1/message/${id}    expected_status=200

    RETURN      ${msg.json()}[Text]
