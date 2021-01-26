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
Should success when docter modify patient account
    Login To The Page    userName=&{doctorAccount}[userName]    password=&{doctorAccount}[password]
    Success Dialog Should Be Visible    Login successfully
    Click Tab     User Account Management
    Click Row By User Account Management    Patient    K123456789
    Input Text    id=address    板橋1122號33樓
    Should Success When Click Save Button

*** Keywords ***
Should Success When Click Save Button
    Click Element After It Is Visible    //span[normalize-space()='Save Change']
    Success Dialog Should Be Visible    Save successfully
