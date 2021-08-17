require_relative '../setup'
# require 'active_record'

puts 'Exercise 1'
puts '----------'

# Your code goes below here ...
# create the "Store" model automagically linked to the database table "stores" via activerecord
# database created in setup via activerecord
class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: { minimum: 2 }
  validates :annual_revenue, numericality: { only_integer: true, greater_than: 0 }
end

class Employee < ActiveRecord::Base
  belongs_to :store
  validates :first_name, :last_name, presence: true
  validates :hourly_rate, numericality: { only_integer: true, greater_than: 40, less_than: 200 }
  validates_associated :store
end

# use the class model to query the database with active connection supplied via setup
Store.create(name: "Burnaby", annual_revenue: 300_000, mens_apparel: true, womens_apparel: true)

Store.create(name: "Richmond", annual_revenue: 1_260_000, mens_apparel: false, womens_apparel: true)

Store.create(name: "Gastown", annual_revenue: 190_000, mens_apparel: true, womens_apparel: false)

puts Store.count

