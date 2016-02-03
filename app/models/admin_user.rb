class AdminUser < ActiveRecord::Base

  
  #self.table_name = "admin_users"
  #(To configure a different table name than the model specifies)

  has_and_belongs_to_many :pages
  has_many :section_edits
  has_many :sections, :through => :section_edits

end
