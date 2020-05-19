*** Settings ***
Library    SeleniumLibrary
Library    String    
Library    Collections
Resource    ./Keyword.txt
Resource    ./appointmentKeyword.txt

Test Setup    Run Keywords    Open Browser    http://localhost:4200/    chrome
...                    AND    Maximize Browser Window
Test Teardown    Close All Browsers

*** Variables ***
${shortPeriodOfTime} =    3s

*** Test Cases ***
Test For Patient Make An Appointment
    Login To The Page    userName=&{patientAccount}[userName]    password=&{patientAccount}[password]
    Success Should be Visible    Login successfully
    Click Tab    Online Service    Appointment
    Set Throughput   1000   81200    81200
    Click Element After It Is Visible    //button[normalize-space()='Make an appointment']
    Wait Until Element Is Visible On Page    //div[normalize-space()='Appointment Detail']    ${shortPeriodOfTime}    error=Appointment Detail should be visible.
    Set Appointment Info
    Click Save Button And Show Success