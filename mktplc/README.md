# mktplc

Our next assignment is to design and build a two sided marketplace.
Making a pre-assignment project to make sure I'm ready. 

- User (has_many: items, orders, has_one: profile)
  - devise information (email, password)

- Profile (belongs_to :user)
  - user_id
  - first name
  - surname

- Item (belongs_to: user)
  - user_id
  - name
  - price

- Cart (belongs to: user, has_many :items through saletoitem )
  - buyer (user_id)
  - total

- ItemtoCart (belongs to :sale, belongs to :item)
  - cart_id
  - item_id  
