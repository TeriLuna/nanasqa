ActiveAdmin.register ChatRoom do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :slug
  #
  # or
  #
  permit_params do
    permitted = [:slug]
    permitted << :locale
    permitted
  end

  index do
    selectable_column
    column "From:" do |chat_room|
      div do
        user = User.find(chat_room.slug.split("_")[1])
        room = Room.find(chat_room.slug.split("_")[2])
        not_answered = chat_room.messages.order(created_at: :asc).last.user.present?
        text = "user: #{user.username} - room: #{room.name}"
        if not_answered
          text += " - NOT ANSWERED"
        end
        text
      end
    end
    actions
  end

  show do
    user = User.find(chat_room.slug.split("_")[1])
    h3 "From: #{user.email}"
    panel "Messages" do
      table_for resource.messages.order(created_at: :asc) do
        column(:user) do |message|
          user = User.where(id: message.user_id).first
          user.present? ? (user.username) : (h6 "Admin")
        end
        column(:content)
        column(:created_at)
      end
    end
    div do # <- Note the div
      active_admin_form_for "message", url: admin_messages_path do |f|
        f.inputs "New Message" do
          f.input :content, as: :text
          f.input :chat_room_id, :input_html => { value: chat_room.id }, as: :hidden
          f.input :user_id, :input_html => { value: 0 }, as: :hidden
        end
        f.actions
      end
    end
  end

end
