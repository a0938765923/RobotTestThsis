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
Should Success when click patient detail
    Login To The Page    userName=&{patientAccount}[userName]    password=&{patientAccount}[password]
    Success Should be Visible    Login successfully
    Click Tab    User Account Management
    @{expectedPatientDetail}    Create List
    @{patientDetails} =    Get WebElements    //*[contains(@class,'autoNewline')]
    :FOR    ${patientDetail}    In    @{patientDetails}
    \    ${detail} =    Get Text    ${patientDetail}
    \    Append To List    ${expectedPatientDetail}    ${detail}
    Click Element After It Is Visible    //*[contains(@class,'ui-selectable-row')]
    @{actualPatientDetail}    Create List    
    @{patientDetails} =    Get WebElements    //*[contains(@class,'ui-g')]//input[@ng-reflect-model]
    :FOR    ${patientDetail}    In    @{patientDetails}
    \    ${detail} =    Get Element Attribute    ${patientDetail}    value
    \    Append To List    ${actualPatientDetail}    ${detail}
    ${patientDetails} =    Get WebElement    //*[contains(@class,'ui-g')]//*[@ng-reflect-model]//input
    ${detail} =    Get Element Attribute    ${patientDetails}    value
    Append To List    ${actualPatientDetail}    ${detail}
    Sort List    ${expectedPatientDetail}
    Sort List    ${actualPatientDetail}
    Lists Should Be Equal    ${expectedPatientDetail}    ${actualPatientDetail}    