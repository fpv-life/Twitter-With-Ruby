module FeedHelper
    def check_login
        if user_signed_in?
            link_to('Logout', destroy_user_session_path, class: 'nav-link')
        else
            link_to('Login', new_user_session_path, class: 'nav-link')
        end
    end
end
