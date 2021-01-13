*** Settings ***
Library    SeleniumLibrary
Library    String    
Library    Collections
Resource    ./Keyword.txt
# Resource    ./appointmentKeyword.txt

Test Setup    Run Keywords    Open Browser    http://localhost:4200/    chrome
...                    AND    Maximize Browser Window
Test Teardown    Close All Browsers

*** Variables ***
${shortPeriodOfTime} =    3s

*** Test Cases ***
Patient Save Failed
    Login To The Page    userName=&{patientAccount}[userName]    password=&{patientAccount}[password]
    Success Should be Visible    Login successfully
    Click Tab    Online Service    Appointment
    Click Element After It Is Visible    //button[normalize-space()='Make an appointment']
    Wait Until Element Is Visible On Page    //div[normalize-space()='Appointment Detail']    ${shortPeriodOfTime}    error=Appointment Detail should be visible.
    Select Dropdown By Name    Subject    Division of Chest
    Select Dropdown By Name    Doctor    Chucky
    Select Calender day    Date    15
    Click Save Button And Show Fail V2