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

ActiveRecord::Schema.define(:version => 20111220094134) do

  create_table "books", :force => true do |t|
    t.integer  "category_id"
    t.integer  "user_id"
    t.string   "title"
    t.string   "description"
    t.string   "keywords"
    t.string   "cover_picture_url"
    t.boolean  "author",            :default => false
    t.integer  "status",            :default => 0
    t.integer  "all_click",         :default => 0
    t.integer  "month_click",       :default => 0
    t.integer  "week_click",        :default => 0
    t.integer  "day_click",         :default => 0
    t.datetime "last_click_at"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  add_index "books", ["category_id"], :name => "index_books_on_category_id"
  add_index "books", ["user_id"], :name => "index_books_on_user_id"

  create_table "categories", :force => true do |t|
    t.integer  "parent_id",      :default => 0
    t.string   "title"
    t.string   "description"
    t.boolean  "show_on_header", :default => false
    t.integer  "sequence"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "chapters", :force => true do |t|
    t.integer  "section_id"
    t.integer  "book_id"
    t.integer  "sequence"
    t.string   "title"
    t.string   "content"
    t.boolean  "public",     :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "chapters", ["section_id"], :name => "index_chapters_on_section_id"

  create_table "comments", :force => true do |t|
    t.integer  "book_id"
    t.integer  "user_id"
    t.string   "title"
    t.string   "content"
    t.integer  "all_click",          :default => 0
    t.integer  "status"
    t.boolean  "submit_to_homepage"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "comments", ["book_id"], :name => "index_comments_on_book_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "lookups", :force => true do |t|
    t.string   "code"
    t.string   "category"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "microposts", :force => true do |t|
    t.integer  "book_id"
    t.integer  "comment_id"
    t.integer  "forked_id"
    t.integer  "user_id"
    t.string   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "microposts", ["book_id"], :name => "index_microposts_on_book_id"
  add_index "microposts", ["comment_id"], :name => "index_microposts_on_comment_id"
  add_index "microposts", ["forked_id"], :name => "index_microposts_on_forked_id"
  add_index "microposts", ["user_id"], :name => "index_microposts_on_user_id"

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "sections", :force => true do |t|
    t.integer  "book_id"
    t.string   "title"
    t.string   "description"
    t.integer  "sequence"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "sections", ["book_id"], :name => "index_sections_on_book_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "password"
    t.string   "super_password"
    t.string   "active_code"
    t.boolean  "male",           :default => true
    t.string   "description"
    t.integer  "reader_score"
    t.integer  "maxfavorite",    :default => 10
    t.integer  "maxbook",        :default => 10
    t.boolean  "admin",          :default => false
    t.boolean  "maintainer",     :default => false
    t.boolean  "author",         :default => false
    t.string   "author_name"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

end
