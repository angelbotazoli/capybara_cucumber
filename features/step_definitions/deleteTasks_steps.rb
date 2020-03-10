########## CONTEXTO ##########

Dado("acesse a tela TASK") do
  detail_tasks_page.top_menu.go_list_tasks
  sleep(5)
end

########## 1-CENARIO ##########

Dado("que seleciono a task") do
  list_tasks_page.select_task
end

Quando("excluo a task") do
  detail_tasks_page.go_delete_tasks
  detail_tasks_page.do_delete_task
end

Então("não visualizo a task escluída") do
  list_tasks_page.search_task
end