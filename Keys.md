## Chaves no SQL

No contexto de bancos de dados relacionais, as chaves são elementos cruciais para a organização e identificação de registros em tabelas. Existem vários tipos de chaves no SQL, e as mais comuns são:

1. **Chave Primária (Primary Key - PK):**
   - Uma coluna ou conjunto de colunas que identificam exclusivamente cada registro em uma tabela.
   - Impede a entrada de valores duplicados e aceita valores nulos apenas se a tabela permitir nulos.
   - É definida quando a tabela é criada usando a cláusula `PRIMARY KEY`.

### Exemplo:
Imagine uma sala de aula onde cada estudante recebe um número único de identificação. Esse número é a chave primária, e ela assegura que cada aluno é distinto e tem um identificador único. É como se cada estudante tivesse um número de matrícula único para garantir que não haja confusão entre eles.

   Exemplo:
   ```
   CREATE TABLE Alunos (
        Matricula INT PRIMARY KEY,
        Nome VARCHAR(50)
    );
   ```

2. **Chave Estrangeira (Foreign Key - FK):**
   - Uma coluna ou conjunto de colunas que estabelece um link entre os dados de duas tabelas.
   - A coluna com a chave estrangeira geralmente corresponde à chave primária de outra tabela.
   - Ajuda a garantir a integridade referencial entre as tabelas.

### Exemplo:
Agora, imagine que além da sala de aula, há uma lista de cursos oferecidos pela escola. A chave estrangeira seria como uma referência ao número de matrícula dos alunos na tabela de cursos. Isso cria uma ligação entre as tabelas, permitindo que saibamos quais alunos estão associados a quais cursos.

   Exemplo:
   ```
   CREATE TABLE Cursos (
        CursoID INT PRIMARY KEY,
        NomeCurso VARCHAR(50)
    );

CREATE TABLE Alunos (
        Matricula INT PRIMARY KEY,
        Nome VARCHAR(50),
        CursoID INT,
        FOREIGN KEY (CursoID) REFERENCES Cursos(CursoID)
    );
   ```

3. **Chave Única (Unique Key):**
   - Semelhante à chave primária, mas permite valores nulos (apenas um valor nulo).
   - Pode ser usada para garantir que os valores em uma coluna ou conjunto de colunas sejam únicos, sem impor a restrição de não permitir valores nulos.

### Exemplo:
A chave única é como ter números de telefone em uma lista de contatos. Cada número de telefone deve ser único, mas pode haver algumas entradas sem número (ou seja, permitindo nulos). Isso garante que ninguém tenha o mesmo número de telefone, mas alguns contatos podem não ter um número cadastrado.

   Exemplo:
   ```
    CREATE TABLE Contatos (
        ContatoID INT PRIMARY KEY,
        Nome VARCHAR(50),
        NumeroTelefone INT UNIQUE
    );
   ```

4. **Chave Natural:**
   - Uma chave que ocorre naturalmente nos dados e não foi introduzida para fins de identificação.
   - Exemplos incluem números de passaporte, números de telefone, etc.

### Exemplo:
Pense em uma tabela que armazena informações sobre propriedades residenciais. Cada propriedade tem um endereço único que não foi criado para ser um identificador, mas é naturalmente único para aquela propriedade. Esse endereço pode ser considerado uma chave natural.

   Exemplo:
   ```
    CREATE TABLE Propriedades (
        Endereco VARCHAR(100) PRIMARY KEY, -- Chave Natural
        TipoPropriedade VARCHAR(50),
        NumeroQuartos INT,
        TamanhoMetroQuadrado INT
    );

   ```
Neste exemplo, o Endereco é uma chave natural, representando de forma única cada propriedade. Isso é semelhante ao endereço de uma casa na vida real, que é único para cada propriedade, mas não foi criado com o propósito específico de ser uma identificação exclusiva no banco de dados. Às vezes, a chave natural é prática e única o suficiente para servir como chave primária; no entanto, em outros casos, pode ser preferível usar uma chave artificial (como um número de identificação) para garantir uma identificação única e eficiente.

5. **Chave Candidata (Candidate Key):**
   - Uma coluna ou conjunto de colunas que podem ser usados como chave primária.
   - Em uma tabela, pode haver várias chaves candidatas, mas apenas uma será escolhida como chave primária.

### Exemplo:
Imagine que você está gerenciando uma lista de funcionários em uma empresa. Cada funcionário pode ser identificado de várias maneiras, por exemplo, por número de identificação, e-mail ou número de crachá. Todas essas formas de identificação são candidatas a serem chaves primárias. No entanto, você opta por escolher o número de identificação como a chave primária.

   Exemplo:
   ```
    CREATE TABLE Funcionarios (
        ID INT PRIMARY KEY,
        NumeroIdentificacao INT UNIQUE, -- Chave Candidata
        Email VARCHAR(50) UNIQUE, -- Chave Candidata
        NumeroCracha INT UNIQUE -- Chave Candidata
    );

   ```

6. **Chave Alternativa (Alternate Key):**
   - Uma chave candidata que não foi escolhida como chave primária.

### Exemplo: 
Suponha que você esteja gerenciando uma lista de clientes em uma loja online. Cada cliente pode ser identificado por diferentes informações, como o número do cartão de fidelidade, o endereço de e-mail ou o número de telefone. Todas essas informações são candidatas a serem chaves primárias, mas você escolhe o número do cartão de fidelidade como a chave principal. As outras informações (e-mail e número de telefone) se tornam chaves alternativas.

   Exemplo:
   ```
    CREATE TABLE Clientes (
        CartaoFidelidade INT PRIMARY KEY,
        Email VARCHAR(50) UNIQUE, -- Chave Alternativa
        NumeroTelefone VARCHAR(15) UNIQUE -- Chave Alternativa
    );


   ```
Neste exemplo, o CartaoFidelidade é escolhido como chave primária, enquanto Email e NumeroTelefone são chaves alternativas. Isso significa que cada cliente tem um número de cartão de fidelidade único, mas também podem ter um e-mail ou número de telefone exclusivo associado a eles. Essas chaves alternativas garantem diferentes formas de identificação exclusiva para os clientes, embora o número do cartão de fidelidade seja a chave primária escolhida.



Esses conceitos de chave são fundamentais para garantir a integridade dos dados e estabelecer relacionamentos entre tabelas em um banco de dados relacional.
```
