*** Settings ***
Library    Selenium2Library

*** Keywords ***
Login with valid user
    Open Browser    https://www.saucedemo.com/    chrome
    Input Text    locator=id=user-name    text=standard_user
    Input Password    locator=id=password    password=secret_sauce
    Click Button    //*[@id="login-button"]