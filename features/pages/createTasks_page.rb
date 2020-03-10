require_relative 'sections'

class CreateTasksPage <SitePrism::Page
    
    section :top_menu, Sections::TopMenu, '.navbar.navbar-inverse.navbar-fixed-top'

    element set_url '/index.php?module=Tasks&action=EditView&return_module=Tasks&return_action=DetailView'

    element :txt_title,  '#content #pagecontent .moduleTitle > h2'

    element :subject, '.panel.panel-default #detailpanel_-1 .row.edit-view-row #name'    
    element :due_date, '.panel.panel-default #detailpanel_-1 .row.edit-view-row #date_due_date'
    element :priority,'.panel.panel-default #detailpanel_-1 .row.edit-view-row select[id=priority]'
    element :status, '.panel.panel-default #detailpanel_-1 .row.edit-view-row select[id=status]'

    element :btn_save, '#EditView .dcQuickEdit #SAVE'    
      
    def do_create_tasks(tbl_task)
        self.subject.set tbl_task['SUBJECT']
        self.due_date.set tbl_task['DUE_DATE']
        select_priority(tbl_task['PRIORITY'])
        select_status(tbl_task['STATUS'])
        self.btn_save.click
    end

    def select_status(status)
        self.status.find('option', text: status).select_option
    end

    def select_priority(priority)
        self.priority.find('option', text: priority).select_option
    end

    def do_edit_tasks(tbl_task)
        do_clear_field
        self.subject.set tbl_task['SUBJECT']
        self.due_date.set tbl_task['DUE_DATE']
        select_priority(tbl_task['PRIORITY'])
        select_status(tbl_task['STATUS'])
        self.btn_save.click
    end

    def do_clear_field
        self.subject.set ''
        self.due_date.set ''
    end
    
end