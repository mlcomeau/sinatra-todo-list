megan = User.create(username: "megan", password: "password")

bruce = User.create(username: "bruce", password: "woof")

Task.create(name: "buy groceries", user_id: megan.id)
Task.create(name: "vacuum", user_id: megan.id)
Task.create(name: "eat dog bones", user_id: bruce.id)