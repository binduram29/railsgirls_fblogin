class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable,
        :confirmable, :lockable, :timeoutable,
        :omniauthable, omniauth_providers: [:facebook]

  def self.create_from_provider_data(provider_data)
  	binding.pry
      where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
      	binding.pry
        user.email = provider_data.info.email 
        user.password = Devise.friendly_token[0,20]
        user.skip_confirmation!
      end  
  end


   def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	    user.email = auth.info.email
	    user.provider = auth.provider
	    user.uid = auth.uid
	    user.password = Devise.friendly_token[0,20]
	  end
	end
end
