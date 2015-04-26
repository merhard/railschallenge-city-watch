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

ActiveRecord::Schema.define(version: 20150426213348) do

  create_table "emergencies", force: :cascade do |t|
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "code"
    t.integer  "fire_severity"
    t.integer  "police_severity"
    t.integer  "medical_severity"
    t.boolean  "full_response",    default: false
    t.datetime "resolved_at"
  end

  add_index "emergencies", ["code"], name: "index_emergencies_on_code", unique: true

  create_table "responders", force: :cascade do |t|
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "name"
    t.string   "type"
    t.integer  "capacity"
    t.boolean  "on_duty",      default: false
    t.integer  "emergency_id"
  end

  add_index "responders", ["emergency_id"], name: "index_responders_on_emergency_id"
  add_index "responders", ["name"], name: "index_responders_on_name", unique: true

end
