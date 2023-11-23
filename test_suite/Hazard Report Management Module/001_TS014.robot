*** Settings ***
Library    SeleniumLibrary
Resource    ../../suite_setup/login.robot
Resource    ../../suite_teardown/logout.robot


*** Test Cases ***
Resolve Hazard Report
    Dispatcher Login
    Logout
    
    