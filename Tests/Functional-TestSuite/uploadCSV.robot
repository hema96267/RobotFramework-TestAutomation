*** Settings ***
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***
Verify File Upload
    [documentation]  This test case verifies that a Clerk can successfully upload a file
    [tags]  Regression

    Open Browser  http://localhost:8080/  chrome
    Maximise Browser Window

    Location Should Be  http://localhost:8080/

    Alert Should Not Be Present
    Page Should Contains  Upload CSV file
    Wait Until Element Is Visible  //span[contains(text(),'Upload CSV file')]  timeout=5
    Element Should Be Visible   //span[contains(text(),'Upload CSV file')]
    Page Should Contain Button  //span[contains(text(),'Upload CSV file')]/parent::button
    Element Should be Enabled   //span[contains(text(),'Upload CSV file')]/parent::button
    Press Keys  //*[@id="contents"]/div[1]/div[1]/span  RETURN
    Choose File  //input[@type='file']  /Robot-Framework/Resources/EmployeesData.csv

    Page Should Not Contains  No records at the moment 😢
*** Keywords ***
