########## CONTEXTO ##########

Dado("acesse a tela LOGIN") do
  login_page.load
end

########## 1-CENARIO ##########

Dado("que para logar possuo os dados:") do |tbl_login|
  @tbl_login = tbl_login.rows_hash
end

Quando("faço login") do
  login_page.do_login(@tbl_login)
end

Então("vejo a tela DASHBOARD com o usuário {string} logado") do |info_user|
  expect(create_tasks_page.top_menu.get_user.downcase).to start_with(info_user)
end

########## 2-CENARIO ##########

Então("vejo a tela LOGIN com a mensagem de erro:") do |message_error|
  expect(login_page.get_message_error).to eql message_error
end

########## 3-CENARIO ##########

Dado("que para tentar logar possuo os dados:") do |tbl_login|
  @tbl_login = tbl_login.hashes
end

Quando("tento logar") do
  @message_error = Array.new

  @tbl_login.each do |user|
    login_page.do_clear_field
    login_page.name.set user['USERNAME']
    login_page.password.set user['PASSWORD']
    login_page.btn_login.click
    @message_error.push(login_page.get_message_error)
  end
end

Então("vejo a tela LOGIN sem pageload com a mensagem de erro:") do |tbl_message|
  @tbl_message = tbl_message.hashes
 
  @tbl_message.each do |message|
    expect(@message_error.to_s).to include message['MESSAGE']
  end
end 