class User < ApplicationRecord
    has_secure_password
    validates :user, :email, uniqueness:  true
end
