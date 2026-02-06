*** Settings ***
Library           Selenium2Library


*** Test Cases ***
SauceDemo purchase
    Open Browser    https://www.saucedemo.com/    firefox
    Input Text    locator=id=user-name    text=standard_user
    Input Password    locator=id=password    password=secret_sauce
    Click Button    //*[@id="login-button"]
    Page Should Contain Element    //*[@id="shopping_cart_container"]
    Click Button    //*[@id="add-to-cart-sauce-labs-backpack"]
    Sleep    1s
    Click Element    //*[@id="shopping_cart_container"]
    Sleep    1s
    Click Button    //*[@id="checkout"]
    Input Text    //*[@id="first-name"]    text=asadadaads
    Input Text    //*[@id="last-name"]    text=adadasd
    Input Text    //*[@id="postal-code"]    text=adadasd
    Sleep    1s
    Click Button    //*[@id="continue"]
    Sleep    1s
    Click Button    //*[@id="finish"]
    Sleep    5s
    Close Browser