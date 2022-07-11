*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***


*** Test Cases ***

Do a POST Request with invalid request body and validate the response code, response body, and response headers
    [documentation]  This test case verifies that the response code of the POST Request should be 403,
    ...  when the data in request body is invalid,by sending invalid data type to date of birth attribute.
    [tags]  Regression
    Create Session  mysession  http://localhost:8080/calculator  verify=true
    &{body}=  Create Dictionary  birthday=abcdef  gender=Female  name=Hema natid=S6262926F salary=6000 tax=300
    &{header}=  Create Dictionary  Cache-Control=no-cache
    ${response}=  POST On Session  mysession  /insert  data=${body}  headers=${header}
    Status Should Be  403  ${response}  #Check Status as 403

*** Keywords ***
