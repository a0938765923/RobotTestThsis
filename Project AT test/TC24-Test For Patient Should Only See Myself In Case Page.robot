*** Settings ***
Library    SeleniumLibrary
Library    String    
Library    Collections
Resource    ./Keyword.txt

Test Setup    Run Keywords    Open Browser    http://localhost:4200/    chrome
...                    AND    Maximize Browser Window
Test Teardown    Close All Browsers

*** Variables ***
${shortPeriodOfTime} =    3s

*** Test Cases ***
Test For Patient Should Only See Myself In Case Page
    Login To The Page    userName=&{patientAccount}[userName]     password=&{patientAccount}[password]
    Success Should be Visible    Login successfully
    Click Tab    Medical Record Management
    @{allPatientInfo} =    Get WebElements    //*[contains(@id,'rental_patientName')]
    :FOR    ${allPatientInfo}    In    @{allPatientInfo}
    \    ${patientText} =    Get Text    ${allPatientInfo}
    \    Should Be Equal    ${patientText}    mark