*** Settings ***
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***
Verify File should not Upload, when invalid format of CSV is provided
    [documentation]  This test case verifies that a Clerk cannot  upload a CSV file, with the headers (nationID, name, dob, gender, salary, tax) missing in the first row
    [tags]  Regression

    Open Browser  http://localhost:8080/  chrome
    Maximise Browser Window

    Location Should Be  http://localhost:8080/
    Wait Until Element Is Visible  //span[contains(text(),'Upload CSV file')]  timeout=5
    Page Should Contains  Upload CSV file
    Press Keys  //*[@id="contents"]/div[1]/div[1]/span  RETURN
    Choose File  //input[@type='file']  /Robot-Framework/Resources/Invalid_EmployeesData.csv

    Page Should Contains  No records at the moment 😢  #As file is not uploaded, No data is inserted.
*** Keywords ***
