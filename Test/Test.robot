*** Settings ***
Resource    ../Resources/Generic_file.robot
Resource    ../Pages/LoginPage.robot
Resource    ../Pages/OrderPizza.robot
Library    SeleniumLibrary
Library    String
Test Setup    Open ecommerce login page with the url
Test Teardown    Close The Session


*** Test Cases ***
Validate unsuccessful login attempt
    [Tags]    SMOKE
    Generic_file.Verify the page    Login
    LoginPage.Entering the login credential   ${invalid_username}    ${invalid_password}
    LoginPage.Validate Error message
    
Validate successful login attempt
    [Tags]    SMOKE
    Generic_file.Verify the page    Login
    LoginPage.Entering the login credential   ${valid_username}    ${valid_password}
    Generic_file.Verify the page    Order Pizza

Login and make a purchase and verify the successful purchase
    [Tags]    REGRESSION
    Generic_file.Verify the page    Login
    LoginPage.Entering the login credential   ${valid_username}    ${valid_password}
    Generic_file.Verify the page    Order Pizza
    OrderPizza.Select the pizza size      ${pizza_size}
    OrderPizza.Select pizza flavour        ${flavour}
    OrderPizza.Select pizza sauce          ${sauce}
    OrderPizza.Select Toppings        ${toppings1}    ${toppings2}
    OrderPizza.Select the quantity    ${quantity}
    OrderPizza.Add to cart and verify success message
    