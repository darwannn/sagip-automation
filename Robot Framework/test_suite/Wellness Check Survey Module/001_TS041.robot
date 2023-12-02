*** Settings ***
Library    SeleniumLibrary
Library    Process
Library    OperatingSystem
Resource    login.robot

Suite Setup      Employee Login
*** Variables ***
${DROPDOWN}   xpath=//*[@id="category"]
${OPTION}     Typhoon

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
1_TS041_TC001
    Click Wellness Check
    Wait Until Page Contains Element    xpath=//button[contains(text(), 'New Wellness Check')]
    Click Element   xpath=//button[contains(text(), 'New Wellness Check')]
    Wait Until Page Contains Element    xpath=//h2[contains(text(), 'Publish Wellness Check')]
    Element Should Be Visible    xpath=//h2[contains(text(), 'Publish Wellness Check')]
    # Close Browser

1_TS041_TC002
    Click Wellness Check
    Wait Until Page Contains Element    xpath=//button[contains(text(), 'New Wellness Check')]
    Click Element   xpath=//button[contains(text(), 'New Wellness Check')]
    Input Text      xpath=//*[@id="title"]  Typhoon Egay
    Input Text      xpath=//*[@id="endDate"]    30/11/2023
    Select From List By Value  ${DROPDOWN}  ${OPTION}     Typhoon
    Should Not Be Empty     xpath=//*[@id="title"]
    Should Not Be Empty     path=//*[@id="endDate"] 
    Should Not Be Empty      ${DROPDOWN}
    # Close Browser 

1_TS041_TC003
    Click Wellness Check
    Wait Until Page Contains Element    xpath=//button[contains(text(), 'New Wellness Check')]
    Click Element   xpath=//button[contains(text(), 'New Wellness Check')]
    Input Text      xpath=//*[@id="endDate"]    25/12/2023
    Select From List By Value  ${DROPDOWN}  ${OPTION}     Typhoon
     Click Element    xpath=//button[@class='btn-primary float-right']
    ${error_text}=    Get Text    css=.text-red-500
     Should Be Equal As Strings   ${error_text}    Title is required
    #  Close Browser


1_TS041_TC004
    Click Wellness Check
    Wait Until Page Contains Element    xpath=//button[contains(text(), 'New Wellness Check')]
    Click Element   xpath=//button[contains(text(), 'New Wellness Check')]
    Input Text      xpath=//*[@id="title"]  Typhoon Layla
    Input Text      xpath=//*[@id="endDate"]    25/12/2023
    Select From List By Value  ${DROPDOWN}  ${OPTION}     Typhoon
     Click Element    xpath=//button[@class='btn-primary float-right']
     ${button_status} =    Element Should Be Disabled    xpath=//button[@class='btn-primary float-right']
    Log    The button is disabled: ${button_status}
    #  Close Browser

1_TS041_TC005
    Click Wellness Check
    Wait Until Page Contains Element    xpath=//button[contains(text(), 'New Wellness Check')]
    Click Element   xpath=//button[contains(text(), 'New Wellness Check')]
     Input Text      xpath=//*[@id="title"]  Typhoon Anghel
    Input Text      xpath=//*[@id="endDate"]    25/12/2023
    Select From List By Value  ${DROPDOWN}  ${OPTION}     Typhoon
    Click Element    xpath=//button[@class='btn-primary float-right']
    Wait Until Element Is Visible   css=.Toastify__toast--success
    Element Should Be Visible    css=.Toastify__toast--success
    # Close Browser


