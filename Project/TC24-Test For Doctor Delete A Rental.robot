*** Settings ***
Library    SeleniumLibrary
Library    String    
Library    Collections
Library    DateTime
Resource    ./Keyword.txt

Test Setup    Run Keywords    Open Browser    http://localhost:4200/    chrome
...                    AND    Maximize Browser Window
Test Teardown    Close Browser

*** Variables ***
${shortPeriodOfTime} =    3

*** Test Cases ***
Doctor Delete A Rental
    Login To The Page    userName=&{doctorAccount}[userName]    password=&{doctorAccount}[password]
    Success Should be Visible    Login successfully
    Click Tab    Online Service    Rental
    Delete A Rental For First List

*** Keywords ***
Delete A Rental For First List
    ${id} =    Get Element Attribute    (//tr[contains(@class,'ui-selectable-row ng-star-inserted')])[1]    id
    Click Element After It Is Visible    (//tr[contains(@class,'ui-selectable-row ng-star-inserted')])[1]
    Wait Until Element Is Visible On Page    //div[normalize-space()='Rental Detail']    ${shortPeriodOfTime}    error=Appointment Detail should be visible.
    Click Element After It Is Visible    //span[normalize-space()='Cancel Rental']
    Click Element After It Is Visible    //span[normalize-space()='Yes']
    Success Should be Visible    Delete successfully
    Wait Until Element Is Not Visible    id=rental_patientName_${id}    timeout=${shortPeriodOfTime}    error=Rental Should Be Deleted.