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
Patient Cancel An Appointment
    Login To The Page    userName=&{patientAccount}[userName]    password=&{patientAccount}[password]
    Success Should be Visible    Login successfully
    Click Tab    Online Service    Appointment
    Select First List And Cancel Appointment