*** Settings ***
Documentation    This test suite tests the Amazon.com.br website
Resource         amazon_resources_gherkin.robot
Test Setup       Open Browser
Test Teardown    Close Browser


*** Test Cases ***
Test Case 01 - Access to the "Eletrônicos" menu
    [Documentation]    This test verifies the "Eletrônicos" menu on the Amazon.com.br website
    ...                And it verifies the "Computadores e Informática" category
    [Tags]             menu    categories
    Given that I am on the home page of Amazon.com.br 
    When accessing the "Eletrônicos" menu 
    Then the page title should be "Eletrônicos e Tecnologia | Amazon.com.br" 
    And the text "Eletrônicos e Tecnologia" should be displayed on the page 
    And the category "Computadores e Informática" should be displayed on the page

# Test Case 02 - Product Search
#     [Documentation]    This test verifies the product search functionality
#     [Tags]             product_search    search_list    
    