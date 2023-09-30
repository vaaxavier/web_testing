*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${BROWSER}                    chrome
${URL}                        https://www.amazon.com.br
${PRIME_MENU}                 (//span[contains(.,'Prime')])[3]
${ELETRONICS_MENU}            //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${ELETRONICS_HEADER}          //h1[contains(.,'Eletrônicos e Tecnologia')]
${BTN_ADD_CART}               add-to-cart-button 
${ADDED_TO_CART}              //div[@id='add-to-cart-confirmation-image']/following-sibling::div//span[contains(text(),'Adicionado ao carrinho')]/ancestor::div//div[@id='sw-all-product-variations']//span[contains(text(),'Xbox Series S')]
${BTN_GO_TO_CART}             nav-cart
${REMOVE}                     //input[contains(@value,'Excluir')]
${PRODUCT_REMOVED}           //h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')] 


*** Keywords ***
Open the Browser
    Open Browser    browser=${BROWSER} 
    Maximize Browser Window
    # options=add_experimental_option("detach", True)
    
Close the browser
    Capture Page Screenshot
    Close Browser

Access the home page of the Amazon.com.br website
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${ELETRONICS_MENU}    timeout=10s

Navigate to the "Eletrônicos" menu
    Click Element    locator=${ELETRONICS_MENU}

Verify if the phrase "${SENTENCE}" appears
    Wait Until Page Contains    text=${SENTENCE}
    Wait Until Element Is Visible    locator=${ELETRONICS_HEADER}

Verify if the page title displays "${TITLE}"
    Title Should Be    title=${TITLE}

Verify if the category "${CATEGORIE_NAME}" is displayed
    Element Should Be Visible    locator=//a[@aria-label='${CATEGORIE_NAME}']

Enter the product name "${PRODUCT}" in the search field
    Input Text    locator=twotabsearchtextbox    text=${PRODUCT}

Click on the search button
    Click Button    locator=nav-search-submit-button

Verify if the search result lists the product "${PRODUCT}"
    Wait Until Element Is Visible    locator=//h2/a/span[.='${PRODUCT}']

Add the product "${PRODUCT}" to the cart
  Click Element    locator=//h2/a/span[.='${PRODUCT}']  
  Wait Until Element Is Visible    locator=${BTN_ADD_CART}
  Click Element    locator=${BTN_ADD_CART}
  
Verify that the product "${PRODUCT}" was successfully added
   Wait Until Element Is Visible    locator=${ADDED_TO_CART} 
   Click Element    locator=${BTN_GO_TO_CART}
   Wait Until Element Is Visible    locator=(//div[@class='sc-list-item-content']//span[@class='a-truncate-cut'][contains(text(),'${PRODUCT}')])[1]

Remove the product "Console Xbox Series S" from the cart
    Click Element    locator=${REMOVE}

Verify that the cart is empty
    Wait Until Element Is Visible    ${PRODUCT_REMOVED}    timeout=10s


#***************Gherkin Scenarios***************
Given that I am on the home page of Amazon.com.br 
    Access the home page of the Amazon.com.br website

When accessing the "Eletrônicos" menu 
    Navigate to the "Eletrônicos" menu

Then the text "${SENTENCE}" should be displayed on the page
    Verify if the phrase "${SENTENCE}" appears

And the page title should be "${TITLE}" 
    Verify if the page title displays "${TITLE}"

And the category "${CATEGORIE_NAME}" should be displayed on the page
    Verify if the category "${CATEGORIE_NAME}" is displayed

When I enter "${PRODUCT}" in the search field 
    Enter the product name "${PRODUCT}" in the search field

And I click on the search button
    Click on the search button

Then I should see "${PRODUCT}" in the search results
    Verify if the search result lists the product "${PRODUCT}"

When I add "${PRODUCT}" to the cart
    Add the product "${PRODUCT}" to the cart

Then the product "${PRODUCT}" should be successfully added
    Verify that the product "${PRODUCT}" was successfully added

When I remove "Console Xbox Series S" from the cart
    Remove the product "Console Xbox Series S" from the cart

Then the cart should be empty
    Verify that the cart is empty
