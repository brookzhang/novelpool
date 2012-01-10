module ApplicationHelper
  
  def tabs(tabs = nil)
    tabs = [{ :active => true,:text => :tab_home,:url => { :controller => "home"           } },
              { :active => false, :text => :tab_toplist,         :url => { :controller => "toplist"          } },
              { :active => false, :text => :tab_novel,     :url => { :controller => "novels"      } },
              { :active => false, :text => :tab_zhouyi,         :url => { :controller => "zhouyis"          } },
              { :active => false, :text => :tab_zhongyi,      :url => { :controller => "zhongyis"       } },
              { :active => false, :text => :tab_comments,      :url => { :controller => "comments"       } },
              { :active => false, :text => :tab_others, :url => { :controller => "others"  } }
            ]
  end
  
end
