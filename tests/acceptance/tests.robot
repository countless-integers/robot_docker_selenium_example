*** Settings ***
Documentation     Acceptance testing using robot with selenium in containers
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://app:5000
${BROWSER}        Chrome
${SELENIUM_URL}   http://selenium:4444

*** Settings ***
# Test Setup        Open Browser To Main Page
Test Teardown     Teardown Selenium

*** Test Cases ***
Home Page Loads
    Open Browser To Main Page
    # Main Page Should Be Open
    [Teardown]    Close Browser

*** Keywords ***
Teardown Selenium
    [Documentation]     Tearing down
    Run Keyword If Test Failed  Take Screenshot
    Close Browser

Take Screenshot
    Capture Page Screenshot

Open Browser To Main Page
    Open Browser    ${LOGIN URL}    ${BROWSER}      remote_url=${SELENIUM_URL}
    Title Should Be    Hello World!

Main Page Should Be Open
    Title Should Be    Hello World!