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
Doctor account should create patient account successfully
    Login To The Page   userName=&{doctorAccount}[userName]    password=&{doctorAccount}[password]
    Success Dialog Should Be Visible    Login successfully
    Click Tab     User Account Management
    Click Element After It Is Visible    //button[normalize-space()='Add an account']
    Create Account Info    name=testForRobotCreatePatient    id=F129642705    gender=Male    role=Patient    birthday=20    email=testForRobot@gmail.com    address=板橋1111號11樓
    Success Dialog Should Be Visible    Save successfully

Doctor account should create patient account unsuccessfully
    Login To The Page   userName=&{doctorAccount}[userName]    password=&{doctorAccount}[password]
    Success Dialog Should Be Visible    Login successfully
    Click Tab     User Account Management
    Click Element After It Is Visible    //button[normalize-space()='Add an account']
    Create Account Info    name=testForRobotCreatePatient    id=${EMPTY}    gender=Male    role=Patient    birthday=20    email=testForRobot@gmail.com    address=板橋1111號11樓
    Success Dialog Should Be Visible    Save failed

*** Keywords ***
Create Account Info
    [Arguments]    ${name}    ${id}    ${gender}    ${role}    ${birthday}    ${email}    ${address}
    Input Text    id=name    ${name}
    Input Text    //*[@id='id']//input    ${id}
    Select Dropdown By Name    Gender    ${gender}
    Select Dropdown By Name    Role    ${role}
    Select Calender day    BirthDate    ${birthday}
    Input Text    id=email    ${email}
    Input Text    id=address    ${address}
    Click Save Button In Account Info Modal

Click Save Button In Account Info Modal
    Click Element    //span[normalize-space()='Save']
