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
Patient should only see their own data on account page
    Login To The Page    userName=&{patientAccount}[userName]    password=&{patientAccount}[password]
    Success Dialog Should Be Visible    Login successfully
    Click Tab    User Account Management
    Patient Should Only See Their Own Data On Account Page    Gene

*** Keywords ***
Patient Should Only See Their Own Data On Account Page
    [Arguments]    ${patientName}
    @{allPatientInfo} =    Get WebElements    //*[contains(@id,'account_userName')]
    :FOR    ${allPatientInfo}    In    @{allPatientInfo}
    \    ${patientText} =    Get Text    ${allPatientInfo}
    \    Should Be Equal    ${patientText}    ${patientName}






    


