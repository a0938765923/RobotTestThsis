*** Settings ***
Library    SeleniumLibrary
Library    String    
Library    Collections
Resource    ./Keyword.txt
Resource    ./userAccountKeyword.txt

Test Setup    Run Keywords    Open Browser    http://localhost:4200/    chrome
...                    AND    Maximize Browser Window
Test Teardown    Close Browser

*** Variables ***
${shortPeriodOfTime} =    3s

*** Test Cases ***
Test For Patient Can Edit Address And Email
    Login To The Page    userName=&{patientAccount}[userName]    password=&{patientAccount}[password]
    Success Should be Visible    Login successfully
    Click Tab    User Account Management
    Edit First Row For Address And Email    addrName=板橋3333號11樓            email=a0938765923@gmail.com
    ${newEmail} =    Get Text    //*[contains(@id,'account_email')]
    ${newAddress} =    Get Text    //*[contains(@id,'account_userAddress')]
    Should Be Equal    ${newEmail}    a0938765923@gmail.com    
    Should Be Equal    ${newAddress}    板橋3333號11樓    

Test For Patient Save Failed
    Login To The Page    userName=&{patientAccount}[userName]    password=&{patientAccount}[password]
    Success Should be Visible    Login successfully
    Click Tab    User Account Management
    Click Element After It Is Visible    //*[contains(@class,'ui-selectable-row')]
    Clear Field By Id    email
    Click Save Button And Show Fail

*** Keywords ***
Edit First Row For Address And Email
    [Arguments]    ${addrName}    ${email}
    Click Element After It Is Visible    //*[contains(@class,'ui-selectable-row')]
    Input Text    id=address    板橋3333號11樓
    Input Text    id=email   a0938765923@gmail.com
    Click Button After It Is Visible    //button[normalize-space()='Save Change']
    Click Button After It Is Visible    //button[contains(@icon,'refresh')]