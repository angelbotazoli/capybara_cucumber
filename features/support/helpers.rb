module Helpers

    def get_time_now
        Time.now.strftime("%Y-%m-%d %H:%M:%S")
    end

    def generate_subject
        Faker::Name.first_name + ' ' + Faker::Name.last_name
    end

end