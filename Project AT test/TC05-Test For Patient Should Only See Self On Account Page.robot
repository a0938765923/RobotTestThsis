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
Test For Patient Should Only See Self On Account Page
    Login To The Page    userName=&{patientAccount}[userName]    password=&{patientAccount}[password]
    Success Should be Visible    Login successfully
    Click Tab    User Account Management
    Doctor Should Only See Role Of Patient On Account Page    mark_robot 

*** Keywords ***
Doctor Should Only See Role Of Patient On Account Page
    [Arguments]    ${patientName}
    @{allPatientInfo} =    Get WebElements    //*[contains(@id,'account_userName')]
    :FOR    ${allPatientInfo}    In    @{allPatientInfo}
    \    ${patientText} =    Get Text    ${allPatientInfo}
    \    Should Be Equal    ${patientText}    ${patientName}