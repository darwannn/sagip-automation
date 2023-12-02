*** Settings ***
Library    SeleniumLibrary
Resource    ../../suite_setup/login.robot
Resource    ../../suite_teardown/logout.robot

Suite Setup      Dispatcher Login

*** Keyword ***
Click Hazard Report
    Go To    https://sagip-automation.vercel.app/admin/hazard-reports
    Wait Until Page Contains Element    xpath=//*[@id="root"]/div[1]/div[2]/div/div[1]/div[3]/div[1]

    ${element}=     Get WebElement    xpath=//div[contains(text(), 'unverified')]
    Run Keyword Unless  '${element}'=='None'  Hazard Present

Hazard Present

    Click Element   xpath=//div[contains(text(), 'unverified')]
    Wait Until Element Is Visible  //*[@id="root"]/div[1]/div[2]/div/div[2]/div[1]/p
    Element Should Be Visible  //*[@id="root"]/div[1]/div[2]/div/div[2]/div[1]/p


Reject Hazard Report
    Click Hazard Report
    Wait Until Page Contains Element    xpath=//button[contains(text(), 'Reject Hazard Report')] 
    Click Element   xpath=//button[contains(text(), 'Reject Hazard Report')]

Input Rejection Reason
    Reject Hazard Report
    Click Element   xpath=//div[@id='radix-:r0:']/form/div/div/div/div/div[2]
    Click Element   id=react-select-2-option-0


*** Test Cases ***
# 1_TS012_TC001
#     Click Hazard Report
#     Element Should Be Visible   xpath=//*[@id="root"]/div[1]/div[2]/div/div[2]/div[1]/p
#     # Close Browser

# 1_TS012_TC002
#     Reject Hazard Report
#     Element Should Be Visible   id=radix-:r0:
#     # Close Browser

# 1_TS012_TC003
#     Input Rejection Reason
#     Input Text  id=additionalNote   The department identified the report as false alarm.
#     Click Element   xpath=//button[contains(text(), 'Reject Report')]
#      Handle Alert    action=DISMISS
#     # Close Browser

# 1_TS012_TC004
#     Reject Hazard Report
#     Click Element   xpath=//button[contains(text(), 'Reject Report')]
#     # ${button_disabled}=    Element Should Be Disabled    xpath=//button[contains(text(), 'Reject Report')]
#     # Should Be True    ${button_disabled}
#      ${error_text}=    Get Text    css=.text-red-500
#     Should Not Be Equal As Strings    ${error_text}    This field is required
#     # Close Browser

# 1_TS012_TC005
#     Reject Hazard Report
#     Input Text  id=additionalNote   The department identified the report as false alarm.
#     Click Element   xpath=//button[contains(text(), 'Reject Report')]
#     Wait Until Page Contains Element    css=.text-red-500
#     Element Should Be Visible   css=.text-red-500
#     # Close Browser

# 1_TS012_TC006
#     Input Rejection Reason
#     Click Element   xpath=//button[contains(text(), 'Reject Report')]
#      Handle Alert    action=DISMISS
    
#     # Close Browser
    
1_TS012_TC007
    Input Rejection Reason
    Click Element   xpath=//button[contains(text(), 'Reject Report')]
    Handle Alert
    # Close Browser    

# 1_TS012_TC008
#     Input Rejection Reason 
#     Click Element   xpath=//button[contains(text(), 'Reject Report')]
#     Handle Alert    action=DISMISS
#     # Close Browser
 
  

    