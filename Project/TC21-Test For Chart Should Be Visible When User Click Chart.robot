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
Chart Should Be Visible When User Click Chart
    Login To The Page    userName=&{patientAccount}[userName]     password=&{patientAccount}[password]
    Success Dialog Should Be Visible    Login successfully
    Click Tab    Medical Record Management
    Click Button After It Is Visible    //button[normalize-space()='Chart']
    Wait Until Element Is Visible On Page    //div[normalize-space()='Medical Record Chart']    timeout=${shortPeriodOfTime}    error='Medical Record Chart' should be visible.
    Click Button After It Is Visible    //button[normalize-space()='pie']
    Click Button After It Is Visible    //button[normalize-space()='Exit']
    Wait Until Element Is Not Visible    //div[normalize-space()='Medical Record Chart']