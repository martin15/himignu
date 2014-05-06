# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


himignu = Information.find_or_create_by_name(:name => "Himignu", :content => "himignu")
puts himignu.inspect

gxnu = Information.find_or_create_by_name(:name => "Guangxi Normal University",
                                          :content => "Guangxi Normal University")
puts gxnu.inspect

guilin = Information.find_or_create_by_name(:name => "Guilin", :content => "guilin")
puts guilin.inspect

ppit = Information.find_or_create_by_name(:name => "PPIT", :content => "PPIT")
puts ppit.inspect

short_ppit = Information.find_or_create_by_name(:name => "Short PPIT", :content => "Short PPIT")
puts short_ppit.inspect

admin = User.find_or_create_by_email( :email => "martin.me15@yahoo.com", :name => "Martin",
                                        :phone_number =>'15697733837',
                                        :religion => "cristian", :password => "1qazse4rfv",
                                        :password_confirmation => "1qazse4rfv")
puts admin.inspect
