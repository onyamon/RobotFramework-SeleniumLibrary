*** Settings ***
Library    SeleniumLibrary
Library    String


*** Variables ***
${BASE_URL}        https://robot-lab-five.vercel.app/
${BROWSER}         chrome
${VALID_PASSWORD}  Test12345
${FIRST_NAME}      tt
${LAST_NAME}       test
${email}          tests@gmail.com
    
*** Test Cases ***
Open Browser To Register Page
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible  xpath=//button[contains(@class,'nav-btn-register')]    5s
    Click Element    xpath=//button[contains(@class,'nav-btn-register')]
    Sleep    3s
    Input Text  id=firstName    ${FIRST_NAME}
    Sleep   2s
    Input Text  id=lastName     ${LAST_NAME}
    Sleep   2s
    Input Text  id=email     ${email}
    Sleep   2s
    Input Text  id=password   ${VALID_PASSWORD}
    Sleep   2s
    Click Element    xpath=//button[@type='submit']
    Sleep   6s


Open Browser To Login Page
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible  xpath=//button[contains(@class,'nav-btn-login')]    5s
    
    Click Element    xpath=//button[contains(@class,'nav-btn-login')]
    Sleep   3s
    Input Text  id=loginEmail     ${email}
    Sleep   2s
    Input Text  id=loginPassword   ${VALID_PASSWORD}
    Sleep   2s
    Click Element    xpath=//button[@type='submit']
    Sleep   6s 


