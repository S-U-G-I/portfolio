User.create(name: test,
            email: aaa@example.com,
            password: 111111,
            password_confirmation: 111111
            )

1.upto(15) do |n|
  Tweet.create!(img: open("app/assets/images/img#{n}.jpg"),
               tweet: "test",
               user_id: 1
                )
end

60.times do |n|
  name = Faker::Games::SonicTheHedgehog.character
  email = Faker::Internet.safe_email
  password = "111111"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               )
  end

  users = User.all
  user  = users.first
  following = users[2..50]
  followers = users[3..40]
  following.each { |followed| user.follow(followed) }
  followers.each { |follower| follower.follow(user) }
  

