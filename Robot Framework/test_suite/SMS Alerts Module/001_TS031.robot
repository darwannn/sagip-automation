*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}   https://sagip-automation.vercel.app/
${email}    employee@sagip.live
${password}    Sagip.00
${CONTENT_BODY_DIV}    xpath://*[@id="root"]/div[1]/div[2]

*** Test Cases ***
Log in to the site
    Given I opened the browser
    And Navigate into login page
    When I typed my account details
    And I clicked the login button
    Then I should see the dashboard

1_TS031_TC001
    Wait Until Element Is Visible    css:a[href='/admin/alert-management']   timeout=10s
    Click Element    css:a[href='/admin/alert-management']
    Element Should Contain    ${CONTENT_BODY_DIV}    Message Templates

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