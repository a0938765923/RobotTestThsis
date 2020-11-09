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
Test For Patient Should Only See Myself In Rental Page
    Login To The Page    userName=&{patientAccount}[userName]    password=&{patientAccount}[password]
    Success Should be Visible    Login successfully
    Click Tab    Online Service   Rental
    Doctor Should Only See Role Of Patient On Rental Page

Test For Patient Make A Rental
    Login To The Page    userName=&{patientAccount}[userName]    password=&{patientAccount}[password]
    Success Should be Visible    Login successfully
    Click Tab    Online Service    Rental
    Click Element After It Is Visible    //button[normalize-space()='Make an rental']
    Wait Until Element Is Visible On Page    //div[normalize-space()='Rental Detail']    ${shortPeriodOfTime}    error=Appointment Detail should be visible.
    Set Rental Information
    Click Save Button And Show Success
 
Test For Patient Save Failed
    Login To The Page    userName=&{patientAccount}[userName]    password=&{patientAccount}[password]
    Success Should be Visible    Login successfully
    Click Tab    Online Service    Rental
    Click Element After It Is Visible    //button[normalize-space()='Make an rental']
    Wait Until Element Is Visible On Page    //div[normalize-space()='Rental Detail']    ${shortPeriodOfTime}    error=Appointment Detail should be visible.
    Select Dropdown By Name    Quantity    1
    Select Calender day    StartDate    15
    Click Save Button And Show Fail V2

*** Keywords ***
Doctor Should Only See Role Of Patient On Rental Page
    @{allPatientInfo} =    Get WebElements    //*[contains(@id,'rental_patientname')]
    :FOR    ${allPatientInfo}    In    @{allPatientInfo}
    \    ${patientText} =    Get Text    ${allPatientInfo}
    \    Should Be Equal    ${patientText}    mark_robot

Set Rental Information
    Select Dropdown By Name    DeviceName    Wheelchair
    Select Dropdown By Name    Quantity    1
    Select Calender day    StartDate    15