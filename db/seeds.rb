# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Question.destroy_all
Answer.destroy_all

dorota = User.create!(user_name: "Dorota", email: "dorota@example.com", password: "1234abcd")
piotrek = User.create!(user_name: "Piotrek", email: "piotrek@example.com", password: "1234abcd")
wojtek = User.create!(user_name: "Wojtek", email: "wojtek@example.com", password: "1234abcd")

question1 = Question.create!(title: "Ile nóg ma koń?",
                             contents: "Zawsze mnie to intrygowało. Proszę o pomoc",
                             user_id: dorota.id)
question2 = Question.create!(title: "Co grają w kinie?",
                             user_id: piotrek.id)
question3 = Question.create!(title: "Pomysły na wakacje?",
                             user_id: wojtek.id)

Answer.create!(question_id: question1.id,
               user_id: piotrek.id,
               contents: "Patrząc na zdjęcie w atlasie zwierząt pozwolam sobie stweirdzić, że 4")
Answer.create!(question_id: question1.id,
               user_id: wojtek.id,
               contents: "Zdarzają się też takie co mają 3.")
Answer.create!(question_id: question1.id,
               user_id: dorota.id,
               contents: "Dzięki za odpowiedź chłopaki. Widziałam też takiego co miał 5")

Answer.create!(question_id: question2.id,
               user_id: dorota.id,
               contents: "Słyszałam, że 'Chata wuja Toma' jest na 18")
Answer.create!(question_id: question2.id,
               user_id: piotrek.id,
               contents: "Dzięki!")
Answer.create!(question_id: question2.id,
               user_id: wojtek.id,
               contents: "Idę z wami")

Answer.create!(question_id: question3.id,
               user_id: dorota.id,
               contents: "Proponuję Suchacz. Mnóstwo atrakcji i przemili ludzie.")
Answer.create!(question_id: question3.id,
               user_id: piotrek.id,
               contents: "Ja z kolei słyszałem, że Tolkmicko jest bardzo rozrywke. Na zwiedzanie trzeba zarezerować jakieś 15 dni")

