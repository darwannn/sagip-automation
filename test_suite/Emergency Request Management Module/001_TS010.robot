*** Settings ***
Library    SeleniumLibrary
Resource    ../../suite_setup/login.robot
Resource    ../../suite_teardown/logout.robot




*** Keyword ***

Click Assistance Request
    Dispatcher Login
    Go To    https://sagip-automation.vercel.app/admin/emergency-reports
    Wait Until Page Contains Element    xpath=//*[@id="root"]/div[1]/div[2]/div/div[1]/div[3]/div[1]

    ${element}=     Get WebElement    xpath=//div[contains(text(), 'resolved')]
    Run Keyword Unless  '${element}'=='None'  Assistance Present

Assistance Present

    Click Element   xpath=//div[contains(text(), 'resolved')]
    Wait Until Element Is Visible  //*[@id="root"]/div[1]/div[2]/div/div[2]/div[1]/p
    Element Should Be Visible  //*[@id="root"]/div[1]/div[2]/div/div[2]/div[1]/p

*** Test Cases ***
1_TS010_TC001
    Click Assistance Request
    Element Should Be Visible   xpath=//*[@id="root"]/div[1]/div[2]/div/div[2]/div[1]/p
    Close Browser

1_TS010_TC002
  
    Click Assistance Request
    Click Element     xpath=//a[contains(text(), 'Incident Details')]
    Wait Until Element Is Visible   xpath=//*[@id="root"]/div[1]/div[2]/div/div[2]/div[3]/div[2]/div[1]
    Element Should Be Visible   xpath=//*[@id="root"]/div[1]/div[2]/div/div[2]/div[3]/div[2]/div[1]
    Close Browser

1_TS010_TC003
 
    Click Assistance Request
    Click Element     xpath=//a[contains(text(), 'Incident Details')]
    Wait Until Element Is Visible   xpath=//*[@id="root"]/div[1]/div[2]/div/div[2]/div[3]/div[2]/div[1]
    Click Element     xpath=//button[contains(text(), 'Print Report')]
    Location Should Contain    /admin/emergency-reports/
    Close Browser
   


