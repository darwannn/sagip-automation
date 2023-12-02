*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}   https://sagip-automation.vercel.app/
${email}    employee@sagip.live
${password}    Sagip.00
${CONTENT_BODY_DIV}    xpath://*[@id="root"]/div[1]/div[2]

# Test data
${template_name}    Event Reminder - Join Us Tomorrow

*** Test Cases ***
Log in to the site
    Given I opened the browser
    And Navigate into login page
    When I typed my account details
    And I clicked the login button
    Then I should see the dashboard

1_TS035_TC001
    Given I navigate to the alert management page
    When I click a Template
    Then I should see the template applied
    
1_TS035_TC002
    Given I entered message title
    And I entered message body
    Then Values should be accepted

# The rest of the test cases in this test scenario are manual
# Due to library we used: react-select
# The select element is not interactable by test automation

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

I navigate to the alert management page
    Wait Until Element Is Visible    css:a[href='/admin/alert-management']   timeout=10s
    Click Element    css:a[href='/admin/alert-management']
    Element Should Contain    ${CONTENT_BODY_DIV}    Message Templates

I click a Template
    Wait Until Element Is Visible    xpath://*[@id="root"]/div[1]/div[2]/div/div[2]/div/div[3]/div[1]/div[4]/button
    Click Element    xpath://*[@id="root"]/div[1]/div[2]/div/div[2]/div/div[3]/div[1]/div[4]/button
  
I should see the template applied
    Wait Until Element Is Visible    xpath://*[@id="root"]/div[1]/div[2]/div/div[2]/form/div[1]/span
    Element Should Contain    xpath://*[@id="root"]/div[1]/div[2]/div/div[2]/form/div[1]/span    Using template:
    Click Button    xpath://*[@id="root"]/div[1]/div[2]/div/div[2]/form/div[1]/button

I entered message title
    Input Text    css:input[id='alertTitle']    Flash Flood Alert
I entered message body
    Input Text    css:textarea[id='alertMessage']    A flash flood warnings in effect for your area.

Values should be accepted
    Element Should Not Be Visible    css:span[class='input-error']
