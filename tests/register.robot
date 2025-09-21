*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${BASE_URL}        https://robot-lab-five.vercel.app/
${BROWSER}         chrome
${VALID_PASSWORD}  Test12345
${FIRST_NAME}      tt
${LAST_NAME}       test
${EMAIL}           tests@gmail.com

*** Test Cases ***
Register Successfully
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//button[contains(@class,'nav-btn-register')]    5s
    Click Element    xpath=//button[contains(@class,'nav-btn-register')]
    Input Text    id=firstName    ${FIRST_NAME}
    Input Text    id=lastName     ${LAST_NAME}
    Input Text    id=email        ${EMAIL}
    Input Text    id=password     ${VALID_PASSWORD}
    Click Element    xpath=//button[@type='submit']
    Wait Until Page Contains    สมัครสมาชิกสำเร็จ    10s
    Capture Page Screenshot    screenshots/register_success.png
    Close Browser
