ActiveAdmin.register Message do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :content, :chat_room_id, :user_id
  #
  # or
  #
  permit_params do
    permitted = [:content, :chat_room_id, :user_id]
    permitted << :locale
    permitted
  end

end
