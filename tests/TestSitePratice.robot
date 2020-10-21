*** Settings ***
Resource         ../resource/Resource.robot
Test Setup       Abrir navegador
Test Teardown    Fechar navegador

### SETUP - Roda keyword antes da suite ou de um teste
### TEARDOWN - Roda keywrod depois de uma suite ou de um teste

*** Variables ***



***Test Cases ***
Caso de Teste 01: Pesquisar produto existente
    Acessar a página home do site
    Digitar o nome do produto "Blouse" no campo de pesquisa
    Clicar no botão pesquisar 
    Conferir se o produto "Blouse" foi listado no site

Caso de Teste 02: Pesquisar produto não existente
    Acessar a página home do site
    Digitar o nome do produto "itemNãoExistente" no campo de pesquisa
    Clicar no botão pesquisar 
    Conferir mensagem de erro "No results were found for your search "itemNãoExistente""

Caso de Teste 03: Listar produtos
    Acessar a página home do site
    Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Clicar na subcategoria "Summer Dresses"
    Conferir se os produtos da subcategoria "Summer Dresses" foram mostrados na página

Caso de Teste 04: Adicionar produtos no carrinho
    Acessar a página home do site
    Digitar o nome do produto "t-shirt" no campo de pesquisa
    Clicar no botão pesquisar
    Clicar no botão "Add to cart" do produto
    Clicar no botão "Proceed to checkout"

Caso de Teste 05: Remover produtos
    Acessar a página home do site
    Clicar no ícone do carrinho de compras no menu superior direito
    Clicar no botão de remoção de produtos (delete) no produto do carrinho

Caso de Teste 06: Adicionar cliente
    Acessar a página home do site
    Clicar no botão superior direito "Sign in"
    Inserir um e-mail válido
    Clicar no botão "Create na account"
    Preencher os campos obrigatórios
    Clicar em "Register" para finalizar o cadastro