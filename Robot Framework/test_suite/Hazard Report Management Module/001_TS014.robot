*** Settings ***
Library    SeleniumLibrary
Resource    ../../suite_setup/login.robot
Resource    ../../suite_teardown/logout.robot

Suite Setup      Dispatcher Login

*** Keywords ***
Given the user is on the hazard report page
    Go To    https://sagip-automation.vercel.app/admin/hazard-reports
    Wait Until Page Contains Element    xpath=//*[@id="root"]/div[1]/div[2]/div/div[1]/div[3]/div[1]

When the user selects an ongoing hazard report
    ${element}=     Get WebElement    xpath=//div[contains(text(), 'ongoing')]
     Run Keyword If   ${element}      Hazard Present

Then the review hazard report should appear
    Click Element   xpath=//div[contains(text(), 'ongoing')]
    Wait Until Element Is Visible  xpath=//*[@id="root"]/div[1]/div[2]/div/div[2]/div[1]/p
    Element Should Be Visible  xpath=//*[@id="root"]/div[1]/div[2]/div/div[2]/div[1]/p

And the user clicks the mark as resolved button
    Click Element     xpath=//button[contains(text(), 'Mark as Resolved')]

Then the hazard report should be resolved
    Wait Until Element Is Visible   css=.Toastify__toast--success
    Element Should Be Visible    css=.Toastify__toast--success
    # Close Browser

Hazard Present
    Click Element   xpath=//div[contains(text(), 'ongoing')]
    Wait Until Element Is Visible  xpath=//*[@id="root"]/div[1]/div[2]/div/div[2]/div[1]/p
    Element Should Be Visible  xpath=//*[@id="root"]/div[1]/div[2]/div/div[2]/div[1]/p

*** Test Cases ***
1_TS014_TC001
        Given the user is on the hazard report page
        When the user selects an ongoing hazard report
        Then the review hazard report should appear

1_TS014_TC002
        Given the user is on the hazard report page
        When the user selects an ongoing hazard report
        And the user clicks the mark as resolved button
        Then the hazard report should be resolved