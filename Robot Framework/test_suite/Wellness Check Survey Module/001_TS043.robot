*** Settings ***
Library    SeleniumLibrary
Library    XML
Library    String
Library    Collections
Library    Process
Resource    login.robot

Suite Setup      Employee Login

*** Keyword ***
Click Wellness Check
    Go To    https://sagip-automation.vercel.app/admin/wellness-check
    Wait Until Page Contains Element    xpath=//*[@id="root"]/div[1]/div[2]/div

    ${element}=     Get WebElement    xpath=//*[@id="root"]/div[1]/div[2]/div
    Run Keyword Unless  '${element}'=='None'  Wellness Check Present

Wellness Check Present
    Click Element  xpath=//*[@id="root"]/div[1]/div[2]/div
    Wait Until Element Is Visible  //*[@id="root"]/div[1]/div[2]/div
    Element Should Be Visible   //*[@id="root"]/div[1]/div[2]/div


*** Test Cases ***
1_TS043_TC001
   Click Wellness Check
   Sleep  3s
   Wait Until Page Contains Element   css=.border-b:nth-child(1) .ant-dropdown-trigger
   Click Element     css=.border-b:nth-child(1) .ant-dropdown-trigger
    Sleep   2s
   Wait Until Page Contains Element  xpath=//div[@class='flex items-center gap-2 text-red-500']/span[.='Delete']
   Click Element     xpath=//div[@class='flex items-center gap-2 text-red-500']/span[.='Delete']
   Alert Should Be Present
   # Close Browser

1_TS043_TC002
   Click Wellness Check
   Wait Until Page Contains Element  css=.border-b:nth-child(1) .ant-dropdown-trigger
   Click Element     css=.border-b:nth-child(1) .ant-dropdown-trigger
   Sleep  2s
   Wait Until Page Contains Element  xpath=//div[@class='flex items-center gap-2 text-red-500']/span[.='Delete']
   Click Element     xpath=//div[@class='flex items-center gap-2 text-red-500']/span[.='Delete']
   Handle Alert      action=DISMISS
   # Close Browser

1_TS043_TC003
   Click Wellness Check
   Wait Until Page Contains Element  css=.border-b:nth-child(1) .ant-dropdown-trigger
   Click Element    css=.border-b:nth-child(1) .ant-dropdown-trigger
   Sleep   2s
   Wait Until Page Contains Element  xpath=//div[@class='flex items-center gap-2 text-red-500']/span[.='Delete']
   Click Element     xpath=//div[@class='flex items-center gap-2 text-red-500']/span[.='Delete']
    ${alert_text} =    Handle Alert
    Log    Alert Text: ${alert_text}
    Wait Until Element Is Visible   css=.Toastify__toast--success
    Element Should Be Visible    css=.Toastify__toast--success
   #  Close Browser


   