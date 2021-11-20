puts "Clearing old data..."
User.destroy_all
Drink.destroy_all
Till.destroy_all
Purchase.destroy_all

puts "seed user"
User.create(name: 'Sean')

puts "seed drinks"
Drink.create(name: 'Coca Cola', price: 2.00, quantity: 2)
Drink.create(name: 'Sprite', price: 2.50, quantity: 2)
Drink.create(name: 'Fanta', price: 2.70, quantity: 3)
Drink.create(name: 'Orange Juice', price: 3.00, quantity: 1)
Drink.create(name: 'Water', price: 3.25, quantity: 0)

puts "seed till"
Till.create(value: 5.00, quantity: 5)
Till.create(value: 3.00, quantity: 5)
Till.create(value: 2.00, quantity: 5)
Till.create(value: 1.00, quantity: 5)
Till.create(value: 0.50, quantity: 5)
Till.create(value: 0.25, quantity: 5)

puts "seed purchase"
Purchase.create(drink_id: Drink.all[4].id, user_id: User.all[0].id, total: 3.25)

puts "DONE"