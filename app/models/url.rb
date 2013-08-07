class Url < ActiveRecord::Base
  # Remember to create a migration!

  # validates :email, :presence => true, :uniqueness => true, format: { 
  #   with: /\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i, 
  #   message: "Please enter valid Email address" }

  # validates :first_name, :presence => true
  validates :long_url, :uniqueness => true, :presence => true, 
    format: { with: /\Ahttps?:\/\/.*\Z/i,
    message: "Url should start with 'http' or 'https'" }

  before_create :default_values

  def default_values
    puts "Hi, I'm checking defaults"
    self.click_counter = 0

    check = SecureRandom.hex(3)
    p check
    until Url.find_by(short_url: check) == nil
      check = SecureRandom.hex(3)
    end

    self.short_url = check
    p self.short_url
  end

end
