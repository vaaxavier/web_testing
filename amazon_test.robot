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
    Access the home page of the Amazon.com.br website
    Navigate to the "Eletrônicos" menu
    Verify if the phrase "Eletrônicos e Tecnologia" appears
    Verify if the page title displays "Eletrônicos e Tecnologia | Amazon.com.br"
    Verify if the category "Computadores e Informática" is displayed   

Test Case 02 - Product Search
    [Documentation]    This test verifies the product search functionality
    [Tags]             product_search    search_list    
    Access the home page of the Amazon.com.br website
    Enter the product name "Xbox Series S" in the search field
    Click on the search button 
    Verify if the search result lists the product "Console Xbox Series S"

Test Case 03 - Add Product to Cart 
    [Documentation]     This test verifies the addition of a product to the shopping cart
    [Tags]              add_to_cart 
    Access the home page of the Amazon.com.br website
    Enter the product name "Xbox Series S" in the search field 
    Click on the search button
    Verify if the search result lists the product "Console Xbox Series S"
    Add the product "Console Xbox Series S" to the cart 
    Verify that the product "Console Xbox Series S" was successfully added


Test Case 04 - Remove Product from Cart 
    [Documentation]     This test verifies the removal of a product from the shopping cart 
    [Tags]              remove_from_cart 
    Access the home page of the Amazon.com.br website
    Enter the product name "Xbox Series S" in the search field 
    Click on the search button
    Verify if the search result lists the product "Console Xbox Series S"
    Add the product "Console Xbox Series S" to the cart 
    Verify that the product "Console Xbox Series S" was successfully added
    Remove the product "Console Xbox Series S" from the cart
    Verify that the cart is empty
