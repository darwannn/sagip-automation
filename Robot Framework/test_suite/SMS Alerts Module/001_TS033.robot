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

1_TS033_TC001
    Given I navigate to the alert management page
    When I click edit button 
    Then I should see delete button
1_TS033_TC002
    Given I click delete button
    Then I should see delete successful


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

I click edit button
    Wait Until Element Is Visible    xpath://*[@id="root"]/div[1]/div[2]/div/div[2]/div/div[3]/div[1]/div[4]/button
    Click Button    xpath://*[@id="root"]/div[1]/div[2]/div/div[2]/div/div[3]/div[1]/div[4]/button
I should see delete button
    Wait Until Element Is Visible    xpath:/html/body/div[3]/div/ul/li[2]
    Element Should Be Visible    xpath:/html/body/div[3]/div/ul/li[2]
I click delete button
    Click Element    xpath:/html/body/div[3]/div/ul/li[2]
I should see delete successful
    Wait Until Element Is Visible   css=.Toastify__toast--success
    Element Should Be Visible    css=.Toastify__toast--success
