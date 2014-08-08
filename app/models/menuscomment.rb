# -*- encoding : utf-8 -*-
class Menuscomment < ActiveRecord::Base

  validates_presence_of :menu_id, :commenter, :message

  belongs_to :menu
end
