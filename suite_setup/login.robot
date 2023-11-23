*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}       https://sagip-automation.vercel.app/
${BROWSER}   Chrome

*** Keywords ***
Open Browser and Maximize
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Login
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
    Open Browser and Maximize
    Login    admin@sagip.live    Sagip.00

Employee Login
    Open Browser and Maximize
    Login    employee@sagip.live    Sagip.00

Dispatcher Login
    Open Browser and Maximize
    Login    dispatcher@sagip.live    Sagip.00


# Login
#     [Arguments]    ${username}    ${password}
#     Go To   ${URL}
    
#     ${element_visible}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//*[@id="root"]/div[1]/div[2]/div/header/h1
#     Run Keyword Unless    ${element_visible}    Login Required   ${username}    ${password}
# Login Required
#     [Arguments]    ${username}    ${password}
#     Wait Until Element Is Visible    xpath=//*[@id="root"]/div[1]/div[3]/button[1]    10 seconds
#     Click Element   xpath=//*[@id="root"]/div[1]/div[3]/button[1]
#     Click Element   id=identifier
#     Input Text      id:identifier    ${username}
#     Click Element   id=password
#     Input Text      id:password    ${password}
#     Click Element   xpath=//*[@id="root"]/div[1]/div[1]/button
#     Wait Until Element Is Visible   xpath=//*[@id="root"]/div[1]/div[2]/div/header/h1    60 seconds
#     Element Should Be Visible    xpath=//*[@id="root"]/div[1]/div[2]/div/header/h1


