class User < ActiveRecord::Base

  validates :email,
            :uniqueness => true,
            :length => {:within => 5 .. 50},
            :format => {:with => /^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$/}
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :user_name, :presence => true
  validates :password,
            :presence => true,
            :confirmation => true,
            :format => {:with => /^(?=.*\d)(?=.*([a-z]|[A-Z]))([\x20-\x7E]){8,40}$/}

  has_many :comments
  has_many :comment_threads

end
