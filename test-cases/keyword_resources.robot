*** Variable ***
${test_page_url}  http://localhost:9898

${login_page_title}  Login Page
${login_page_message_title}  Login Page
${login_page_message_body}  Please input your user name and password and click the login button.

${main_page_message_title}  Welcome Page
${main_page_message_body}  Login succeeded. Now you can logout.

${error_page_message_title}  Error Page
${error_page_message_body}  Login failed. Invalid user name and/or password.


*** Keywords ***
Setup Page
    Create Webdriver  Chrome
    GO TO  ${test_page_url}
    Verify Login Page Message

Verify Login Page Message
    Wait Until Page Contains  ${login_page_message_title}
    Wait Until Page Contains  ${login_page_message_body}
    Title Should Be  ${login_page_message_title}

Verify Main Page Message
    Wait Until Page Contains  ${main_page_message_title}
    Wait Until Page Contains  ${main_page_message_body}

Input Username In Login Page
    [Arguments]  ${input}
    Input Text  id:username_field  ${input}

Input Password In Login Page
    [Arguments]  ${input}
    Input Password  id:password_field  ${input}

Click Login In Login Page
    Click Element  id:login_button

Click Logout When Login
    Click Element  xpath://a[@href='.'][text()='logout']

Login with ${username}/${password} will Fail
    Input Username In Login Page  ${username}
    Input Password In Login Page  ${password}
    Click Login In Login Page
    Verify Error Message

Verify Error Message
    Wait Until Page Contains  ${error_page_message_title}
    Wait Until Page Contains  ${error_page_message_body}
