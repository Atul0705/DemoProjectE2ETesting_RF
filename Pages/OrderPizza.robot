*** Settings ***
Documentation    Login page for ecommerce site to order pizza
Library    String
Library    SeleniumLibrary
Library    Collections
Resource    ../Resources/Generic_file.robot

*** Keywords ***
Select the pizza size
    [Arguments]    ${pizza_size}
    Click Element        xpath://input[@value='${pizza_size}']

Select pizza flavour
    [Arguments]    ${flavour}
    Select From List By Value    css:.form-control.form-control-sm    ${flavour}

Select pizza sauce 
    [Arguments]    ${sauce}
    Click Element    xpath://*[text()='${sauce}']

Select Toppings 
    [Arguments]    ${topping1}    ${topping2}
    Unselect Checkbox    tomato
    Click Element    xpath://*[text()='${topping1}']
    Click Element    xpath://*[text()='${topping2}']

Select the quantity
    [Arguments]    ${quantity}
    Input Text       quantity      ${quantity}

Add to cart and verify success message
    Click Element    submit_button
    Sleep        3
    Wait Until Element Is Visible    css:#added_message
    ${obtained_msg}    Get Text    css:#added_message
    Should Be Equal As Strings    ${obtained_msg}    ${purchase_success_msg}