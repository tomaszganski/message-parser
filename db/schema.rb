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

ActiveRecord::Schema.define(version: 20151025105047) do

  create_table "action_params", force: true do |t|
    t.integer "action_id", null: false
    t.integer "ordinal",   null: false
    t.string  "name",      null: false
  end

  add_index "action_params", ["action_id", "name"], name: "index_action_params_on_action_id_and_name", unique: true
  add_index "action_params", ["action_id", "ordinal"], name: "index_action_params_on_action_id_and_ordinal", unique: true

  create_table "actions", force: true do |t|
    t.text   "activation_message", limit: 510, null: false
    t.string "operation",                      null: false
  end

end
