class Ride < ApplicationRecord
  enum park: [:water, :magic_kingdom, :animal_kingdom, :studios]
  # enum allows us to
  # ride.water? = can query>
  # Ride.parks = display all parks
end
