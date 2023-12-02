*** Settings ***
Library    SeleniumLibrary
Library    XML
Library    String
Library    Collections
Library    Process
Resource    ../../suite_setup/login.robot

Suite Setup     Employee Login

*** Variables ***
${filter response}           xpath=//*[@id="category"]
${select number of list}     xpath=//*[@id="listSize"]    
${affected}     Affected
${unaffected}   Unaffected
${list per page}     30

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
1_TS042_TC001
    Click Wellness Check
    Wait Until Element Is Visible  xpath=//div[contains(@class, 'w-max')]
    Click Element  xpath=//div[contains(@class, 'w-max')]
    Wait Until Page Contains Element    xpath=//span[contains(text(), 'Total Responses')]
    Element Should Be Visible    xpath=//span[contains(text(), 'Total Responses')]

1_TS042_TC002
    Click Wellness Check
    Wait Until Element Is Visible  xpath=//div[contains(@class, 'w-max')]
    Click Element  xpath=//div[contains(@class, 'w-max')]
    Wait Until Page Contains Element  xpath=//*[@id="root"]/div[1]/div[2]/div/div[2]/div[2]/div/div[1]/div/input
    Input Text  xpath=//*[@id="root"]/div[1]/div[2]/div/div[2]/div[2]/div/div[1]/div/input  angel
    Wait Until Page Contains Element  xpath=//*[@id="root"]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody
    Element Should Be Visible  xpath=//*[@id="root"]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody

1_TS042_TC003
    Click Wellness Check
    Wait Until Element Is Visible  xpath=//div[contains(@class, 'w-max')]
    Click Element  xpath=//div[contains(@class, 'w-max')]
    Wait Until Page Contains Element  xpath=//*[@id="root"]/div[1]/div[2]/div/div[2]/div[2]/div/div[1]/div/input
    Input Text  xpath=//*[@id="root"]/div[1]/div[2]/div/div[2]/div[2]/div/div[1]/div/input  hello
    Page Should Contain Element  xpath=//*[@id="root"]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[contains(text(), 'No results.')]

1_TS042_TC004
    Click Wellness Check
    Wait Until Element Is Visible  xpath=//div[contains(@class, 'w-max')]
    Click Element  xpath=//div[contains(@class, 'w-max')]
    Wait Until Element Is Visible  xpath=//*[@id="category"]/option
    Click Element  id=category
    ${options} =    Get List Items   id=category
    Should Be Equal As Strings   ${options}   ['Filter Response', 'Affected', 'Unaffected']

1_TS042_TC005
    Click Wellness Check
    Wait Until Element Is Visible  xpath=//div[contains(@class, 'w-max')]
    Click Element  xpath=//div[contains(@class, 'w-max')]
    Wait Until Element Is Visible  xpath=//*[@id="category"]/option
    Click Element  id=category
    Select From List By Value  ${filter response}  ${affected}     Affected
    ${result}=    Get Text    css=.bg-red-500
     Should Be String   ${result}    Affected

1_TS042_TC006
    Click Wellness Check
    Wait Until Element Is Visible  xpath=//div[contains(@class, 'w-max')]
    Click Element  xpath=//div[contains(@class, 'w-max')]
    Wait Until Element Is Visible  xpath=//*[@id="category"]/option
    Click Element  id=category
    Select From List By Value  ${filter response}  ${unaffected}     Unaffected
    ${result}=    Get Text    css=.bg-green-500
     Should Be String   ${result}    Unaffected

1_TS042_TC007
    Click Wellness Check
    Wait Until Element Is Visible  xpath=//div[contains(@class, 'w-max')]
    Wait Until Element Is Visible  xpath=//*[@id="listSize"]/option 
    Select From List By Value  ${select number of list}  ${list per page}     30
    ${count}=    Get Text    xpath=//*[@id="listSize"]/option[3]
    Should Be Equal As Numbers    ${count}    30

1_TS042_TC008
     Click Wellness Check
     Wait Until Element Is Visible  xpath=//div[contains(@class, 'w-max')]
     Wait Until Element Is Visible  xpath=//*[@id="root"]/div[1]/div[2]/div/section/div[1]/button[2]
     Click Button   xpath=//*[@id="root"]/div[1]/div[2]/div/section/div[1]/button[2]
     Element Should Be Visible    css=.bg-blue-100 
     Wait Until Element Is Visible  xpath=//*[@id="root"]/div[1]/div[2]/div/section/div[1]/button[1]
     Click Button   xpath=//*[@id="root"]/div[1]/div[2]/div/section/div[1]/button[1]
     Element Should Be Visible    css=.bg-blue-100


     