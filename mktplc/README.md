# mktplc

Our next assignment is to design and build a two sided marketplace.
Making a pre-assignment test to make sure I'm ready. 

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

- Sale
  - seller (user_id)
  - buyer (user_id)
  - total

- SaleToItem
  - sale_id
  - item_id  
