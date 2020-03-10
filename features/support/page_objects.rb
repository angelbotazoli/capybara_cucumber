require_relative '../pages/sections'

module PageObjects
    
    def create_tasks_page
        CreateTasksPage.new
    end

    def detail_tasks_page
        DetailTasksPage.new
    end

    def list_tasks_page
        ListTasksPage.new
    end

    def login_page
        LoginPage.new
    end
        
end