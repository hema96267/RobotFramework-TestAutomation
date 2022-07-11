*** Settings ***
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***
Verify File Upload
    [documentation]  This test case verifies that a Clerk can successfully upload a file
    [tags]  Regression

    Open Browser  http://localhost:8080/  chrome
    Maximise Browser Window

    Wait Until Element Is Visible  //span[contains(text(),'Upload CSV file')]  timeout=5
    Page Should Contains  Upload CSV file
    Press Keys  //*[@id="contents"]/div[1]/div[1]/span  RETURN
    Choose File  //input[@type='file']  /Robot-Framework/Resources/EmployeesData.csv

    Page Should Not Contains  No records at the moment 😢
*** Keywords ***
