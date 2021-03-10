ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :room_id
  #
  # or
  #
  permit_params do
    permitted = [:email, :room_id]
    permitted << :locale
    permitted
  end

  form title: 'User' do |f|
    f.inputs do
      f.input :email
      # f.input :first_name
      # f.input :last_name
      # f.input :contry
      # f.input :time_zone
      f.inputs 'Rooms' do
        f.input :room_id, as: :select, collection: Room.all.map{|u| ["#{u.description}", u.id]}
      end
    end
    f.actions
  end

end
