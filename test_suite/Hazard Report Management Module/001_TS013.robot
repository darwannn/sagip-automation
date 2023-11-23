*** Settings ***
Library    SeleniumLibrary
Resource    ../../suite_setup/login.robot
Resource    ../../suite_teardown/logout.robot

*** Test Cases ***
Verify Hazard Report
    Dispatcher Login
    Go To    https://sagip-automation.vercel.app/admin/hazard-reports
    Click Element    css=.bg-white:nth-child(1) .mt-2 > .font-medium
    Click Element    css=.btn-primary
    ${element} =    Get WebElement    css=.btn-primary > svg
    Mouse Over    ${element}
    Click Element    css=.btn-primary
    ${title} =    Get Title
    Should Be Equal As Numbers    ${title}    SAGIP - Safety Assistance with Geotracking Integration Program
    Element Should Be Visible    css=.Toastify__toast-body > div:nth-child(2)
    # Logout
