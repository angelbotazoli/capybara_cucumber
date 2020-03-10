########## CONTEXTO ##########

Dado("faça login") do |tbl_login|
  @tbl_login = tbl_login.rows_hash
  login_page.load
  login_page.do_login(@tbl_login)  
end

Dado("acesse a tela CREATE") do
  create_tasks_page.top_menu.go_create_tasks
  expect(create_tasks_page.txt_title.text).to eql "CREATE" 
end

########## 1-CENARIO 2- CENARIO ##########

Dado("que para cadastrar tasks possuo os dados:") do |tbl_task|
  @tbl_task = tbl_task.rows_hash
end

Quando("cadastro a task") do
  create_tasks_page.do_create_tasks(@tbl_task)
end

Então("verifico os dados da task") do
  expect(detail_tasks_page.txt_subject.text).to eql @tbl_task['SUBJECT']
  expect(detail_tasks_page.txt_due_date.text).to start_with(@tbl_task['DUE_DATE'])
  expect(detail_tasks_page.txt_priority.text).to eql @tbl_task['PRIORITY']
  expect(detail_tasks_page.txt_status.text).to eql @tbl_task['STATUS']
end

########## 3- CENARIO ##########

Dado("que para cadastrar tasks sem pageload:") do |tbl_task|
  @tbl_task = tbl_task.hashes
end

Quando("cadastro a task sem pageload") do
  @get_task = Hash.new
  @create_tbl_task = Array.new

  @tbl_task.each do |task|
    create_tasks_page.subject.set task['SUBJECT']
    create_tasks_page.due_date.set task['DUE_DATE']
    create_tasks_page.select_priority(task['PRIORITY'])
    create_tasks_page.select_status(task['STATUS'])
    create_tasks_page.btn_save.click

    @get_task = {
      "TITLE" =>  detail_tasks_page.txt_title.text,
      "SUBJECT" => detail_tasks_page.txt_subject.text,
      "DUE_DATE" => detail_tasks_page.txt_due_date.text,
      "PRIORITY" => detail_tasks_page.txt_priority.text,
      "STATUS" => detail_tasks_page.txt_status.text  }
    
    @create_tbl_task.push(@get_task)
   
    create_tasks_page.top_menu.go_create_tasks
    expect(create_tasks_page.txt_title.text).to eql "CREATE" 
  end    
end

Então("valido a task cadastrada sem pageload") do
  @tbl_task.each do |task|
    expect(@create_tbl_task.to_s).to include task['SUBJECT']
    expect(@create_tbl_task.to_s).to include task['DUE_DATE']
    expect(@create_tbl_task.to_s).to include task['PRIORITY']
    expect(@create_tbl_task.to_s).to include task['STATUS']
  end
end