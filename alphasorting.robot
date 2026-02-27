*** Settings ***
Library    Selenium2Library
Library    Collections
Resource    loginkeyword.robot

*** Test Cases ***
#A-Z sorting
#Z-A sorting
#Price ascending
#Price descending

Sorting Z to A
    Login with valid user
    Click Element    class:product_sort_container
    Click Element    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    ${product_names}=    Get All Product names 
    Verify Z to A    ${product_names}
    Sleep    5s
    Close Browser

Sorting A to Z
    Login with valid user
    Click Element    class:product_sort_container
    Click Element    //*[@id="header_container"]/div[2]/div/span/select/option[1]
    ${product_names}=    Get All Product names 
    Verify A to Z    ${product_names}
    Sleep    5s
    Close Browser

Price sorting ascending
    Login with valid user
    Click Element    class:product_sort_container
    Click Element    //*[@id="header_container"]/div[2]/div/span/select/option[3]
    ${product_prices}=    Get All Product names 
    Prices lowtohigh    ${product_prices}
    Sleep    5s
    Close Browser



*** Keywords ***
Get All Product names 
    ${products}=    Create List
    @{product_elements}=    Get WebElements    class:inventory_item_name
    FOR    ${element}    IN    @{product_elements}
        ${product_name}=    Get Text    ${element}
        Append To List    ${products}    ${product_name}
    END
    RETURN    @{products}

Get All Product prices
    ${products}=    Create List
    @{product_elements}=    Get WebElements    class:inventory_item_price
    FOR    ${element}    IN    @{product_elements}
        ${product_prices}=    Get Text    ${element}[1]
        Append To List    ${products}   ${product_prices}
    END
    RETURN    @{products}
    
Verify Z to A
    [Arguments]    ${product_names}
    ${lenght}=    Get Length    ${product_names}
    FOR    ${index}    IN RANGE    0    ${lenght}-1
        ${current}=    Get From List    ${product_names}    ${index}
        ${next}=    Get From List    ${product_names}    ${index+1}

        Should Be True    '${current}' >= '${next}'    Product is not in Z to A order
    END
    
Verify A to Z
    [Arguments]    ${product_names}
    ${lenght}=    Get Length    ${product_names}
    FOR    ${index}    IN RANGE    0    ${lenght}-1
        ${current}=    Get From List    ${product_names}    ${index}
        ${next}=    Get From List    ${product_names}    ${index+1}

        Should Be True    '${current}' <= '${next}'    Product is not in Z to A order
    END
    
Prices lowtohigh
    [Arguments]    ${product_prices}
    ${lenght}=    Get Length    ${product_prices}
    FOR    ${index}    IN RANGE    0    ${lenght}-1
        ${current}=    Get From List    ${product_prices}    ${index}
        ${next}=    Get From List    ${product_prices}    ${index+1}

        Should Be True    ${current} <= ${next}    Product is not low to high price order
    END
    

