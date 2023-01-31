*** Settings ***
Documentation       This file contains test cases related to invalid login
Resource        ../Resource/base/common_functionalites.resource

Library     DataDriver      file=../Test_Data/Just_in_Data.xlsx       sheet_name=Invalid_Test
Task Setup   Launch Browser And Navigate To Url
Test Teardown       Close Browser
Test Template       Invalid Login Template
*** Test Cases ***
TC1
*** Keywords ***
Invalid Login Template

    [Arguments]     ${username}     ${password}     ${expected_error}
    Click Element    xpath=//div[@class='custom-icon custom-customer']
    Click Element    xpath=//a[normalize-space()='Sign In']
    Input Text      id:email     ${username}
    Input Password    id=pass   ${password}
    Click Element    xpath=//span[normalize-space()='Sign In']
    Element Should Contain    xpath=//div[@data-bind='html: $parent.prepareMessageForHtml(message.text)']    ${expected_error}