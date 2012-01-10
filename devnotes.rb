set HTTP_PROXY=http://172.30.4.63:3128

rails new novelpool
git init
git add .
git commit -am "init"
# github.com create new repotery
git remote add origin https://brookzhang@github.com/brookzhang/novelpool.git
git push -u origin master


rails g migration initdatabase
rake db:migrate
rails g controller Pages
rails destroy controller Pages
rails g controller Pages home toplist about help
# edit routes


ge

git config branch.master.remote origin
git config branch.master.merge refs/heads/master

git branch -m master development 
git branch -m published master 
git push origin master 




#========================================================== user from 20110714 to 20110914
#[users] &&
id
email                 varchar(50)
name                  nvarchar(50)     
password              varchar(50)
encrypted_password    varchar(50)
salt                  varchar(50)
active_code           varchar(50)          #active accout by email, 1=actived
male                  boolean 
description           nvarchar(500)
reader_score          integer     comment+10,post+1
maxfavorite           integer     default=10 ,消耗积分,增加额度
maxbook               integer     最多可以創建的book數量,默認10,向admin申请增加 (默认值直接写在user表里不好,以后改为全局设定,这里只保存超出的值)
admin                 boolea      administrators,
maintainer            boolean     可添加非原著书,不受maxbook限制
author                boolean     可以同时是 admin ,maintainer,author.  author&maintainer使用同一后台,只是可以改作者名
author_name           nvarchar(50)

#[relationships] &&
id
follower_id           integer
followed_id           integer



#[microposts] &&   小谈
id
book_id               integer
comment_id            integer     (could be removed by comment  owner) 
forked_id             integer     forked from others micropost id
user_id               integer  
content               nvarchar(366)


#[favorites] 
id
book_id               integer    
chapter_id            integer         章節ID (第一次收藏,記錄第一節. 閱讀時,記錄當前章節)
user_id               integer
score                 integer         coment+10 ,micropost+1 , chapterclick+1  ,clear after removed from favorite
last_read_at          datetime  



#==========================================================book
#[categories]
id
parent_id             integer
title                 nvarchar(50)
description           nvarchar(500)
show_on_header        boolean
sequence              int

#[books]
id
category_id           int
user_id               int
title                 nvarchar(50)
description           nvarchar(500)
keywords              nvarchar(50)
cover_picture_url     varchar(100)
author                boolean 只有maintainer可以单独设定,其他自动关联users.author_name
status                tinyint 0-ongoing 1-end 2-pending
all_click             int
month_click           int
week_click            int
day_click             int
last_click_at         datetime  

#[sections]   分卷
id                    int
book_id               int
title                 nvarchar(50)
description           nvarchar(500)
sequence              int

#[chapters]  
id  
book_id               int
section_id            int 
sequence              int        
title                 nvarchar (50) 
content               ntext   
public                boolean         是否公开


#[comments] only for books in favorites  书评
id
book_id               integer 
user_id               integer  
title                 nvarchar(50)
content               nvarchar(4000)
all_click             integer
status                integer         1，book固顶，4，锁定 (by author)
submit_to_homepage    boolean

#========================================================== site 
#[lookups]
id
code                  varchar(50)
category              varchar(50)
description           nvarchar(500)

SiteName                  站點名稱
SiteKeyWord               關鍵字
SiteContact               聯繫方式
SiteAbout                 站點說明,放在底部
SiteBak                   網站備案信息
bodystyle                 主站默認風格
bookstyle                 讀書頁面默認風格

#==========================================================plan
1.淡化阅读,强化读者交互
2.只可以对添加到收藏的书发表评论.评论可以被跟帖post,post可以被移除出此评论,
3.microposts可以被fork,可以作为comment的跟帖, 也可以作为对book的单独microposts但不列在book页面(只显示数量,可在单独页面查看),只显示给follower
4.user可以互相follow,个人页面可以看到followed user的microposts,comment, favorite book的最后更新





