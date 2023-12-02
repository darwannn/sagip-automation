*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Close Chrome
    Close Browser

*** Keywords ***
Logout
    Wait Until Element Is Visible    xpath=//*[@id="root"]/div[1]/div[1]/aside/nav/div[2]/div[2]/button
    Click Element    xpath=//*[@id="root"]/div[1]/div[1]/aside/nav/div[2]/div[2]/button
    Close Chrome
    
