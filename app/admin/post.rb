ActiveAdmin.register Post do
  permit_params :title, :description, :image

  # show do |t|
  #   atrributes_table do
  #     row :title
  #     row :description
  #     row :image do
  #       post.image? ? image_tag(post.image.url, height: '100') : content_tg(:span, "No photo yet")
  #     end
  #   end
  # end

  filter :title

  form :html=> {:enctype=>"multipart/form-data"} do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.file_field :image, hint: f.post.image? ? image_tag(post.image.url, height:'100') : content_tag(:span,"Upload JPG/PNG/GIF image")
      actions
    end

  end

  index do
    selectable_column
    column link_to "ID" do |post|
      link_to post.id,admin_post_path(post)
    end
    column :title
    column :description, :sortable => :description do |description|
      div :class=>"ass" do
        truncate(description.description)
      end
    end
    column :created_at
    column :updated_at
    column link_to "Image File" do |post|
      post.image_file_name
    end
    # column :image_file_name
    #   actions defaults: false do |post|
    #     item "View", admin_post_path(post)
    #     item "Edit", edit_admin_post_path(post)
    #     item "Delete", admin_post_path(post), method: :delete
    # end
    actions
  end



end
