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
Doctor Can Modify Medication
    Login To The Page    userName=&{doctorAccount}[userName]    password=&{doctorAccount}[password]
    Success Dialog Should Be Visible    Login successfully
    Click Tab    Medical Record Management
    Click Element After It Is Visible    (//tr[contains(@class,'ui-selectable-row ng-star-inserted')])[1]
    Click Element After It Is Visible    (//*[contains(@id,'medical_condition')])[1]
    Clear Field By Class
    Input Text    //input[contains(@class,'ui-autocomplete-input')]    FM2
    Click Element After It Is Visible    //span[normalize-space()='Save']
    Success Dialog Should Be Visible    Save successfully

*** Keywords ***
Clear Field By Class
    ${fieldText} =    Get Element Attribute    //*[contains(@class,'ui-autocomplete-input')]    value
    ${fieldTextLen} =    Get Length    ${fieldText}
    :FOR    ${index}    In Range    0    ${fieldTextLen}
    \    Press Key    //*[contains(@class,'ui-autocomplete-input')]    \\8