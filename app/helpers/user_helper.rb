module UserHelper

    def userCanEdit(game)
        if user_signed_in? && (current_user.is_admin || current_user == game.user)
            return true
        else
            return false
        end
    end

    def isAdmin()
        if user_signed_in? && (current_user.is_admin)
            return true
        else
            return false
        end
    end
end