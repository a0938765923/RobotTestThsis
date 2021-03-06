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
Should fail when doctor save the modified data
    Login To The Page    userName=&{doctorAccount}[userName]    password=&{doctorAccount}[password]
    Success Dialog Should Be Visible    Login successfully
    Click Tab    User Account Management
    Click Element After It Is Visible    //*[contains(@class,'ui-selectable-row')][1]
    Clear Field By Id    email
    Click Button After It Is Visible    //button[normalize-space()='Save Change']
    Success Dialog Should Be Visible    Save failed