*** Settings ***
Library    SeleniumLibrary
Library    Process
Library    OperatingSystem
Resource   ../../suite_setup/login.robot

Suite Setup     Employee Login

*** Variables ***
${DROPDOWN}     name=category
${OPTION}       Earthquake
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

Clear Input Field
    [Arguments]    ${locator}
    Input Text    ${locator}    ${EMPTY}

*** Test Cases ***
1_TS044_TC001
   Click Wellness Check
   Wait Until Page Contains Element  xpath=//*[@id="root"]/div[1]/div[2]/div/div[4]/div/table/tbody/tr[1]/td[6]
   Click Element     xpath=//*[@id="root"]/div[1]/div[2]/div/div[4]/div/table/tbody/tr[1]/td[6]
   Wait Until Page Contains Element  xpath=/html/body/div[3]/div/ul/li[5]/span/div
   Click Element    xpath=/html/body/div[3]/div/ul/li[3]
   Wait Until Element Is Visible    xpath=//*[@id="root"]/div[1]/div[2]/div
   Element Should Be Visible    xpath=//*[@id="root"]/div[1]/div[2]/div
   Click Element  xpath=//*[@id="root"]/div[1]/div[2]/div/div[1]/div[2]/div[2]/button[2]
   Wait Until Element Is Visible    xpath=//*[@id="radix-:rh:"]
   Element Should Be Visible    xpath=//*[@id="radix-:rh:"]

1_TS044_TC002
   Click Wellness Check
   Wait Until Page Contains Element  xpath=//*[@id="root"]/div[1]/div[2]/div/div[4]/div/table/tbody/tr[1]/td[6]
   Click Element     xpath=//*[@id="root"]/div[1]/div[2]/div/div[4]/div/table/tbody/tr[1]/td[6]
   Wait Until Page Contains Element  xpath=/html/body/div[3]/div/ul/li[5]/span/div
   Click Element    xpath=/html/body/div[3]/div/ul/li[3]
   Wait Until Element Is Visible    xpath=//*[@id="root"]/div[1]/div[2]/div
   Element Should Be Visible    xpath=//*[@id="root"]/div[1]/div[2]/div
   Click Element  xpath=//*[@id="root"]/div[1]/div[2]/div/div[1]/div[2]/div[2]/button[2]
   Wait Until Element Is Visible    xpath=//*[@id="radix-:rh:"]
   Click Element    xpath=//*[@id="radix-:rh:"]/form/div[2]/button
     Wait Until Element Is Visible   css=.Toastify__toast--success
    Element Should Be Visible    css=.Toastify__toast--success



1_TS044_TC003
   Click Wellness Check
   Wait Until Page Contains Element  xpath=//*[@id="root"]/div[1]/div[2]/div/div[4]/div/table/tbody/tr[1]/td[6]
   Click Element     xpath=//*[@id="root"]/div[1]/div[2]/div/div[4]/div/table/tbody/tr[1]/td[6]
   Wait Until Page Contains Element  xpath=/html/body/div[3]/div/ul/li[5]/span/div
   Click Element    xpath=/html/body/div[3]/div/ul/li[3]
   Wait Until Element Is Visible    xpath=//*[@id="root"]/div[1]/div[2]/div
   Element Should Be Visible    xpath=//*[@id="root"]/div[1]/div[2]/div
   Click Element  xpath=//*[@id="root"]/div[1]/div[2]/div/div[1]/div[2]/div[2]/button[3]
   Wait Until Element Is Visible    xpath=//h2[contains(text(), 'Publish Wellness Check')]
   Input Text    xpath=//*[@id="title"]    ${EMPTY}
   Click Element    xpath=//button[@class='btn-primary float-right']
    Wait Until Element Is Visible    css=span.text-red-500
   ${error_text}=    Get Text    css=span.text-red-500
    Should Be Equal As Strings   ${error_text}    Title is required

1_TS044_TC004
   Click Wellness Check
   Wait Until Page Contains Element  xpath=//*[@id="root"]/div[1]/div[2]/div/div[4]/div/table/tbody/tr[1]/td[6]
   Click Element     xpath=//*[@id="root"]/div[1]/div[2]/div/div[4]/div/table/tbody/tr[1]/td[6]
   Wait Until Page Contains Element  xpath=/html/body/div[3]/div/ul/li[5]/span/div
   Click Element    xpath=/html/body/div[3]/div/ul/li[3]
   Wait Until Element Is Visible    xpath=//*[@id="root"]/div[1]/div[2]/div
   Element Should Be Visible    xpath=//*[@id="root"]/div[1]/div[2]/div
   Click Element  xpath=//*[@id="root"]/div[1]/div[2]/div/div[1]/div[2]/div[2]/button[3]
   Wait Until Element Is Visible    xpath=//h2[contains(text(), 'Publish Wellness Check')]
   Input Text   xpath=//*[@id="title"]       Smoke
   Input Text    xpath=//*[@id="endDate"]   11/12/2023
    Select From List By Value    ${DROPDOWN}    ${OPTION}    Earthquake
    Click Element    xpath=//button[@class='btn-primary float-right']
   Wait Until Element Is Visible   css=.Toastify__toast--success
    Element Should Be Visible    css=.Toastify__toast--success


    