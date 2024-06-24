*** Settings ***
Documentation    Login page for ecommerce site to order pizza 
Library    String
Library    SeleniumLibrary
Library    Collections
Resource    ../Resources/Generic_file.robot



*** Keywords ***
Entering the login credential
    [Arguments]    ${username}    ${password}
    Input Text    user         ${username}
    Input Password    password     ${password}
    Click Button    login

Validate Error message 
    ${error_msg_obtained}    Get Text    css:#message
    Should Be Equal As Strings    ${error_msg_obtained}    ${invalid_login_msg}



