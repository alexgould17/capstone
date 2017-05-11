faq_questions = [
  "Who built this app?",
  "Can I run this on my own computer?",
  "I believe someone is using my photos without my consent."
]
faq_answers = [
  "Alex Gould, a full-stack developer from San Jose, CA.",
  "Yes, if you have rails installed on your computer, just download the source code, run the server & initialize the database properly.",
  "Contact the creator & tell him what you want done (removal, etc.). He will do his best to respond to your request in a timely & reasonable manner."
]

# This was the easiest way to put FAQs into the db currently. Will make an admin page to update them later.
faq_questions.count.times do |i|
  Faq.create!(question: faq_questions[i], answer: faq_answers[i])
end

me = User.find_or_create_by(email: 'alexgould17@gmail.com') do |me|
  me.name = "Alex Gould"
  me.password = "wsxedc"
end
me.update_attribute(:confirmed_at, 1.second.ago)

puts "There are now #{Faq.count} questions in the FAQ."
