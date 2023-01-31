*** Settings***
Documentation       This file contains test cases related to employee
...     records
Resource      ../Resource/base/common_functionalites.resource
Library     DataDriver      file=../Test_Data/Just_in_Data.xlsx       sheet_name=Just_in_Time

Task Setup      Launch Browser And Navigate To Url
Test Teardown       Close Browser
Test Template       Add Valid Employee Template

*** Test Cases ***
TC_${test_case}

*** Keywords ***
Add Valid Employee Template
    [Arguments]     ${username}     ${password}    ${street1}   ${street2}     ${city}      ${pincode}     ${mob}    ${expected_Line}


    Click Element    xpath=//div[@class='custom-icon custom-customer']
    Click Element    xpath=//a[normalize-space()='Sign In']
    Click Element    xpath=//input[@id='email']
    Input Text    id:email    ${username}

    Click Element    xpath=//input[@id='pass']


    Input Password    id=pass    ${password}
    Click Element    xpath=//span[normalize-space()='Sign In']

    Click Element    xpath=//span[normalize-space()='New Arrivals']


    Click Element    xpath=//*[@id="html-body"]/div[4]/div[1]/div/div/div/div/div[3]/div[2]/div/a
    Mouse Over    xpath=//span[text()='Checkout']
    Click Element    xpath=//span[normalize-space()='Checkout']



    Click Element    xpath=(//input[@class='input-text'])[6]
    Input Text    xpath=(//input[@class='input-text'])[6]    ${street1}

    Click Element    xpath=(//input[@class='input-text'])[7]
    Input Text    xpath=(//input[@class='input-text'])[7]    ${street2}

    Click Element    xpath=(//input[@class='input-text'])[10]
    Input Text    xpath=(//input[@class='input-text'])[10]    ${city}

    Click Element    xpath=(//input[@class='input-text'])[11]
    Input Text    xpath=(//input[@class='input-text'])[11]    ${pincode}

    Click Element    xpath=(//input[@class='input-text'])[12]
    Input Text    xpath=(//input[@class='input-text'])[12]    ${mob}

    Click Element    xpath=//button[@class='button action continue primary']
    Element Should Contain    xpath=//*[contains(text(),'This is a required field.')]    ${expected_Line}






    #Click Element     xpath=//div[@class="WigzoOverlayClose  WigzoCloseButton"]
