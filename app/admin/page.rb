ActiveAdmin.register Page do

  permit_params :title, :description, :image

  show do |t|
    atrributes_table do
      row :title
      row :description
      row :image do
        page.image? ? image_tag(page.image.url, height: '100') : content_tg(:span, "No photo yet")
      end
    end
  end

  form :html=> {:enctype=>"multipart/form-data"} do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.file_field :image, hint: f.page.image? ? image_tag(page.image.url, height:'100') : content_tag(:span,"Upload JPG/PNG/GIF image")
    end
    f.actions
  end

end
