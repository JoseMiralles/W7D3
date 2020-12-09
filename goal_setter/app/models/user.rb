class User < ApplicationRecord

    attr_reader :password

    validates :username, :password_digest, :session_token, presence: true
    validates :username, :session_token, uniqueness: true
    validates :password, length: {minimum: 6}, allow_nil: true

    def password=(pass)
        @password = pass
        self.password_digest = BCrypt::Password.create(pass)
    end

    def is_password?(pass)
        BCrypt::Password.new(self.password_digest).is_password?(pass)
    end

    after_initialize :ensure_session_token!

    def ensure_session_token!
        self.session_token ||= self.class.generate_session_token
    end

    private

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

end