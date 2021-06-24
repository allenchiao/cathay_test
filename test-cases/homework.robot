*** Settings ***
Library  SeleniumLibrary
Resource  keyword_resources.robot

Test Setup  Setup Page
Test Teardown  Close Browser

*** Variables ***
${username}  admin
${password}  changeme

*** Test Cases ***
Login
    WHEN Input Username In Login Page  ${username}
    Input Password In Login Page  ${password}
    Click Login In Login Page

    THEN Verify Main Page Message

Logout
    GIVEN Input Username In Login Page  ${username}
    Input Password In Login Page  ${password}
    Click Login In Login Page
    Verify Main Page Message

    WHEN Click Logout When Login

    THEN Verify Login Page Message

Empty Password
    [Template]  Login with ${username}/${password} will Fail
    admin  ${EMPTY}

Wrong Password-Uppercased
    [Template]  Login with ${username}/${password} will Fail
    admin  Changeme
