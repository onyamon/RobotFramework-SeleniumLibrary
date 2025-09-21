*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${BASE_URL}        https://robot-lab-five.vercel.app/
${BROWSER}         chrome
${VALID_PASSWORD}  Test12345
${EMAIL}           tests@gmail.com
${FIRST_NAME}      tt
${LAST_NAME}       test

*** Test Cases ***
Login Successfully
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Delete All Cookies
    Execute JavaScript    window.localStorage.clear();
    Go To    ${BASE_URL}
    Wait Until Element Is Visible    xpath=//button[contains(@class,'nav-btn-login')]    5s
    Click Element    xpath=//button[contains(@class,'nav-btn-login')]
    Input Text    id=loginEmail      ${EMAIL}
    Input Text    id=loginPassword   ${VALID_PASSWORD}
    Click Element    xpath=//button[@type='submit']
    Wait Until Page Contains    เข้าสู่ระบบสำเร็จ    10s
    Capture Page Screenshot    screenshots/login_success.png

Check Welcome Message
    ${welcome_text}=    Get Text    xpath=//h2[contains(text(),'ยินดีต้อนรับ')]
    Should Contain    ${welcome_text}    ${FIRST_NAME} ${LAST_NAME}
    Capture Page Screenshot    screenshots/welcome_message.png

Check Logout
    Wait Until Element Is Visible    xpath=//button[contains(@class,'logout-btn')]    5s
    Click Element    xpath=//button[contains(@class,'logout-btn')]
    Wait Until Page Contains    ออกจากระบบสำเร็จ    10s
    Capture Page Screenshot    screenshots/logout_success.png
    Close Browser

Check Dashboard Without Login
    Open Browser    ${BASE_URL}dashboard    ${BROWSER}
    Maximize Browser Window
    Delete All Cookies
    Execute JavaScript    window.localStorage.clear();
    Go To    ${BASE_URL}dashboard
    Wait Until Page Contains    ต้องเข้าสู่ระบบ    10s
    Capture Page Screenshot    screenshots/dashboard_without_login.png
    Close Browser
