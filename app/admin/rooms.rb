ActiveAdmin.register Room do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :description, :max_people, :price_per_person, :number_of_beds
  #
  # or
  #
  permit_params do
    permitted = [
      :description,
      :max_people,
      :price_per_person,
      :number_of_beds,
      :name,
      :main_image,
      user_ids: [],
      images: []
    ]
    permitted << :locale
    permitted
  end

  form title: 'Room' do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :max_people
      f.input :price_per_person
      f.input :number_of_beds
      f.inputs 'Users' do
        f.input :user_ids, as: :select, multiple: true, label: "Users", collection: User.all.map{|u| ["#{u.email} ", u.id]}
      end
      f.inputs 'Images' do
        f.input :main_image, as: :file
        f.input :images, as: :file, input_html: { multiple: true }
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :max_people
      row :price_per_person
      row :number_of_beds
      row :users do |resource|
        table_for resource.users do
          column do |user|
            link_to user.email, admin_user_path(user.id)
          end
        end
      end
      row :images do
        div do
          room.images.each do |img|
            div do
              image_tag url_for(img), size: "300x100"
            end
          end
        end
      end
      row :created_at
      row :updated_at
    end
  end
end
