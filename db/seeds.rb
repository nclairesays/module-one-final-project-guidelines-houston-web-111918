require_relative '../config/environment.rb'

# [1..100].each do |number|
#     RestClient.get("api/#{number}")
#     # save to database
# end


a = User.create(name: "Andy", age: 10, gender: "female")
b = User.create(name: "Brittany", age: 20, gender: "male")
c = User.create(name: "Cassy", age: 25, gender: "male")
d = User.create(name: "Daisy", age: 30, gender: "male")
e = User.create(name: "Eddy", age: 35, gender: "female")

one = Number.create(int_num: 1, alpha_num: "one")
two = Number.create(int_num: 2, alpha_num: "two")
three = Number.create(int_num: 3, alpha_num: "three")
four = Number.create(int_num: 4, alpha_num: "four")
five = Number.create(int_num: 5, alpha_num: "five")

p1 = PettyFact.create(number: one, petty_fact:"Test 1")
p2 = PettyFact.create(number: two, petty_fact:"Test 2")
p3 = PettyFact.create(number: three, petty_fact:"Test 3")
p4 = PettyFact.create(number: four, petty_fact:"Test 4")
p5 = PettyFact.create(number: five, petty_fact:"Test 5")


b1 = Bookmark.create(user: a, petty_fact:p1)
b2 = Bookmark.create(user: b, petty_fact:p2)
b3 = Bookmark.create(user: c, petty_fact:p3)
b4 = Bookmark.create(user: d, petty_fact:p4)
b5 = Bookmark.create(user: e, petty_fact:p5)
b6 = Bookmark.create(user: a, petty_fact:p3)
b7 = Bookmark.create(user: b, petty_fact:p4)
b8 = Bookmark.create(user: c, petty_fact:p5)
b9 = Bookmark.create(user: d, petty_fact:p1)
b10 = Bookmark.create(user: e, petty_fact:p2)
b11 = Bookmark.create(user: a, petty_fact:p4)
b12 = Bookmark.create(user: b, petty_fact:p5)






