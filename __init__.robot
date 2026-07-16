*** Settings ***
Documentation     This is a starting point to every test run.

Resource          Utility/Utility Keywords.resource
Variables         Resources/Core/env_variables.py

Suite Setup       Global Setup
Suite Teardown    Global Teardown


*** Keywords ***
Global Setup
    Log To Console    Starting test run for KidŠatník.

    IF    $BROWSER not in ['chromium']
        Fail    Wrong browser, please review your setup.
    END

    Open And Setup Test Browser    TEST_BROWSER=${BROWSER}
    ...    TEST_HEADLESS=${HEADLESS}
    ...    VIEWPORT_WIDTH=${VIEWPORT_WIDTH}
    ...    VIEWPORT_HEIGHT=${VIEWPORT_HEIGHT}

Global Teardown
    ${BrowserIds}=    Get Browser Ids    ALL
    IF    ${BrowserIds} != @{EMPTY}    Close Test Browser

    Log To Console    Testing of KidŠatník completed.
