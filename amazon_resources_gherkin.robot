*** Settings ***
Library    SeleniumLibrary
Resource   amazon_resources.robot


*** Variables ***
${BROWSER}                    chrome
${URL}                        https://www.amazon.com.br
${PRIME_MENU}                 (//span[contains(.,'Prime')])[3]
${ELETRONICS_MENU}            //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${ELETRONICS_HEADER}          //h1[contains(.,'Eletrônicos e Tecnologia')]


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
    Wait Until Element Is Visible    locator=${ELETRONICS_MENU}

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
    Wait Until Element Is Visible    locator=(//span[contains(.,'${PRODUCT}')])[2]


 

#  GHERKIN STEPS

Given that I am on the home page of Amazon.com.br 
    Access the home page of the Amazon.com.br website

 When accessing the "Eletrônicos" menu 
    Navigate to the "Eletrônicos" menu

Then the page title should be "Eletrônicos e Tecnologia | Amazon.com.br" 
    Verify if the phrase "Eletrônicos e Tecnologia" appears

And the text "Eletrônicos e Tecnologia" should be displayed on the page 
    Verify if the page title displays "Eletrônicos e Tecnologia | Amazon.com.br"


And the category "Computadores e Informática" should be displayed on the page
    Verify if the category "Computadores e Informática" is displayed   

