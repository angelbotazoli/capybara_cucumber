class LoginPage <SitePrism::Page

    set_url '/index.php?action=Login&module=Users'

    element :name, '#user_name'
    element :password, '#username_password'

    element :btn_login, '#bigbutton'
    
    element :txt_message_error, '#loginform #form .error:nth-child(4)'

    def do_login(tbl_login)
        self.name.set tbl_login['USERNAME']
        self.password.set tbl_login['PASSWORD']
        self.btn_login.click
    end

    def do_clear_field
        self.name.set ''
        self.password.set ''
    end

    def get_message_error
        self.txt_message_error.text
    end
 
end