*** Settings ***
Library    SeleniumLibrary
Library    String    
Library    Collections
Resource    ./Keyword.txt

Test Setup    Run Keywords    Open Browser    http://localhost:4200/    chrome
...                    AND    Maximize Browser Window
Test Teardown    Close Browser

*** Variables ***
${shortPeriodOfTime} =    3s

*** Test Cases ***
Docter Can Modify An Account
    Login To The Page    userName=&{doctorAccount}[userName]    password=&{doctorAccount}[password]
    Success Should be Visible    Login successfully
    Click Tab     User Account Management
    Click Row By User Account Management    Patient    K123456789
    Input Text    id=address    板橋1122號33樓
    Click Save And Is Success

*** Keywords ***
Click Save And Is Success
    Click Element After It Is Visible    //span[normalize-space()='Save Change']
    Success Should be Visible    Save successfully
