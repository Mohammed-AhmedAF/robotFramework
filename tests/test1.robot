*** Settings ***
Library    OperatingSystem
Library    Collections
Library    XML
Library    ../resources/help_functions.py
Resource    ../resources/data_resources.robot

*** Keywords ***
Log my name
    Log    ${DICTIONARY}[name]

Log My Specific Username
    [Arguments]    ${username}
    Log    ${username}

Log My Data
    [Arguments]    ${name}    ${address}
    Log    ${name}
    Log    ${address}

*** Variables ***
&{DICTIONARY}    name=Mohamed
&{user_data}    name=Mohamed    address=Ismailia
@{colors}    red    blue    black    yellow

*** Test Cases ***
MyFirstTest
    [Tags]    critical
    Log    ${DICTIONARY}[name]
    Log my name
    Log    ${DICTIONARY}
    Create File    ./test.txt

MySecondTest
    Log    Bis Ende der Welt

MyThirdTest
    Log My Data    ${user_data}[name]    ${user_data}[address]
    Log My Data    ${books}[name]    ${books}[first_published]
    ${result}=    Calculate Sum    5    7
    Log My Data    ${books}[name]    ${result}
    
MyFourthTest
    ${welcome_message}=    Deliver Welcome Message    Moha
    Log    ${welcome_message}

FifthTest
    FOR    ${color}    IN     @{colors}
        Log    ${color}
    END

