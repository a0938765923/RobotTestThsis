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
Should success when patient edit appointment
    Login To The Page    userName=&{patientAccount}[userName]    password=&{patientAccount}[password]
    Success Dialog Should Be Visible    Login successfully
    Click Tab    Online Service    Appointment
    Click Element After It Is Visible    (//tr[contains(@class,'ui-selectable-row ng-star-inserted')])[1]
    Select Calender day    Date    15
    Click Save Button And Show Success