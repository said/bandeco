# -*- encoding : utf-8 -*-
class Placescategory < ActiveRecord::Base

  validates_presence_of :campusunit_id, :name, :abbreviation

  belongs_to :campusunit
end
