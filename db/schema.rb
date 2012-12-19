# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121219214531) do

  create_table "assignments", :force => true do |t|
    t.integer  "teammate_id"
    t.integer  "subteam_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.date     "start_date"
    t.date     "foreseen_end_date"
    t.date     "end_date"
  end

  add_index "assignments", ["subteam_id"], :name => "index_assignments_on_subteam_id"
  add_index "assignments", ["teammate_id", "subteam_id"], :name => "index_assignments_on_teammate_id_and_subteam_id", :unique => true
  add_index "assignments", ["teammate_id"], :name => "index_assignments_on_teammate_id"

  create_table "subteams", :force => true do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "foreseen_end_date"
    t.datetime "end_date"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "teammates", :force => true do |t|
    t.string   "eciidentifier"
    t.string   "name"
    t.string   "last_name"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "contracting_company"
    t.string   "subcontracting_company"
  end

end
