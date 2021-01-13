*** Settings ***
Library    SeleniumLibrary
Library    String    
Library    Collections
Resource    ./Keyword.txt
Resource    ./userAccountKeyword.txt

Test Setup    Run Keywords    Open Browser    http://localhost:4200/    chrome
...                    AND    Maximize Browser Window
Test Teardown    Close Browser

*** Variables ***
${shortPeriodOfTime} =    3s

*** Test Cases ***
Admin Can Disable Account
    Login To The Page    userName=&{adminAccount}[userName]        password=&{adminAccount}[password]
    Success Should be Visible    Login successfully
    Click Tab    User Account Management
    Click Element After It Is Visible    //*[contains(@class,'ui-selectable-row')][1]
    Click Element After It Is Visible    //*[contains(@class,'ui-inputswitch-slider')]
    Click Save And Is Success
    Click Button After It Is Visible    //button[normalize-space()='Logout']
    Login To The Page    A123    0101
    Success Should be Visible    Login failed