# -*- encoding : utf-8 -*-
class Placescategory < ActiveRecord::Base
  attr_accessible :campusunit_id, :name, :abbreviation
  
  validates_presence_of :campusunit_id, :name, :abbreviation
  
  belongs_to :campusunit
end
