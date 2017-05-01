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
faq_questions.count.times do |i|
  Faq.create!(question: faq_questions[i], answer: faq_answers[i])
end

puts "There are now #{Faq.count} questions in the FAQ."
