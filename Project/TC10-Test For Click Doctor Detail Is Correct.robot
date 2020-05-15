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
Test For Click Doctor Detail Is Correct
    Login To The Page    userName=&{doctorAccount}[userName]    password=&{doctorAccount}[password]
    Success Should be Visible    Login successfully
    Click Tab    User Account Management
    ${id} =    Get Element Attribute    (//*[contains(@class,'ui-selectable-row')])[1]    id
    @{expectlPatientDetail}    Create List    
    @{patientDetails} =    Get WebElements    //*[@class='autoNewline ng-star-inserted' and contains(@id,'${id}')]
    :FOR    ${patientDetail}    In    @{patientDetails}
    \    ${detail} =    Get Text    ${patientDetail}
    \    Append To List    ${expectlPatientDetail}    ${detail}
    Click Element After It Is Visible    //*[contains(@class,'ui-selectable-row')][1]
    @{actualPatientDetail}    Create List    
    @{patientDetails} =    Get WebElements    //*[contains(@class,'ui-g')]//input[@ng-reflect-model]
    :FOR    ${patientDetail}    In    @{patientDetails}
    \    ${detail} =    Get Element Attribute    ${patientDetail}    value
    \    Append To List    ${actualPatientDetail}    ${detail}
    ${dropdownValue} =    Get Element Attribute    //*[@id='id']//input    value
    Append To List    ${actualPatientDetail}    ${dropdownValue}
    ${subjectDetail} =    Get Text    //*[contains(@class,'ui-dropdown-label')]
    Append To List    ${actualPatientDetail}    ${subjectDetail}
    Sort List    ${expectlPatientDetail}
    Sort List    ${actualPatientDetail}
    Lists Should Be Equal    ${expectlPatientDetail}    ${actualPatientDetail}