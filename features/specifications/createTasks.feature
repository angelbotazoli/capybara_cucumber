#language: pt

@create_task
Funcionalidade: Cadastro de Tasks no SuiteCRM
    Sendo um usuário
    Posso cadastrar tasks no board
    Para registrar funcionalidades a serem desenvolvidas

Contexto: Acesso a tela CREATE
    * faça login
            | USERNAME | will |
            | PASSWORD | will |
    * acesse a tela CREATE
 
    @create_task_success 
    Cenario: Cadastro de uma task com sucesso
        Dado que para cadastrar tasks possuo os dados:
            | SUBJECT  | newteste    |
            | DUE_DATE | 01/01/2022  |
            | PRIORITY | Low         |
            | STATUS   | In Progress |
        Quando cadastro a task
        Então verifico os dados da task

    @create_task_success_with_pageload 
    Esquema do Cenario: Cadastro de várias task com sucesso
        Dado que para cadastrar tasks possuo os dados:
            | SUBJECT      | <SUBJECT>      |
            | DUE_DATE     | <DUE_DATE>     |
            | PRIORITY     | <PRIORITY>     |
            | STATUS       | <STATUS>       |
        Quando cadastro a task
        Então verifico os dados da task
            Exemplos:
                | SUBJECT | DUE_DATE   | PRIORITY | STATUS        |
                | teste01 | 01/01/2022 | Medium   | Completed     |
                | teste02 | 01/01/2023 | Low      | Pending Input |
    
    @create_task_success_without_pageload
    Cenario: Cadastro de várias task sem pageload
        Dado que para cadastrar tasks sem pageload:
            | SUBJECT | DUE_DATE   | PRIORITY | STATUS        |
            | 111     | 01/01/2022 | Medium   | Completed     |
            | 222     | 01/01/2023 | Low      | Pending Input |
        Quando cadastro a task sem pageload
        Então valido a task cadastrada sem pageload