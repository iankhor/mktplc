class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :assign_default_role

  def hire
    add_role :staff
  end

  def reset_roles
    self.remove_role :hopper
    self.remove_role :water
    self.remove_role :staff
  end 
  
  def buy_ticket(options)
    add_role :guest
    park = options[:park]
    #add_role park if park.present? && Ride.parks.include?(park)
    add_role :hopper if options[:park] == "hopper"
    add_role :water if options[:park] == "water"
  end

  private

    def assign_default_role
      add_role(:citizen) if roles.blank?
    end       
end
