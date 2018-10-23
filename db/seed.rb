if User.count > 1
  raise 'Already migrated'
end

email1 = 'yotto@example.com'
email2 = '16bit@example.com'

user1 = User.create(name: 'yotto', email: email1)
user2 = User.create(name: '16 bit', email: email2)

thread = Thread.create

comment1 = Comment.create(user: user1, message: 'sweet track https://www.youtube.com/watch?v=OsJSwGc4lsA')
comment2 = Comment.create(user: user2, message: "It's a classic!")
