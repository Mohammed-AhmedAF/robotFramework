*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${user_name}    standard_user
${password}    secret_sauce
${url_address}    https://www.saucedemo.com/
${first_name}    Mohamed
${last_name}    Ahmed
${postal_code}    51444

*** Test Cases ***
FirstItem
    [Teardown]    Close Browser    
    Open Browser    url=${url_address}    browser=chrome
    Maximize Browser Window
    Input Text    locator=user-name    text=${user_name}
    Input Password    locator=password    password=${password}
    Click Button    locator=login-button
    Sleep    time_=5
    Wait Until Page Contains Element    id=inventory_container
    Page Should Contain     Products
    Click Image    locator=Sauce Labs Backpack
    Sleep    time_=5
    Wait Until Page Contains Element    class=inventory_details_price

SecondItem
    [Documentation]    Buying the upper item on the right
    [Teardown]    Close Browser    
    Open Browser    url=${url_address}    browser=firefox
    Maximize Browser Window
    Input Text    locator=user-name    text=${user_name}
    Input Password    locator=password    password=${password}
    Click Button    locator=login-button
    Sleep    time_=5
    Wait Until Page Contains Element    id=inventory_container
    Page Should Contain     Products
    Click Element     xpath=//div[contains(text(), 'Bike Light')]
    Click Button    name=add-to-cart
    Click Link    class=shopping_cart_link
    Click Button    name=checkout
    Input Text    id=first-name    text=${first_name}
    Input Text    id=last-name    text=${last_name}
    Input Text    id=postal-code    text=${postal_code}
    Click Button    id=continue
    Click Button    id=finish
    Click Button    id=back-to-products
    Sleep    time_=5

    