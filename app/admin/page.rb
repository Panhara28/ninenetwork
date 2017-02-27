ActiveAdmin.register Page do

  permit_params :title, :description, :image
  #
  # show do |t|
  #   attributes_table do
  #     row :title
  #     row :description
  #     row :image do
  #       page.image? ? image_tag(page.image.url, height: '100') : content_tg(:span, "No photo yet")
  #     end
  #   end
  # end

  form :html=> {:enctype=>"multipart/form-data"} do |f|
    f.inputs do
      f.input :title
      f.input :description, :as => :ckeditor
      f.file_field :image, hint: f.page.image? ? image_tag(page.image.url, height:'100') : content_tag(:span,"Upload JPG/PNG/GIF image")
    end
    f.actions
  end

  index do
    selectable_column
    column link_to "ID" do |page|
      link_to page.id,admin_page_path(page)
    end
    column :title
    column :description, :sortable => :description do |description|
      div :class=>"ass" do
        truncate(description.description)
      end
    end
    column :created_at
    column :updated_at
    column link_to "Image File" do |page|
      page.image_file_name
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
