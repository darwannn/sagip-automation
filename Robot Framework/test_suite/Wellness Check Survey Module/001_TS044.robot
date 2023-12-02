*** Settings ***
Library    SeleniumLibrary
Library    Process
Library    OperatingSystem
Resource   login.robot

Suite Setup      Employee Login

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
   Wait Until Element Is Visible    xpath=//h2[contains(text(), 'Responses')]
   Element Should Be Visible    xpath=//h2[contains(text(), 'Responses')]
   Click Element  xpath=//*[@id="root"]/div[1]/div[2]/div/div[1]/div[2]/div[2]/button[3]
   Wait Until Element Is Visible    xpath=//h2[contains(text(), 'Publish Wellness Check')]
   Element Should Be Visible  xpath=//h2[contains(text(), 'Publish Wellness Check')]
#    Close Window

1_TS044_TC002
   Click Wellness Check
   Wait Until Page Contains Element  xpath=//*[@id="root"]/div[1]/div[2]/div/div[4]/div/table/tbody/tr[1]/td[6]
   Click Element     xpath=//*[@id="root"]/div[1]/div[2]/div/div[4]/div/table/tbody/tr[1]/td[6]
   Wait Until Page Contains Element  xpath=/html/body/div[3]/div/ul/li[5]/span/div
   Click Element    xpath=/html/body/div[3]/div/ul/li[3]
   Wait Until Element Is Visible    xpath=//h2[contains(text(), 'Responses')]
   Element Should Be Visible    xpath=//h2[contains(text(), 'Responses')]
   Click Element  xpath=//*[@id="root"]/div[1]/div[2]/div/div[1]/div[2]/div[2]/button[3]
   Wait Until Element Is Visible    xpath=//h2[contains(text(), 'Publish Wellness Check')]
   Element Should Be Visible  xpath=//h2[contains(text(), 'Publish Wellness Check')]
   Input Text    xpath=//*[@id="title"]    ${EMPTY}
   Click Element    xpath=//button[@class='btn-primary float-right']
    Wait Until Element Is Visible    css=span.text-red-500
   ${error_text}=    Get Text    css=span.text-red-500
    Should Be Equal As Strings   ${error_text}    Title is required
    # Close Window

1_TS044_TC003
   Click Wellness Check
   Wait Until Page Contains Element  xpath=//*[@id="root"]/div[1]/div[2]/div/div[4]/div/table/tbody/tr[1]/td[6]
   Click Element     xpath=//*[@id="root"]/div[1]/div[2]/div/div[4]/div/table/tbody/tr[1]/td[6]
   Wait Until Page Contains Element  xpath=/html/body/div[3]/div/ul/li[5]/span/div
   Click Element    xpath=/html/body/div[3]/div/ul/li[3]
   Wait Until Element Is Visible    xpath=//h2[contains(text(), 'Responses')]
   Element Should Be Visible    xpath=//h2[contains(text(), 'Responses')]
   Click Element  xpath=//*[@id="root"]/div[1]/div[2]/div/div[1]/div[2]/div[2]/button[3]
   Wait Until Element Is Visible    xpath=//h2[contains(text(), 'Publish Wellness Check')]
   Element Should Be Visible  xpath=//h2[contains(text(), 'Publish Wellness Check')]
   Input Text   xpath=//*[@id="title"]       Magnitude 5
   Input Text    xpath=//*[@id="endDate"]   10/12/2023
    Select From List By Value    ${DROPDOWN}    ${OPTION}    Earthquake
    Click Element    xpath=//button[@class='btn-primary float-right']
   Wait Until Element Is Visible   css=.Toastify__toast--success
    Element Should Be Visible    css=.Toastify__toast--success
#    Close Window



    