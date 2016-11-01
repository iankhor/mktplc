# mktplc

Our next assignment is to design and build a two sided marketplace.
Making a pre-assignment project to make sure I'm ready. 

Very ugly, but wanted to check function rather than form!
Need to make sure I have assignment planned correctly. It's easy to get confused without proper design. 

* Need to be logged in to buy / add items etc.
* Created custom routes /my_cart, /my_items / 
* User can view / edit / delete their own items in 'my_items', but won't see their own items on the homepage 
  - Did this using `user_signed_in? ? @items = Item.where.not(user_id: current_user.id) : @items = Item.all`
* /carts can be used to view previous / paid carts (like an order history)

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
  _Cart is either created if the last one is paid, or the unpaid one is added to_
  _Carts are also a record of sales for the logged in user_
  - buyer (user_id)
  - total
  - paid

- ItemtoCart (belongs to :sale, belongs to :item)
  _Join table between item and cart_
  - cart_id
  - item_id  

- SoldItems 
  _Only returns items that belong to the logged in user and are part of a paid order_
  _Should make a new model for this, but wanted to experiment_
  cart where paid == true
  @sold_items = cart.items where user_id == current_user.id  
