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
   Wait Until Page Contains Element  xpath=//*[@id="root"]/div[1]/div[2]/div/div[4]/div/table/tbody/tr[1]/td[6]
   Click Element     xpath=//*[@id="root"]/div[1]/div[2]/div/div[4]/div/table/tbody/tr[1]/td[6]
   Wait Until Page Contains Element  xpath=/html/body/div[3]/div/ul/li[5]/span/div
   Click Element     xpath=/html/body/div[3]/div/ul/li[5]/span/div
    Handle Alert    action=DISMISS
   # Close Browser

1_TS043_TC002
   Click Wellness Check
   Wait Until Page Contains Element  xpath=//*[@id="root"]/div[1]/div[2]/div/div[4]/div/table/tbody/tr[1]/td[6]
   Click Element     xpath=//*[@id="root"]/div[1]/div[2]/div/div[4]/div/table/tbody/tr[1]/td[6]
   Wait Until Page Contains Element  xpath=/html/body/div[3]/div/ul/li[5]/span/div
   Click Element     xpath=/html/body/div[3]/div/ul/li[5]/span/div
    Handle Alert    
   # Close Browser

1_TS043_TC003
   Click Wellness Check
   Wait Until Page Contains Element  xpath=//*[@id="root"]/div[1]/div[2]/div/div[4]/div/table/tbody/tr[1]/td[6]
   Click Element     xpath=//*[@id="root"]/div[1]/div[2]/div/div[4]/div/table/tbody/tr[1]/td[6]
   Wait Until Page Contains Element  xpath=/html/body/div[3]/div/ul/li[5]/span/div
   Click Element     xpath=/html/body/div[3]/div/ul/li[5]/span/div
    ${alert_text} =    Handle Alert
    Log    Alert Text: ${alert_text}
    Wait Until Element Is Visible   css=.Toastify__toast--success
    Element Should Be Visible    css=.Toastify__toast--success
   #  Close Browser


   