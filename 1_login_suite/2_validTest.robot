*** Settings ***

Documentation           This file contains test cases related to valid login

Resource    ../Resource/base/common_functionalites.resource

Library     DataDriver      file=../Test_Data/Just_in_Data.xlsx      sheet_name=Valid_Test
Test Setup      Launch Browser and Navigate To Url
Test Teardown       Close Browser
Test Template       valid login template
*** Test Cases ***
TC1
*** Keywords ***
valid login template
    [Arguments]     ${username}     ${password}     ${expected_Header}
    Click Element    xpath=//div[@class='custom-icon custom-customer']
    Click Element    xpath=//a[normalize-space()='Sign In']
    Input Text      id:email     ${username}
    Input Password    id=pass   ${password}

    Click Element    xpath=//span[normalize-space()='Sign In']
    Click Element    xpath=//span[normalize-space()='New Arrivals']
    Element Should Contain    xpath=//span[contains(@class,'base')]    ${expected_Header}

