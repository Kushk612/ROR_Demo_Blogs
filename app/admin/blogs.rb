ActiveAdmin.register Blog do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :decsription, :image
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :decsription, :image]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  permit_params :title, :decsription, :image
  
  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do   
      f.input :image, as: :file
    end
    f.actions  # uploads a new file if the user wants a change
  end    
  
  show do
    attributes_table do
      row :title
      row :decsription
      row :image do |ad|
        image_tag url_for(ad.image), width: 500 if ad.image.present?
      end
      active_admin_comments
    end
  end
end
