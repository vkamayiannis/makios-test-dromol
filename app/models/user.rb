class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  self.sequence_name = 'USERS_SEQ'
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable
end
