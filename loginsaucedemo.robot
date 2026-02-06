*** Settings ***
Library           Selenium2Library


*** Test Cases ***
Open SauceDemo firefox
    Open Browser    https://www.saucedemo.com/    firefox
    Input Text    locator=id=user-name    text=standard_user
    Input Password    locator=id=password    password=secret_sauce
    #Click Button    locator=id=login-button
    Click Button    //*[@id="login-button"]
    Page Should Contain Element    //*[@id="shopping_cart_container"] 
    Sleep    5s
    Close Browser


Login with standard_user wrong password
    Open Browser    https://www.saucedemo.com/    firefox
    Input Text    locator=id=user-name    text=standard_user
    Input Password    locator=id=password    password=wrong_password
    #Click Button    locator=id=login-button
    Click Button    //*[@id="login-button"]
    Page Should Not Contain Element    //*[@id="shopping_cart_container"] 
    Sleep    5s
    Close Browser

Login with wrong username and valid password
    Open Browser    https://www.saucedemo.com/    firefox
    Input Text    locator=id=user-name    text=wrong_user
    Input Password    locator=id=password    password=secret_sauce
    #Click Button    locator=id=login-button
    Click Button    //*[@id="login-button"]
    Page Should Not Contain Element    //*[@id="shopping_cart_container"] 
    Sleep    5s
    Close Browser

Login without username
    Open Browser    https://www.saucedemo.com/    firefox
    Input Text    locator=id=user-name    text=
    Input Password    locator=id=password    password=secret_sauce
    #Click Button    locator=id=login-button
    Click Button    //*[@id="login-button"]
    Page Should Not Contain Element    //*[@id="shopping_cart_container"] 
    Sleep    5s
    Close Browser

Login without password
    Open Browser    https://www.saucedemo.com/    firefox
    Input Text    locator=id=user-name    text=standard_user
    Input Password    locator=id=password    password=
    #Click Button    locator=id=login-button
    Click Button    //*[@id="login-button"]
    Page Should Not Contain Element    //*[@id="shopping_cart_container"] 
    Sleep    5s
    Close Browser
