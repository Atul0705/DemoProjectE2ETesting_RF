*** Settings ***
Documentation        To open login page and validate invalid login 
...                  The system specific keywords are created here form our own
...                  domain specific language.The utilized keywords are provided by 
...                  the imported seleniumLibrary.

Library    SeleniumLibrary

*** Variables ***
${url}                    https://dineshvelhal.github.io/testautomation-playground/login.html
${valid_username}         admin
${valid_password}         admin
${invalid_password}       admin1
${invalid_username}       admin1
${invalid_login_msg}      Incorrect username or password. Try again!!
${pizza_size}             SMALL
${sauce}                  Barbeque
${quantity}               5
${flavour}                Veggie Delight
${toppings1}              Onions
${toppings2}              Green Olive
${purchase_success_msg}   Pizza added to the cart!

*** Keywords ***
Open ecommerce login page with the url
    Open Browser    ${url}    browser=chrome    options=add_experimental_option("detach",${true})
    Maximize Browser Window
    
Verify the page
    [Arguments]    ${page_name}
    Title Should Be    ${page_name}

Close the session
    Close Browser