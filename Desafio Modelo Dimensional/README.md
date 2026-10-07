Projeto desenvolvido como parte do desafio de modelagem dimensional do bootcamp, com a elaboração de um modelo dimensional que converte um banco relacional de uma universidade em um Star Schema. 

**Visão Geral**

O modelo foi construído a partir do diagrama relacionado fornecido pelo desafio, que apresenta o diagrama relacional de uma instituição de ensino e organiza os dados da universidade em torno do professor como objeto de analise. 

**Objetivo** 

Construir um diagrama dimensional que permita analisar a atuação dos professores considerando perspectivas como o respectivo departamento do professor, os cursos em que ele atua, além das disciplinas e os períodos de ofertas das mesmas. 

**Modelo Dimensional** 

O desafio orientava o uso de *Professor* como tabela fato, além de propor uma solução para a ausência de datas referenciais no modelo original, o que resultou na tabela dimensão *Período* em que considerei a oferta de disciplinas semestrais. As outras tabelas do tipo dimensão foram retiradas do esquema original, sendo *Departamento*, *Disciplina* e *Curso*. 

**Tabelas do modelo** 

*Professor* 

Representa o contexto central e é composta pela estrutura: 

| Campo                          | Tipo | Descrição                        |
| ------------------------------ | ---- | -------------------------------- |
| `id_professor`                 | INT  | Identificador do professor       |
| `sk_departamento`              | INT  | Chave substituta do departamento |
| `sk_disciplina`                | INT  | Chave substituta da disciplina   |
| `sk_curso`                     | INT  | Chave substituta do curso        |
| `sk_periodo_oferta_disciplina` | INT  | Período de oferta da disciplina  |
| `sk_periodo_oferta_curso`      | INT  | Período de oferta do curso       |

Claro. Abaixo está tudo já no formato **Markdown para copiar e colar no GitHub**, com uma breve descrição de cada tabela antes da tabela de campos.

*Departamento*

Armazena as informações dos departamentos da instituição, permitindo identificar o departamento, o campus ao qual pertence e seu professor coordenador.

| Campo                      | Tipo        | Descrição                                                               |
| -------------------------- | ----------- | ----------------------------------------------------------------------- |
| `sk_departamento`          | INT         | Chave substituta e identificador único do departamento                  |
| `id_departamento`          | INT         | Identificador do departamento no sistema de origem                      |
| `nome`                     | VARCHAR(45) | Nome do departamento                                                    |
| `campus`                   | VARCHAR(45) | Campus ao qual o departamento pertence                                  |
| `id_professor_coordenador` | INT         | Identificador do professor responsável pela coordenação do departamento |

---

*Disciplina*

Representa as disciplinas que fazem parte dos cursos e que podem ser ministradas pelos professores.

| Campo           | Tipo | Descrição                                            |
| --------------- | ---- | ---------------------------------------------------- |
| `sk_disciplina` | INT  | Chave substituta e identificador único da disciplina |
| `id_disciplina` | INT  | Identificador da disciplina no sistema de origem     |

---

*Curso* 

Reúne os cursos relacionados aos professores e às disciplinas, permitindo realizar análises por curso e departamento.

| Campo             | Tipo | Descrição                                                      |
| ----------------- | ---- | -------------------------------------------------------------- |
| `sk_curso`        | INT  | Chave substituta e identificador único do curso                |
| `id_curso`        | INT  | Identificador do curso no sistema de origem                    |
| `id_departamento` | INT  | Identificador do departamento ao qual o curso está relacionado |

---

*Período*

Funciona como a **dimensão de tempo** do modelo. Ela permite analisar as ofertas de disciplinas e cursos considerando diferentes períodos acadêmicos.

| Campo          | Tipo     | Descrição                                          |
| -------------- | -------- | -------------------------------------------------- |
| `sk_data`      | INT      | Chave substituta e identificador único do período  |
| `ano`          | SMALLINT | Ano correspondente ao período acadêmico            |
| `semestre`     | TINYINT  | Semestre correspondente ao período                 |
| `ano_semestre` | CHAR(6)  | Identificação do período no formato ano e semestre |
| `data_inicio`  | DATE     | Data de início do período                          |
| `data_fim`     | DATE     | Data de encerramento do período                    |

**Relacionamentos**

A tabela fato Professor possui relacionamentos com todas as dimensões:

Professor → Departamento
Professor → Disciplina
Professor → Curso
Professor → Periodo

Além disso, a dimensão Periodo é utilizada em dois contextos diferentes:

sk_periodo_oferta_disciplina → período em que a disciplina foi ofertada;
sk_periodo_oferta_curso → período em que o curso foi ofertado.

Essa utilização permite analisar diferentes eventos temporais relacionados ao contexto acadêmico.

**Código SQL**

Para estruturar o modelo, utilizei o **DBeaver** como ferramenta de desenvolvimento e o **MariaDB** como sistema gerenciador de banco de dados. A pasta do desafio contém os scripts SQL utilizados na criação do banco, além das imagens do modelo relacional utilizado como base e do modelo dimensional desenvolvido como produto final.
