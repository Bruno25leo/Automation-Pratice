*** Settings ***
Library                         SeleniumLibrary
Library                         String

*** Variables ***
${URL}                          http://automationpractice.com/
${BROWSER}                      chrome
&{PESSOA}                       nome=Bruno  sobrenome=Ribeiro   senha=123456    endereco=Rua da Moeda  cidade=Recife
@{SUMMERDRESSES}                Printed Summer Dress    Printed Chiffon Dress

*** Keywords ***
Abrir navegador
    Open Browser                ${URL}    ${BROWSER}

Fechar navegador
    Close Browser

Acessar a página home do site
    Title Should Be            My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text                          name=search_query     ${PRODUTO}

Clicar no botão pesquisar
    Click Element                       name=submit_search

Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible       css=#center_column > h1
    Title Should Be                     Search - My Store
    Page Should Contain Image           xpath=//*[@id="center_column"]//*[@src="http://automationpractice.com/img/p/7/7-home_default.jpg"]
    Page Should Contain Link            xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(), "Blouse")]

Conferir mensagem de erro "${MENSAGEM_ALERTA}"
    Wait Until Element is Visible       xpath=//*[@id="center_column"]/p[@class="alert alert-warning"]
    Element Text Should Be              xpath=//*[@id="center_column"]/p[@class="alert alert-warning"]    ${MENSAGEM_ALERTA}

Passar o mouse por cima da categoria "${CATEGORIA}" no menu principal superior de categorias
    Mouse Over                          css=#block_top_menu > ul > li:nth-child(1)

Clicar na subcategoria "Summer Dresses"
    Wait Until Element Is Visible       xpath=//*[@id="block_top_menu"]//*[@title="Summer Dresses"]
    Click Element                       xpath=//*[@id="block_top_menu"]//*[@title="Summer Dresses"]

Clicar no botão "Add to cart" do produto
    Wait Until Element Is Visible       xpath=//*[@id="center_column"]//a[@title="Add to cart"]
    Click Element                       xpath=//*[@id="center_column"]//a[@title="Add to cart"]

Clicar no botão "Proceed to checkout"
    Wait Until Element Is Visible       xpath=//*[@id="layer_cart"]//a[@title="Proceed to checkout"]
    Click Element                       xpath=//*[@id="layer_cart"]//a[@title="Proceed to checkout"]

Clicar no ícone do carrinho de compras no menu superior direito
    Click Element                       css=div.shopping_cart > a[title="View my shopping cart"]

Clicar no botão de remoção de produtos (delete) no produto do carrinho
    Click Element                       css=div > a.cart_quantity_delete

Clicar no botão superior direito "Sign in"
    Click Element                       css=a.login

Inserir um e-mail válido
    Wait Until Element Is Visible       css=input#email_create
    ${EMAIL}                            Criar e-mail customizado    ${PESSOA.nome}  ${PESSOA.sobrenome}
    Input text                          css=input#email_create      ${EMAIL}

Clicar no botão "Create na account"
    Click Element                       css=#SubmitCreate

Preencher os campos obrigatórios
    Wait Until Element Is Visible       css=#customer_firstname 
    Input text                          css=#customer_firstname    ${PESSOA.nome}
    Input text                          css=#customer_lastname     ${PESSOA.sobrenome}
    Input Password                      css=#passwd                ${PESSOA.senha}
    Input text                          css=input#firstname        ${PESSOA.nome}
    Input text                          css=input#lastname         ${PESSOA.sobrenome}
    Input text                          css=#address1              ${PESSOA.endereco}
    Input text                          css=#city                  ${PESSOA.cidade}
    Select From List By Index           css=#id_state              3
    Input text                          css=input#postcode         12345
    Input text                          css=input#phone_mobile     99999-9999
 
Clicar em "Register" para finalizar o cadastro
    Click Button                        css=#submitAccount

Conferir se os produtos da subcategoria "${SUBCATEGORIA}" foram mostrados na página
    Page Should Contain Element         xpath=//*[@id="center_column"]//*[@class="cat-name"][contains(text(), "Summer Dresses")]
    Page Should Contain Element         css=#center_column a.product_img_link > img[title="${SUMMERDRESSES[0]}"]
    Page Should Contain Element         css=#center_column a.product_img_link > img[title="${SUMMERDRESSES[0]}"]
    Page Should Contain Element         css=#center_column a.product_img_link > img[title="${SUMMERDRESSES[1]}"]

Criar e-mail customizado
    [Arguments]                         ${NOME}    ${SOBRENOME}
    ${STRINGALEATORIA}                  Generate Random String
    ${EMAILVALIDO}                      Catenate    SEPARATOR=  ${PESSOA.nome}    ${PESSOA.sobrenome}    ${STRINGALEATORIA}    @brn.com
    [Return]                            ${EMAILVALIDO}