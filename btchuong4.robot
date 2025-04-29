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
    Wait Until Element Is Visible    name=username    timeout=20s
    Input Text    name=username    ${VALID USERNAME}
    Input Text    name=password    ${VALID PASSWORD}
    Click Button    xpath=//button[@type="submit"]
    Wait Until Location Contains    dashboard    timeout=20s
    Location Should Contain    dashboard
    Log To Console     Đăng nhập hợp lệ 
    Sleep    5s
    Close Browser

Invalid Login
    [Documentation]    Kiểm tra đăng nhập thất bại với thông tin không hợp lệ
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    name=username    timeout=20s
    Input Text    name=username    ${INVALID USERNAME}
    Input Text    name=password    ${INVALID PASSWORD}
    Click Button    xpath=//button[@type="submit"]
    Wait Until Page Contains    Invalid credentials    timeout=20s
    Page Should Contain    Invalid credentials
    Log To Console     Đăng nhập sai 
    Sleep    5s
    Close Browser
