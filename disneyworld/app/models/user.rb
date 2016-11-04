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
    remove_role :hopper
    remove_role :water
    remove_role :staff
    remove_role :magic_kingdom
  end 
  
  def buy_ticket(options)
    add_role :guest
    park = options[:park]
    add_role park if park.present? && Ride.parks.include?(park)
    add_role :hopper if options[:park] == "hopper"
    add_role :water if options[:park] == "water"
    add_role :magic_kingdom if options[:park] == "magic_kingdom"
  end

  private

    def assign_default_role
      add_role(:citizen) if roles.blank?
    end       
end
