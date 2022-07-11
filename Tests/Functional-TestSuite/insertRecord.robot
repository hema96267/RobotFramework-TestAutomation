*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***


*** Test Cases ***

Do a POST Request and validate the response code, response body, and response headers
    [documentation]  This test case verifies that the response code of the POST Request should be 201,
    ...  the response body contains the text Created,
    ...  and the response header 'Content-Type' has the value 'application/json; charset=utf-8'.
    [tags]  Regression
    Create Session  mysession  http://localhost:8080/calculator  verify=true
    &{body}=  Create Dictionary  birthday=19071996  gender=Female  name=Hema natid=S6262926F salary=6000 tax=300
    &{header}=  Create Dictionary  Cache-Control=no-cache
    ${response}=  POST On Session  mysession  /insert  data=${body}  headers=${header}
    Status Should Be  201  ${response}  #Check Status as 201

*** Keywords ***
