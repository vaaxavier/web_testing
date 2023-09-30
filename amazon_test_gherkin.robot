*** Settings ***
Documentation    This test suite tests the Amazon.com.br website
Resource         amazon_resources.robot
Test Setup       Open the Browser
Test Teardown    Close the browser


*** Test Cases ***
Test Case 01 - Access to the "Eletrônicos" menu
    [Documentation]    This test verifies the "Eletrônicos" menu on the Amazon.com.br website
    ...                And it verifies the "Computadores e Informática" category
    [Tags]             menu    categories
    Given Given that I am on the home page of Amazon.com.br
    When accessing the "Eletrônicos" menu
    Then the text "Eletrônicos e Tecnologia" should be displayed on the page 
    And the page title should be "Eletrônicos e Tecnologia | Amazon.com.br" 
    And the category "Computadores e Informática" should be displayed on the page

Test Case 02 - Product Search
    [Documentation]    This test verifies the product search functionality
    [Tags]             product_search    search_list    
    Given that I am on the home page of Amazon.com.br
    When I enter "Xbox Series S" in the search field 
    And And I click on the search button
    Then I should see "Console Xbox Series S" in the search results

Test Case 03 - Add Product to Cart 
    [Documentation]     This test verifies the addition of a product to the shopping cart
    [Tags]              add_to_cart 
    Given that I am on the home page of Amazon.com.br
    When I enter "Xbox Series S" in the search field 
    And I click on the search button 
    Then I should see "Console Xbox Series S" in the search results 
    When I add "Console Xbox Series S" to the cart
    Then the product "Console Xbox Series S" should be successfully added

Test Case 04 - Remove Product from Cart
    [Documentation]     This test verifies the removal of a product from the shopping cart 
    [Tags]              remove_from_cart 
    Given that I am on the home page of Amazon.com.br
    When I enter "Xbox Series S" in the search field 
    And I click on the search button 
    Then I should see "Console Xbox Series S" in the search results 
    When I add "Console Xbox Series S" to the cart 
    Then the product "Console Xbox Series S" should be successfully added 
    When I remove "Console Xbox Series S" from the cart
    Then the cart should be empty