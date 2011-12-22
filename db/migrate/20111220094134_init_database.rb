class InitDatabase < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :password
      t.string :super_password
      t.string :active_code
      t.boolean :male ,:default=>true
      t.string :description
      t.integer :reader_score
      t.integer :maxfavorite,:default=>10
      t.integer :maxbook,:default=>10
      t.boolean :admin ,:default=>false
      t.boolean :maintainer,:default=>false
      t.boolean :author,:default=>false
      t.string :author_name
      t.timestamps
    end
    
    
    create_table :microposts do |t|
      t.integer :book_id
      t.integer :comment_id
      t.integer :forked_id
      t.integer :user_id
      t.string :content
      t.timestamps
    end
    add_index :microposts, :book_id
    add_index :microposts, :comment_id
    add_index :microposts, :forked_id
    add_index :microposts, :user_id
    
    
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :followed_id
      t.timestamps
    end
    add_index :relationships, :follower_id
    add_index :relationships, :followed_id
    
    
    create_table :categories do |t|
      t.integer :parent_id ,:default=>0
      t.string :title
      t.string :description
      t.boolean :show_on_header ,:default=>false
      t.integer :sequence
      t.timestamps
    end
    
    
    create_table :books do |t|
      t.integer :category_id          
      t.integer :user_id              
      t.string :title                
      t.string :description           
      t.string :keywords             
      t.string :cover_picture_url     
      t.boolean :author,:default=>false
      t.integer :status,:default=>0
      t.integer :all_click,:default=>0
      t.integer :month_click,:default=>0
      t.integer :week_click,:default=>0
      t.integer :day_click,:default=>0
      t.datetime :last_click_at
      t.timestamps
    end
    add_index :books , :user_id
    add_index :books , :category_id
    
    
    create_table :sections do |t|
      t.integer :book_id
      t.string :title
      t.string :description
      t.integer :sequence
      t.timestamps
    end
    add_index :sections,:book_id
    
    
    create_table :chapters do |t|
      t.integer :section_id
      t.integer :book_id
      t.integer :sequence
      t.string :title
      t.string :content
      t.boolean :public,:default=>true
      t.timestamps
    end
    add_index :chapters,:section_id
    
    
    create_table :comments do |t|
      t.integer :book_id
      t.integer :user_id
      t.string :title
      t.string :content
      t.integer :all_click,:default=>0
      t.integer :status
      t.boolean :submit_to_homepage
      t.timestamps
    end
    add_index :comments,:book_id
    add_index :comments,:user_id
    
    
    create_table :lookups do |t|
      t.string :code
      t.string :category
      t.string :description
      t.timestamps
    end
    
    
    
    
  end

  def down
    drop_table :users
    drop_table :microposts
    drop_table :relationships
    drop_table :categories
    drop_table :books
    drop_table :sections
    drop_table :chapters
    drop_table :comments
    drop_table :lookups
  end
end
