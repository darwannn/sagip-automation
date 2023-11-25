*** Settings ***
Library    SeleniumLibrary
Resource    ../../suite_setup/login.robot
Resource    ../../suite_teardown/logout.robot


*** Keyword ***
Click Hazard Report
    Dispatcher Login
    Go To    https://sagip-automation.vercel.app/admin/hazard-reports
    Wait Until Page Contains Element    xpath=//*[@id="root"]/div[1]/div[2]/div/div[1]/div[3]/div[1]

    ${element}=     Get WebElement    xpath=//div[contains(text(), 'unverified')]
    Run Keyword Unless  '${element}'=='None'  Hazard Present

Hazard Present

    Click Element   xpath=//div[contains(text(), 'unverified')]
    Wait Until Element Is Visible  //*[@id="root"]/div[1]/div[2]/div/div[2]/div[1]/p
    Element Should Be Visible  //*[@id="root"]/div[1]/div[2]/div/div[2]/div[1]/p

*** Test Cases ***
1_TS013_TC001
    Click Hazard Report
    Element Should Be Visible   xpath=//*[@id="root"]/div[1]/div[2]/div/div[2]/div[1]/p
    
1_TS013_TC002
    Dispatcher Login
    Click Hazard Report
    Click Element     xpath=//button[contains(text(), 'Mark as Verified')]
    # Wait Until Element Is Visible   css=.Toastify__toast-body
    # Element Should Be Visible    css=.Toastify__toast-body
    Wait Until Element Is Visible   css=.Toastify__toast--success
    Element Should Be Visible    css=.Toastify__toast--success
    # Logout
