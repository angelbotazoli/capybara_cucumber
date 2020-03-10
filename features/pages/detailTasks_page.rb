require_relative 'sections'

class DetailTasksPage <SitePrism::Page
    
    section :top_menu, Sections::TopMenu, '.navbar.navbar-inverse.navbar-fixed-top'
      
    element :txt_title,  '#content #pagecontent .moduleTitle > h2'
    element :txt_subject, '.tab-content #tab-content-0 div:nth-child(1) #name'
    element :txt_due_date, '.tab-content #tab-content-0 div:nth-child(3) #date_due'
    element :txt_priority, '.tab-content #tab-content-0 div:nth-child(4) div[field=priority]'
    element :txt_status, '.tab-content #tab-content-0 div:nth-child(1) div[field=status]'
      
    element :mnu_actions, '#tab-actions .dropdown-toggle'
    element :mnu_edit, '.dropdown-menu #edit_button'
    element :mnu_delete, '.dropdown-menu #delete_button'

    def go_delete_tasks  
        wait_until_mnu_actions_visible    
        self.mnu_actions.click  
        wait_until_mnu_delete_visible
        self.mnu_delete.click         
    end

    def go_edit_tasks      
        self.mnu_actions.click  
        wait_until_mnu_edit_visible
        self.mnu_edit.click         
    end

    def do_delete_task
        page.driver.browser.switch_to.alert.accept
        sleep(5)
    end    

end