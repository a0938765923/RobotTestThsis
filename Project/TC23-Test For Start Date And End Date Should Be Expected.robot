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
Start Date And End Date Should Be Expected
    Login To The Page    userName=&{patientAccount}[userName]    password=&{patientAccount}[password]
    Success Should be Visible    Login successfully
    Click Tab    Online Service    Rental
    Click Element After It Is Visible    //button[normalize-space()='Make an rental']
    Wait Until Element Is Visible On Page    //div[normalize-space()='Rental Detail']    ${shortPeriodOfTime}    error=Appointment Detail should be visible.
    Select Calender day    StartDate    22
    ${actualEndDate} =    Get Element Attribute    //*[(@class='ui-inputtext ui-corner-all ui-state-default ui-widget ui-state-filled')]    value
    ${date} =    Add Time To Date    ${actualEndDate}    -7days
    ${date} =    Convert Date    ${date}    datetime
    Should Be Equal As Integers    ${date.day}    22