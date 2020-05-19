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
Login success test
    Login To The Page    userName=&{adminAccount}[userName]    password=&{adminAccount}[password]
    Set Throughput    1000    81200    81200
    Success Should be Visible    Login successfully