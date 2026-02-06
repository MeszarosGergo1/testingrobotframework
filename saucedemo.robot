*** Settings ***
Library           Selenium2Library


*** Test Cases ***
Open SauceDemo firefox
    Open Browser    https://www.saucedemo.com/    firefox
    Sleep    5s
    Close Browser
    
Open SauceDemo chrome
    Open Browser    https://www.saucedemo.com/    chrome
    Sleep    5s
    Close Browser