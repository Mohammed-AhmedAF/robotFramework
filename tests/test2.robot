*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${user_name}    standard_user
${password}    secret_sauce
${url_address}    https://www.saucedemo.com/

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
    Open Browser    url=${url_address}    browser=chrome
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
    Sleep    time_=5

    