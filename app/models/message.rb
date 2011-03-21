class Message < ActiveRecord::Base

belongs_to :user

validates :recipient,      :presence   => true,
                           :length     => { :within => 1..100 },
                           :format     => { :with => Authentication.email_regex, :message => Authentication.bad_email_message }
validates :subject,        :presence   => true,
                           :length     => { :within => 1..100 }
validates :text,           :length     => { :within => 1..5000 }   
      
	def initialize(keys={})
		super
		self.status ||= "new"
	end
                                                                     
	def self.search(search, user_id)
	  if search
		find(:all, :conditions => ["lower(subject) LIKE ? AND user_id = ?", "%#{search.downcase}%", user_id.to_s], :order => "created_at ASC")
	  else
		find(:all, :conditions => ["user_id = ?", user_id.to_s], :order => "created_at ASC")
	  end
	end

	def self.by_status(status, user_id)
		find(:all, :conditions => ["status = ? AND user_id = ?", status, user_id.to_s], :order => "created_at ASC")
	end
	
	def self.count_search(user_id)
		count(:all, :conditions => ["user_id = ?", user_id.to_s])
	end

	def self.count_by_status(status, user_id)
		count(:all, :conditions => ["status = ? AND user_id = ?", status, user_id.to_s])
	end
end
