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
Should success when docter delete account
    Login To The Page    userName=&{doctorAccount}[userName]    password=&{doctorAccount}[password]
    Success Dialog Should Be Visible    Login successfully
    Click Tab     User Account Management
    Click Row By User Account Management    Patient    K123456789
    Click Element After It Is Visible    //span[normalize-space()='Delete']
    Click Element After It Is Visible    //span[normalize-space()='Yes']
    Wait Until Element Is Not Visible    //*[contains(@class,'ng-star-inserted') and normalize-space()='mm']//following-sibling::*[normalize-space()='555666777']
