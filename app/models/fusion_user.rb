class FusionUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :trackable, :validatable, :omniauthable, omniauth_providers: %i[fusion_giri]
end
