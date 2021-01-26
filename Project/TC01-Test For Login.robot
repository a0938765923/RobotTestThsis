*** Settings ***
Library    SeleniumLibrary
Library    String    
Library    Collections
Library    PythonTestLibrary
Resource    ./Keyword.txt

Test Setup    Run Keywords    Open Browser    http://localhost:4200/    chrome
...                    AND    Maximize Browser Window
Test Teardown    Close Browser

*** Variables ***
${shortPeriodOfTime} =    3s

*** Test Cases ***
User with existing account should login successfully
    Login To The Page    userName=&{adminAccount}[userName]    password=&{adminAccount}[password]
    Success Dialog Should Be Visible    Login successfully

User with nonexistent account should login unsuccessfully 
    Login To The Page    userName=failAdmin
    Success Dialog Should Be Visible    Login failed

User should be able to logout successfully
    Login To The Page    userName=&{adminAccount}[userName]    password=&{adminAccount}[password]
    Success Dialog Should Be Visible    Login successfully
    Click Button After It Is Visible    //button[normalize-space()='Logout']
    Wait Until Element Is Visible On Page    //h3[normalize-space()='Login']    timeout=${shortPeriodOfTime}    error=Logout is not success.