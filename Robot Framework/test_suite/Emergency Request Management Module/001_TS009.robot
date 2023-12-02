*** Settings ***
Library    SeleniumLibrary
Resource    ../../suite_setup/login.robot
Resource    ../../suite_teardown/logout.robot
Suite Setup      Dispatcher Login

*** Keyword ***

Click Assistance Request
    Go To    https://sagip-automation.vercel.app/admin/emergency-reports
    Wait Until Page Contains Element    xpath=//*[@id="root"]/div[1]/div[2]/div/div[1]/div[3]/div[1]

      ${element}=     Get WebElement    xpath=//div[contains(text(), 'unverified') or contains(text(), 'incomplete')]
    Run Keyword Unless  '${element}'=='None'  Assistance Present

Assistance Present

    Click Element   xpath=//div[contains(text(), 'unverified') or contains(text(), 'incomplete')]
    Wait Until Element Is Visible  //*[@id="root"]/div[1]/div[2]/div/div[2]/div[1]/p
    Element Should Be Visible  //*[@id="root"]/div[1]/div[2]/div/div[2]/div[1]/p


Accept Assistance Request
    Click Assistance Request
    Wait Until Page Contains Element    xpath=//button[contains(text(), 'Reject Request')] 
    
    Click Element   xpath=//button[contains(text(), 'Accept Request')]
    Wait Until Element Is Visible   xpath=//button[contains(text(), 'Send Responders')]

*** Test Cases ***
1_TS009_TC001
    Click Assistance Request
    Element Should Be Visible   xpath=//*[@id="root"]/div[1]/div[2]/div/div[2]/div[1]/p
    # Close Browser

1_TS009_TC002
    Accept Assistance Request
    Element Should Be Visible     xpath=//button[contains(text(), 'Send Responders')]
    # Close Browser

1_TS009_TC003
    Accept Assistance Request
    Click Element     xpath=//button[contains(text(), 'Send Responders')]
    Element Should Be Visible   xpath=//button[contains(text(), 'Send Responders')]
    # Close Browser

1_TS009_TC004
    Accept Assistance Request
    Click Element   css=.css-8mmkcg > path
    Click Element   id=react-select-2-option-1
    Element Should Not Be Visible   id=react-select-2-input-listbox 
    # Close Browser

1_TS009_TC005
    Accept Assistance Request
    Click Element   css=.css-8mmkcg > path
    Click Element   id=react-select-2-option-1
    Click Element     xpath=//button[contains(text(), 'Send Responders')]
    Wait Until Element Is Visible   css=.Toastify__toast--success
    Element Should Be Visible    css=.Toastify__toast--success
    # Close Browser
 
  

    