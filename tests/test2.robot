*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${user_name}    standard_user
${password}    secret_sauce

*** Test Cases ***
FirstTest
    [Teardown]    Close Browser    
    Open Browser    url=https://www.saucedemo.com/    browser=chrome
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