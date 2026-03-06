"""
Termék oldal megnyitása - név alapján
Termék oldal megnyitása - kép alapján
Termék információk ellenőrzése - név  (ugyaz-e?)
Termék információk ellenőrzése - ár (ugyaz-e?)
Termék információk ellenőrzése - leírás        (egyáltalán megjelenik-e?)
Termék információk ellenőrzése - kép    (egyáltalán megjelenik-e?)
Vissza navigáció - Back to products gomb    
"""

*** Settings ***
Library    Selenium2Library
Library    Collections
Resource    loginkeyword.robot

*** Test Cases ***

Termekoldal megnyitas nev
    Login with valid user
    ${kulsonev}=    Get Text    //*[@id="item_4_title_link"]/div
    ${kulsoar}=    Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div
    Click Element    //*[@id="item_4_title_link"]/div
    ${belsonev}=    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${belsoar}=    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    Kulso-Belso ellenorzes nev    kulso=${kulsonev}    belso=${belsonev}
    Kulso-Belso ellenorzes ar    kulso=${kulsoar}    belso=${belsoar}
    Page Should Contain Element    //*[@id="inventory_item_container"]/div/div/div[1]/img
    Page Should Contain Element    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    Should Not Be Empty    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    Should Not Be Empty    //*[@id="inventory_item_container"]/div/div/div[1]/img
    Click Button    //*[@id="back-to-products"]
    Page Should Contain Element   //*[@id="header_container"]/div[2]/span
    Close Browser

Termekoldal megnyitas kep
    Login with valid user
    ${kulsonev}=    Get Text    //*[@id="item_4_title_link"]/div
    ${kulsoar}=    Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div
    Click Element    //*[@id="item_4_img_link"]/img
    ${belsonev}=    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${belsoar}=    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    Kulso-Belso ellenorzes nev    kulso=${kulsonev}    belso=${belsonev}
    Kulso-Belso ellenorzes ar    kulso=${kulsoar}    belso=${belsoar}
    Page Should Contain Element    //*[@id="inventory_item_container"]/div/div/div[1]/img
    Page Should Contain Element    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    Should Not Be Empty    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    Should Not Be Empty    //*[@id="inventory_item_container"]/div/div/div[1]/img
    Click Button    //*[@id="back-to-products"]
    Page Should Contain Element   //*[@id="header_container"]/div[2]/span
    Close Browser

*** Keywords ***
Kulso-Belso ellenorzes nev
    [Arguments]    ${kulso}    ${belso}
    Should Be Equal As Strings    '${kulso}'    '${belso}'    Nem ugyanaz a belső és a külső név

Kulso-Belso ellenorzes ar
    [Arguments]    ${kulso}    ${belso}
    Should Be Equal As Strings    '${kulso}'    '${belso}'    Nem ugyanaz a belső és a külső ár