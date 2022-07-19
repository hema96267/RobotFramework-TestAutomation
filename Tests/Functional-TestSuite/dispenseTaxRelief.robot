*** Settings ***
Library  SeleniumLibrary

*** Variables ***


*** Test Cases ***
 [documentation]  This test case verifies that a Governor can successfully dispense the tax Relief to the employees
    [tags]  Regression

    Open Browser  http://localhost:8080/  chrome
    Maximise Browser Window

    Location Should Be  http://localhost:8080/

    Alert Should Not Be Present

    Wait Until Element Is Visible  //a[contains(text(),'Dispense Now')]  timeout=5
    Page Should Contains  Dispense Now
    Element Should Be Visible   //a[contains(text(),'Dispense Now')]
    Element Text Should Be  //a[contains(text(),'Dispense Now')]  timeout=5
    Press Keys  //a[contains(text(),'Dispense Now')]  RETURN
    Wait Until Page Contains    Cash dispensed

*** Keywords ***
