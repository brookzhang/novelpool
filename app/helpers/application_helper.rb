module ApplicationHelper
  
  def tabs(tabs = nil)
    tabs = [{ :active => true,:text => :tab_dashboard,:url => { :controller => "home"           } },
              { :active => false, :text => :tab_tasks,         :url => { :controller => "tasks"          } },
              { :active => false, :text => :tab_campaigns,     :url => { :controller => "campaigns"      } },
              { :active => false, :text => :tab_leads,         :url => { :controller => "leads"          } },
              { :active => false, :text => :tab_accounts,      :url => { :controller => "accounts"       } },
              { :active => false, :text => :tab_contacts,      :url => { :controller => "contacts"       } },
              { :active => false, :text => :tab_opportunities, :url => { :controller => "opportunities"  } },
              { :active => false, :text => :tab_meetings,      :url => { :controller => "meetings"        } }
            ]
  end
  
end
