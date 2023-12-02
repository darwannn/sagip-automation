*** Settings ***
Library    SeleniumLibrary
Resource    ../../suite_setup/login.robot
Resource    ../../suite_teardown/logout.robot
Suite Setup      Dispatcher Login
*** Keywords ***
Given the user is on the assistance request page

    Go To    https://sagip-automation.vercel.app/admin/emergency-reports
    Wait Until Page Contains Element    xpath=//*[@id="root"]/div[1]/div[2]/div/div[1]/div[3]/div[1]

When the user selects a resolved assistance request
    ${element}=     Get WebElement    xpath=//div[contains(text(), 'resolved')]
    Run Keyword If   ${element}     Assistance Present

Then the review request should appear
    Click Element   xpath=//div[contains(text(), 'resolved')]
    Wait Until Element Is Visible  //*[@id="root"]/div[1]/div[2]/div/div[2]/div[1]/p
    Element Should Be Visible  //*[@id="root"]/div[1]/div[2]/div/div[2]/div[1]/p

And the user clicks the incident details button
    Click Element     xpath=//a[contains(text(), 'Incident Details')]
    Wait Until Element Is Visible   xpath=//*[@id="root"]/div[1]/div[2]/div/div[2]/div[3]/div[2]/div[1]

Then the incident details should appear
    Element Should Be Visible   xpath=//*[@id="root"]/div[1]/div[2]/div/div[2]/div[3]/div[2]/div[1]

And the user clicks on the print report button
    Click Element     xpath=//button[contains(text(), 'Print Report')]

Then an incident report should be displayed
    Location Should Contain    /admin/emergency-reports/

Assistance Present
    Click Element   xpath=//div[contains(text(), 'resolved')]
    Wait Until Element Is Visible  //*[@id="root"]/div[1]/div[2]/div/div[2]/div[1]/p
    Element Should Be Visible  //*[@id="root"]/div[1]/div[2]/div/div[2]/div[1]/p

*** Test Cases ***
1_TS010_TC001
        Given the user is on the assistance request page
        When the user selects a resolved assistance request
        Then the review request should appear

1_TS010_TC002
        Given the user is on the assistance request page
        When the user selects a resolved assistance request
        And the user clicks the incident details button
        Then the incident details should appear

1_TS010_TC003
        Given the user is on the assistance request page
        When the user selects a resolved assistance request
        And the user clicks the incident details button
        And the user clicks on the print report button
        Then an incident report should be displayed