module Sections

    class TopMenu <SitePrism::Section

        element :txt_user, '#with-label span:nth-child(2)'

        element :mnu_logout, '.dropdown.nav.navbar-nav.globalLinks-desktop.open ul > li:nth-child(5) #logout_link'
        element :mnu_create, '.desktop-bar #toolbar #quickcreatetop'
        element :mnu_create_tasks, '.create.dropdown.nav.navbar-nav.quickcreatetop.open ul > li:nth-child(7) a'
        element :mnu_activities, '.container-fluid .desktop-toolbar ul > li:nth-child(6) .notCurrentTab #grouptab_3'
        element :mnu_tasks, '.dropdown-menu li:nth-child(1)'
   
        def get_user
            @user = self.txt_user.text       
        end 

        def do_logout
            self.txt_user.click
            wait_until_mnu_logout_visible
            self.mnu_logout.click        
        end  

        def go_create_tasks
            wait_until_mnu_create_visible        
            self.mnu_create.click  
            wait_until_mnu_create_tasks_visible
            self.mnu_create_tasks.click         
        end      

        def go_list_tasks
            wait_until_mnu_activities_visible
            self.mnu_activities.hover
            wait_until_mnu_tasks_visible
            sleep(5)
            self.mnu_tasks.click
        end
        
    end 
       
end