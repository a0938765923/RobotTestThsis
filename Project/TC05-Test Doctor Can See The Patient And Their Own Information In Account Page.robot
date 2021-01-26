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
Doctor can see the patient and their own information in account page
    Login To The Page    userName=&{doctorAccount}[userName]    password=&{doctorAccount}[password]
    Success Dialog Should Be Visible    Login successfully
    Click Tab    User Account Management
    @{allPatientNames} =    Get WebElements    //*[contains(@id,'account_userName')]
    @{allPatientRoles} =    Get WebElements    //*[contains(@id,'account_role')]
    ${listLen} =    Get Length    ${allPatientNames}
    :FOR    ${index}    IN RANGE    0    ${listLen}
    \    ${patientNameText} =    Get Text    @{allPatientNames}[${index}]
    \    ${patientRoleText} =    Get Text    @{allPatientRoles}[${index}]
    \    Run Keyword If    '${patientNameText}' != 'mark_doctor_robot'    Should Be Equal    ${patientRoleText}     patient