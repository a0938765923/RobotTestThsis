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
Should success when login page
    Login To The Page    userName=&{adminAccount}[userName]    password=&{adminAccount}[password]
    Success Should be Visible    Login successfully

Should fail when login page
    Login To The Page    userName=failAdmin
    Success Should be Visible    Login failed

Should success when logout page
    Login To The Page    userName=&{adminAccount}[userName]    password=&{adminAccount}[password]
    Success Should be Visible    Login successfully
    Click Button After It Is Visible    //button[normalize-space()='Logout']
    Wait Until Element Is Visible On Page    //h3[normalize-space()='Login']    timeout=${shortPeriodOfTime}    error=Logout is not success.