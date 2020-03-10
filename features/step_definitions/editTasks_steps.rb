########## 1-CENARIO ##########

Quando("edito a task:") do |tbl_task|
  @tbl_task = tbl_task.rows_hash
  detail_tasks_page.go_edit_tasks
  create_tasks_page.do_create_tasks(@tbl_task)
  sleep(2)
end