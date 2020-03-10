After('@logout') do
    create_tasks_page.top_menu.do_logout
end

After do    
    if File.exist?("features/reports/report.html")       
        File.rename("features/reports/report.html","features/reports/report_#{get_time_now}.html")        
    end
end

After do |scenario|  
    @file_name = scenario.name.gsub(' ','_').downcase  

    def link_evidence(status)
        status = status                  
        directory = "features/reports/screenshots_scenario_#{status}/#{@file_name}_#{get_time_now}.png"
        page.save_screenshot(directory)
        embed(directory, 'image/png','Clique para aqui para ver a evidência')
    end

    if scenario.failed?  
        status = "failed"
        link_evidence(status)
    else      
        status = "passed"  
        link_evidence(status)
    end
end


Before('@creat_task_for_use') do
    $subject = generate_subject
    steps %{
        * faça login
        | USERNAME | will |
        | PASSWORD | will |
        * acesse a tela CREATE
        Dado que para cadastrar tasks possuo os dados:
            | SUBJECT  | #{$subject}   |
            | DUE_DATE | 01/01/2022    |
            | PRIORITY | Low           |
            | STATUS   | In Progress   |
        Quando cadastro a task
        Então verifico os dados da task
    }
end