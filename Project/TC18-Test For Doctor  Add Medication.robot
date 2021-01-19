*** Settings ***
Library    SeleniumLibrary
Library    String    
Library    Collections
Resource    ./Keyword.txt

Test Setup    Run Keywords    Open Browser    http://localhost:4200/    chrome
...                    AND    Maximize Browser Window
Test Teardown    Close All Browsers

*** Variables ***
${shortPeriodOfTime} =    3s

*** Test Cases ***
Should success when doctor add the medication
    Login To The Page    userName=&{doctorAccount}[userName]    password=&{doctorAccount}[password]
    Success Should be Visible    Login successfully
    Click Tab    Medical Record Management
    Click Element After It Is Visible    (//tr[contains(@class,'ui-selectable-row ng-star-inserted')])[1]
    Click Element After It Is Visible    //button[normalize-space()='Add a record']
    Select Dropdown By Name    Condition    Sore throat
    Input Text    //input[contains(@class,'ng-star-inserted')]    FM2
    Input Text    (//label[normalize-space()='dose:']/../following-sibling::div//input)[1]    3
    Click Element After It Is Visible    //span[normalize-space()='Save']
    Success Should be Visible    Save successfully