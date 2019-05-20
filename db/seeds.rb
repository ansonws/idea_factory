Like.delete_all
Review.delete_all
Idea.delete_all
User.delete_all

3.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name

    User.create(
        first_name: first_name,
        last_name: last_name,
        email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
        password: PASSWORD
    )
end

users = User.all

40.times do
    created_at = Faker::Date.backward(365 * 5)
    q = Question.create(
        title: Faker::Hacker.say_something_smart,
        body: Faker::ChuckNorris.fact,
        view_count: rand(100_000),
        created_at: created_at,
        updated_at: created_at,
        user: users.sample
    )
    if q.valid?
        q.answers = rand(0..15).times.map do
            Answer.new(
                body: Faker::GreekPhilosophers.quote,
                user: users.sample
            )
        end
        q.likers = User.all.shuffle.slice(0, rand(User.count))
    end
end

questions = Question.all
answers = Answer.all

puts Cowsay.say("Generated #{ questions.count } questions", :ghostbusters)
puts Cowsay.say("Generated #{ answers.count } answers", :stegosaurus)
puts Cowsay.say("Generated #{ users.count } users", :beavis)
puts Cowsay.say("Login with #{super_user.email} and password: #{PASSWORD}", :koala)