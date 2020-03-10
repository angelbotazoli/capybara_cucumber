#language: pt

@edit_task
Funcionalidade: Edição de Tasks no SuiteCRM
    Sendo um usuário
    Posso editar tasks no board
    Para organizar funcionalidades a serem desenvolvidas

Contexto: Acesso a tela TASK
    * acesse a tela TASK
 
    @creat_task_for_use 
    Cenario: Edição de uma task com sucesso
        Dado que seleciono a task
        Quando edito a task:
            | SUBJECT  | edicao      |
            | DUE_DATE | 01/01/2022  |
            | PRIORITY | Low         |
            | STATUS   | In Progress |
        Então verifico os dados da task