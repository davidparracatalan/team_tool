# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Teammate.create(eciidentifier: '78463544',
                name: 'David',
                last_name: 'Parra Catalan',
                contracting_company: 'ECI')
Teammate.create(eciidentifier: 'X12345LA',
                name: 'Jack',
                last_name: 'O\'Lantern',
                contracting_company: 'Expensive & Thrilling LTD.',
                contracting_company: 'Poor & Noble Co.')
Subteam.create(name: 'Pasta store',
               start_date: Time.now,
               foreseen_end_date: 45.days.from_now)
Subteam.create(name: 'A really difficult enterprise', 
               start_date: 7.days.from_now,
               foreseen_end_date: 100.days.from_now)
Subteam.create(name: 'We thought it was going to be much more easy, but we are suffering just like being in hell',
               start_date: 20.days.ago,
               foreseen_end_date: 21.days.ago)
