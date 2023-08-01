------------------- BANCO DE DADOS: BIBLIOTECA ---------------------

Com intuito de estudar o MySQL, foi criado a modelagem de um banco de dados para uma biblioteca. Para isso, utilizei o db.diagram para uma modelagem inicial, depois indo para o MySQL para ajustes e população de registros em sua grande maioria ficticios utilizando o site GeradorNV.

Foram criadas as entidades:

1- Livros: com suas colunas nome, genero, quantidade de páginas, disponibilidade e chaves estrangeiras.

2- Autores: com uma chave primaria utilizada como chave estrangeira na tabela livros. Tem também as colunas de quantidade de livros e uma chave estrangeira.

3- Pessoas: onde guardará as informação de nome, cpf, data de nascimento, nacionalidade, email dos usuarios e autores. Com uma chave estrangeira.

4- Usuario: onde estará registrado as senhas dos usuarios.

5- Editoras: com as colunas de nome, nome fantasia, cnpj euma chave estrangeira.

6- Endereço: onde ficará registrado cep,rua,numero,complemento,bairro,cidade,estado e pais, não só dos usuarios, como dos autores e editoras.

Cada entidade possui sua própria chave primaria.

--------------- Para utilização -----------------

Os diagramas, tanto o que foi feito no db.diagram, quando o do próprio MySQL podem ser encontrados na pasta Model em formato png.

Faça o download do MySQL Workbench e execute os arquivos presentes na pasta scripts, sendo o biblioteca_modelo sendo a criação do banco e das tabelas, e registros_biblioteca tendo as populações dos registros.

---- Agradecimento ----

Obrigado aos meus colegas e facilitador que estiveram me auxiliando nesse projeto.
