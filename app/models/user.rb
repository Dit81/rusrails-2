class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation


  validates :password, :presence     => true,
                         :confirmation => true, #для отказа пользователям, чьи пароль и подтверждение пароля не совпадают.
                         :length       => { :within => 6..40 }

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, :presence   => true,
                      :format     => { :with => email_regex },
                      :uniqueness => { :case_sensitive => false }


  before_save :encrypt_password

  def has_password?(submitted_password)
      # Compare encrypted_password with the encrypted version of
      # submitted_password.
  end

  private

     def encrypt_password
       self.encrypted_password = encrypt(password)
     end

     def encrypt(string)
       string # Only a temporary implementation!
     end



end


