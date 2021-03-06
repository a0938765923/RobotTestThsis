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
Patient Should Only See Self In Appointment Page
    Login To The Page    userName=&{patientAccount}[userName]    password=&{patientAccount}[password]
    Success Dialog Should Be Visible    Login successfully
    Click Tab    Online Service    Appointment
    Doctor Should Only See Role Of Patient On Appointment Page     mark_robot