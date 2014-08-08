# -*- encoding : utf-8 -*-
class Place < ActiveRecord::Base

  validates_presence_of :placescategory_id, :name, :address, :latitude, :longitude

  belongs_to :placescategory
end
