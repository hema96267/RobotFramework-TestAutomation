*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
*** Variables ***


*** Test Cases ***
Do a GET Request and validate the response code and response body
    [documentation]  This test case verifies that the response code of the GET Request should be 403,when invalid body schema is expected from response
    [tags]  Regression
    Create Session  getTaxRelief  http://localhost:8080/calculator/  verify=true
    ${response}=        GET On Session  getTaxRelief  taxRelief
    ${json_response}=   To Xml         ${response.content}         // expecting wrong schema of response
    log to console      ${json_response}
    Status Should Be    403             ${response}  #Check Status as 200

*** Keywords ***


