*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}   https://sagip-automation.vercel.app/
${email}    admin@sagip.live
${password}    Sagip.00
${CONTENT_BODY_DIV}    xpath://*[@id="root"]/div[1]/div[2]

${d_title}    High Tide
${d_message}    Alert level 3


*** Test Cases ***
Log in to the site
    Given I opened the browser
    And Navigate into login page
    When I typed my account details
    And I clicked the login button
    Then I should see the dashboard


1_TS030_TC001
    Wait Until Element Is Visible    css:a[href='/admin/alert-management']   timeout=10s
    Click Element    css:a[href='/admin/alert-management']
    Element Should Contain    ${CONTENT_BODY_DIV}    Send SMS Alerts

1_TS030_TC002
    Wait Until Element Is Enabled    xpath://button[contains(@class,'btn-primary') and text()='Create New']
    Click Element    xpath://button[contains(@class,'btn-primary') and text()='Create New']
    Element Should Be Visible    css:div[id='radix-:r0:']

1_TS030_TC003
    # MANUAL TESTING
    # Due to library we used: react-select
    # The select element is not interactable by test automation
    Skip

1_TS030_TC004
    # MANUAL TESTING
    # Due to library we used: react-select
    # The select element is not interactable by test automation
    Skip

1_TS030_TC005
    # MANUAL TESTING
    # Due to library we used: react-select
    # The select element is not interactable by test automation
    Skip












*** Keywords ***
I opened the browser
    Open Browser    ${url}    chrome
Navigate into login page
    Wait Until Element Is Visible    class:btn-primary
    Click Element    class:btn-primary
I typed my account details
    Input Text    css:#identifier    ${email}
    Input Text    css:#password    ${password}

I clicked the login button
    Click Element    xpath://button[contains(@class,'btn-primary') and text()='Login']

I should see the dashboard
    Wait Until Element Is Visible    xpath://*[@id="root"]/div[1]/div[2]/div/header/h1
    Element Should Contain    ${CONTENT_BODY_DIV}    Dashboard