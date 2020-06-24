***Settings***
Library         SeleniumLibrary


***Test Cases***
Validar a pesquisa do produto "Blouse"
    Open Browser                about:blank                                             chrome
    Go to                       http://automationpractice.com/index.php
    Input Text                  css:input[name='search_query']                          Blouse
    Capture Page Screenshot
    Click Button                name:submit_search
    Capture Page Screenshot
    Page Should Contain Image   xpath://*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/7/7-home_default.jpg']
    ##Page Should Contain Image   css:img[alt='Blouse']
    Capture Page Screenshot
    Sleep                       3
    Close Browser

Validar a pesquisa de um produto inexistente
    [Tags]            prod
    Open Browser                about:blank                                             chrome
    Go to                       http://automationpractice.com/index.php
    Input Text                  css:input[name='search_query']                          inexistente
    Capture Page Screenshot
    Click Button                name:submit_search
    Capture Page Screenshot
##        ${alert}=                   Get WebElement                                          css:div[id='center_column']
##        Should Contain              ${alert.text}                                           No results were found for your search "inexistente"
   Element Text Should Be      //*[@id="center_column"]//*[@class='alert alert-warning']     No results were found for your search "inexistente"
   Sleep                       3
   Close Browser
