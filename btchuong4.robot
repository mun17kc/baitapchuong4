*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                 https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${VALID USERNAME}      Admin
${VALID PASSWORD}      admin123
${INVALID USERNAME}    kimcam
${INVALID PASSWORD}    camnee

*** Test Cases ***
Valid Login
    [Documentation]    Kiểm tra đăng nhập thành công với thông tin hợp lệ
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    name=username    timeout=10s
    Input Text    name=username    ${VALID USERNAME}
    Input Text    name=password    ${VALID PASSWORD}
    Click Button    xpath=//button[@type="submit"]
    Wait Until Page Contains Element    xpath=//h6[text()='Dashboard']    timeout=10s
    Page Should Contain Element    xpath=//h6[text()='Dashboard']
    Log To Console     Đăng nhập hợp lệ - thành công
    Sleep    8s    
    Close Browser
Invalid Login
    [Documentation]    Kiểm tra đăng nhập thất bại với thông tin không hợp lệ
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    name=username    timeout=10s
    Input Text    name=username    ${INVALID USERNAME}
    Input Text    name=password    ${INVALID PASSWORD}
    Click Button    xpath=//button[@type="submit"]
    Wait Until Page Contains    Invalid credentials    timeout=10s
    Page Should Contain    Invalid credentials
    Log To Console     Đăng nhập không hợp lệ 
    Sleep    6s    
    Close Browser
