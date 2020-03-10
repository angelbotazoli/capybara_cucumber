#language: pt

@delete_task
Funcionalidade: Exclusão de Tasks no SuiteCRM
    Sendo um usuário
    Posso excluir tasks no board
    Para organizar funcionalidades a serem desenvolvidas

Contexto: Acesso a tela TASK
    * acesse a tela TASK
 
    @creat_task_for_use 
    Cenario: Exclusão de uma task com sucesso
        Dado que seleciono a task
        Quando excluo a task
        Então não visualizo a task escluída