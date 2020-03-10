#language: pt

@login
Funcionalidade: Login no SuiteCRM
    Sendo um usuário
    Posso logar no SuiteCRM
    Para ter acesso aos recursos que o sistema disponibiliza

Contexto: Acesso a tela LOGIN
    * acesse a tela LOGIN

    @logout @login_success  
    Cenario: Login com sucesso
        Dado que para logar possuo os dados:
            | USERNAME | will |
            | PASSWORD | will |
        Quando faço login
        Então vejo a tela DASHBOARD com o usuário "will" logado 

    @login_invalid_with_pageload @login_invalid    
    Esquema do Cenario: Tentativa de login com pageload    
        Dado que para logar possuo os dados:
            | USERNAME | <USERNAME> |
            | PASSWORD | <PASSWORD> |
        Quando faço login
        Então vejo a tela LOGIN com a mensagem de erro:
        """
        <MESSAGE>
        """
            Exemplos:
                | USERNAME | PASSWORD | MESSAGE                                         |
                | 111      | 111      | You must specify a valid username and password. |
                | 222      | 222      | You must specify a valid username and password. |

    @login_invalid_without_pageload @login_invalid 
    Cenario: Tentativa de login sem pageload
        Dado que para tentar logar possuo os dados:
            | USERNAME | PASSWORD | 
            | 111      | 111      |
            | 222      | 222      |
        Quando tento logar
        Então vejo a tela LOGIN sem pageload com a mensagem de erro:
            | MESSAGE                                         |
            | You must specify a valid username and password. |
            | You must specify a valid username and password. |