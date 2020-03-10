require_relative 'sections'

class ListTasksPage <SitePrism::Page

    section :top_menu, Sections::TopMenu, '.navbar.navbar-inverse.navbar-fixed-top'

    elements :tbl_coluna, '#MassUpdate > div.list-view-rounded-corners > table > tbody td[field=name] a'

    def select_task
        tbl_coluna.each do |key|
            sleep(5)
            if key.text.downcase.index(/#{$subject}/i) != nil
                sleep(5)
                key.click           
                break
            end
        end
    end

    def search_task         
        @result
        tbl_coluna.each do |key|
            @key = key.text
            if @key == $subject
                @result = true    
            else
                @result = false
            end             
        end
    end

end