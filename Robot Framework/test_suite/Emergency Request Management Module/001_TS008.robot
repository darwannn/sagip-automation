*** Settings ***
Library    SeleniumLibrary
Resource    ../../suite_setup/login.robot
Resource    ../../suite_teardown/logout.robot

Suite Setup    Dispatcher Login 


*** Keyword ***
Click Assistance Request
    
    Go To    https://sagip-automation.vercel.app/admin/emergency-reports
    Wait Until Page Contains Element    xpath=//*[@id="root"]/div[1]/div[2]/div/div[1]/div[3]/div[1]

      ${element}=     Get WebElement    xpath=//div[contains(text(), 'unverified') or contains(text(), 'incomplete')]
     Run Keyword If   ${element}      Assistance Present

Assistance Present

    Click Element   xpath=//div[contains(text(), 'unverified') or contains(text(), 'incomplete')]
    Wait Until Element Is Visible  //*[@id="root"]/div[1]/div[2]/div/div[2]/div[1]/p
    Element Should Be Visible  //*[@id="root"]/div[1]/div[2]/div/div[2]/div[1]/p


Reject Assistance Request
    Click Assistance Request
    Wait Until Page Contains Element    xpath=//button[contains(text(), 'Reject Request')] 
    
    Click Element   xpath=//button[contains(text(), 'Reject Request')]

Input Reject Reason
    Reject Assistance Request
    Wait Until Page Contains Element    xpath=//form/div/div/div/div/div[2]
    Click Element   xpath=//form/div/div/div/div/div[2]
    Click Element   id=react-select-2-option-0
    Wait Until Element Is Enabled    xpath=//div[@id='radix-:r0:']/form/div[3]/button

*** Test Cases ***
1_TS012_TC001
    Click Assistance Request
    Element Should Be Visible   xpath=//*[@id="root"]/div[1]/div[2]/div/div[2]/div[1]/p
    # Close Browser

1_TS012_TC002
    Reject Assistance Request
    Element Should Be Visible   id=radix-:r0:

1_TS012_TC003
    Input Reject Reason
    Input Text  id=additionalNote   The department identified the report as false alarm.
    Click Element   xpath=//div[@id='radix-:r0:']/form/div[3]/button
     Handle Alert    action=DISMISS
    # Close Browser

1_TS012_TC004
    Reject Assistance Request
    Click Element   xpath=//div[@id='radix-:r0:']/form/div[3]/button
    # ${button_disabled}=    Element Should Be Disabled    xpath=//button[contains(text(), 'Reject Report')]
    # Should Be True    ${button_disabled}
     ${error_text}=    Get Text    css=.text-red-500
    Should Not Be Equal As Strings    ${error_text}    This field is required
    # Close Browser

1_TS012_TC005
    Reject Assistance Request
    Input Text  id=additionalNote   The department identified the report as false alarm.
    Click Element   xpath=//div[@id='radix-:r0:']/form/div[3]/button
    Wait Until Page Contains Element    css=.text-red-500
    Element Should Be Visible   css=.text-red-500
    # Close Browser

1_TS012_TC006
    Input Reject Reason
    Click Element   xpath=//div[@id='radix-:r0:']/form/div[3]/button
     Handle Alert    action=DISMISS
    # Close Browser    

1_TS012_TC007
    Input Reject Reason
    Click Element   xpath=//div[@id='radix-:r0:']/form/div[3]/button
    Handle Alert   
    Wait Until Element Is Visible   css=.Toastify__toast--success
    Element Should Be Visible    css=.Toastify__toast--success
    # Close Browser

1_TS012_TC008
    Input Reject Reason 
    Click Element   xpath=//div[@id='radix-:r0:']/form/div[3]/button
     Handle Alert    action=DISMISS
    # Close Browser
 
  

    