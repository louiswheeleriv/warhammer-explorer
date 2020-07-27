# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_27_121907) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "unit_model_statlines", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "unit_model_id", null: false
    t.integer "movement"
    t.integer "weapon_skill"
    t.integer "ballistic_skill"
    t.integer "strength"
    t.integer "toughness"
    t.integer "wounds"
    t.integer "wound_track_bottom"
    t.integer "wound_track_top"
    t.integer "attacks"
    t.integer "leadership"
    t.integer "armor_save"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["unit_model_id"], name: "index_unit_model_statlines_on_unit_model_id"
  end

  create_table "unit_models", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "unit_id", null: false
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["unit_id"], name: "index_unit_models_on_unit_id"
  end

  create_table "units", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "faction", null: false
    t.string "name", null: false
    t.string "detachment_slot", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
