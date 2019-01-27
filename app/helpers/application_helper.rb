module ApplicationHelper

  def flash_class(flash_type)
    { success: 'alert-success',
      error:   'alert-danger',
      alert:   'alert-warning',
      notice:  'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def get_users
  	if current_user.user_type == "admin"
      @users = User.all
      @users.each do |user|
        user.first_name =  user.first_name + ' ' + user.last_name 
      end
    end
  end
  
end
