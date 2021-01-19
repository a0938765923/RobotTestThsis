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
Patient Should Only See Myself In Rental Page
    Login To The Page    userName=&{patientAccount}[userName]    password=&{patientAccount}[password]
    Success Should be Visible    Login successfully
    Click Tab    Online Service   Rental
    Doctor Should Only See Role Of Patient On Rental Page

Should success when patient make a rental
    Login To The Page    userName=&{patientAccount}[userName]    password=&{patientAccount}[password]
    Success Should be Visible    Login successfully
    Click Tab    Online Service    Rental
    Click Element After It Is Visible    //button[normalize-space()='Make an rental']
    Wait Until Element Is Visible On Page    //div[normalize-space()='Rental Detail']    ${shortPeriodOfTime}    error=Appointment Detail should be visible.
    Set Rental Information
    Click Save Button And Show Success
 
Should fail when patient make a rental
    Login To The Page    userName=&{patientAccount}[userName]    password=&{patientAccount}[password]
    Success Should be Visible    Login successfully
    Click Tab    Online Service    Rental
    Click Element After It Is Visible    //button[normalize-space()='Make an rental']
    Wait Until Element Is Visible On Page    //div[normalize-space()='Rental Detail']    ${shortPeriodOfTime}    error=Appointment Detail should be visible.
    Click Save Button And Show Fail

Patient Can Edit Address And Email
    Login To The Page    userName=&{patientAccount}[userName]    password=&{patientAccount}[password]
    Success Should be Visible    Login successfully
    Click Tab    User Account Management
    Edit First Row For Address And Email    addrName=板橋3333號11樓            email=a0938765923@gmail.com
    ${newEmail} =    Get Text    //*[contains(@id,'account_email')]
    ${newAddress} =    Get Text    //*[contains(@id,'account_userAddress')]
    Should Be Equal    ${newEmail}    a0938765923@gmail.com    
    Should Be Equal    ${newAddress}    板橋3333號11樓    

*** Keywords ***
Doctor Should Only See Role Of Patient On Rental Page
    @{allPatientInfo} =    Get WebElements    //*[contains(@id,'rental_patientName')]
    :FOR    ${allPatientInfo}    In    @{allPatientInfo}
    \    ${patientText} =    Get Text    ${allPatientInfo}
    \    Should Be Equal    ${patientText}    Gene

Set Rental Information
    Select Dropdown By Name    DeviceName    Wheelchair
    Select Dropdown By Name    Quantity    1
    Select Calender day    StartDate    20

Edit First Row For Address And Email
    [Arguments]    ${addrName}    ${email}
    Click Element After It Is Visible    //*[contains(@class,'ui-selectable-row')]
    Input Text    id=address    板橋3333號11樓
    Input Text    id=email   a0938765923@gmail.com
    Click Button After It Is Visible    //button[normalize-space()='Save Change']
    Click Button After It Is Visible    //button[contains(@icon,'refresh')]