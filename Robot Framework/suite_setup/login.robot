*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}       https://sagip-automation.vercel.app/
${BROWSER}   Chrome

*** Keywords ***

Login
    Open Browser    ${URL}    ${BROWSER}
    
    Maximize Browser Window
    [Arguments]    ${username}    ${password}
    Go To   ${URL}
    Wait Until Element Is Visible    xpath=//*[@id="root"]/div[1]/div[3]/button[1]    10 seconds
    Click Element   xpath=//*[@id="root"]/div[1]/div[3]/button[1]
    Click Element   id=identifier
    Input Text      id:identifier    ${username}
    Click Element   id=password
    Input Text      id:password    ${password}
    Click Element   xpath=//*[@id="root"]/div[1]/div[1]/button
    Wait Until Element Is Visible   xpath=//*[@id="root"]/div[1]/div[2]/div/header/h1    60 seconds
    Element Should Be Visible    xpath=//*[@id="root"]/div[1]/div[2]/div/header/h1


Admin Login
   
    Login    admin@sagip.live    Sagip.00

Employee Login
   
    Login    employee@sagip.live    Sagip.00

Dispatcher Login
   
    Login    dispatcher@sagip.live    Sagip.00


Given that an admin is logged in
   
    Login    admin@sagip.live    Sagip.00

Give that an employee is logged in
   
    Login    employee@sagip.live    Sagip.00

Given that a dispatcher is logged in
   
    Login    dispatcher@sagip.live    Sagip.00

