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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140103153715) do

  create_table "activities", force: true do |t|
    t.string   "name"
    t.integer  "learning_goal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_completed",     default: false, null: false
  end

  add_index "activities", ["learning_goal_id"], name: "index_activities_on_learning_goal_id"

  create_table "competences", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "european_credits", force: true do |t|
    t.integer  "amount"
    t.string   "level"
    t.integer  "competence_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "european_credits", ["competence_id"], name: "index_european_credits_on_competence_id"

  create_table "learning_goals", force: true do |t|
    t.string   "name"
    t.integer  "competence_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_completed",  default: false, null: false
  end

  add_index "learning_goals", ["competence_id"], name: "index_learning_goals_on_competence_id"

end
