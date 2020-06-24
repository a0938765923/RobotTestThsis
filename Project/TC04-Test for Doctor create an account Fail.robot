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
Test for Doctor create an account Fail
    Login To The Page   userName=&{doctorAccount}[userName]    password=&{doctorAccount}[password]
    Success Should be Visible    Login successfully
    Click Tab     User Account Management
    Click Element After It Is Visible    //button[normalize-space()='Add an account']
    Set Create Account Info
    Click Save Button And Show Fail V2

Test for Doctor create an account Fail V2
    Test By My Test

*** Keywords ***
Set Create Account Info
    Input Text    id=name    testForRobotCreatePatient
    Select Dropdown By Name    Gender    Male
    Select Dropdown By Name    Role    Patient
    Select Calender day    BirthDate    15
    Input Text    id=email1    testForRobot@gmail.com
    Input Text    id=address    板橋1111號11樓

Test By My Test
    Set Create Account Info