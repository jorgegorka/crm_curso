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

ActiveRecord::Schema.define(:version => 20111218161658) do

  create_table "categories", :force => true do |t|
    t.string   "name",       :limit => 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id", "commentable_type"], :name => "index_comments_on_commentable_id_and_commentable_type"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["name"], :name => "index_companies_on_name"

  create_table "items", :force => true do |t|
    t.integer  "task_id"
    t.string   "title",      :limit => 100
    t.integer  "position",                  :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "completed",                 :default => false
  end

  add_index "items", ["task_id", "position"], :name => "index_items_on_task_id_and_position"

  create_table "people", :force => true do |t|
    t.integer  "company_id"
    t.string   "name",       :limit => 100
    t.string   "title",      :limit => 150
    t.text     "details"
    t.string   "twitter",    :limit => 30
    t.string   "linkedin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "people", ["company_id"], :name => "index_people_on_company_id"
  add_index "people", ["name"], :name => "index_people_on_name"

  create_table "tasks", :force => true do |t|
    t.integer  "category_id"
    t.integer  "user_id"
    t.string   "title"
    t.date     "finished_on"
    t.boolean  "public",      :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["category_id"], :name => "index_tasks_on_category_id"
  add_index "tasks", ["user_id"], :name => "index_tasks_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.integer  "level",                                    :default => 1
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
