if User.count > 1
  raise 'DB already seeded'
end

email1 = 'yotto@example.com'
email2 = '16bit@example.com'

user1 = User.create(name: 'yotto', email: email1, picture_url: 'https://TODO')
user2 = User.create(name: '16 bit', email: email2, picture_url: 'https://TODO')
puts "Created #{User.count} users."

channel = Channel.create(name: 'anjuna')
puts "Created #{Channel.count} channels."

channel_user1 = ChannelUser.create(channel: channel, user: user1)
channel_user2 = ChannelUser.create(channel: channel, user: user2)
puts "Created #{ChannelUser.count} channel-users."

thred = Thred.create(channel: channel)
puts "Created #{Thred.count} threads."

comment1 = Comment.create(user: user1, thred: thred, message: 'sweet track https://www.youtube.com/watch?v=OsJSwGc4lsA')
comment2 = Comment.create(user: user2, thred: thred, message: "It's a classic!")
puts "Created #{Comment.count} comments."
