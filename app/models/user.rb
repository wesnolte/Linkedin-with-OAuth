class User < ActiveRecord::Base
  attr_accessible :email, :name, :uid

  def self.find_or_create_from_auth_hash(auth_hash)
    puts 'Auth_hash: ' + auth_hash.inspect

    user = User.where(:uid => auth_hash.uid).first

    unless user
      puts 'creating user'
      user = User.create(name:auth_hash.info.name,
                          uid:auth_hash.uid)
    end

    user

  end
end
