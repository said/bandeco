# -*- encoding : utf-8 -*-
class Menuscomment < ActiveRecord::Base
  attr_accessible :menu_id, :commenter, :message

  validates_presence_of :menu_id, :commenter, :message

  belongs_to :menu
end
