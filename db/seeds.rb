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
if Faq.count == 0
  faq_questions.count.times do |i|
    Faq.create!(question: faq_questions[i], answer: faq_answers[i])
  end
end

me = User.find_or_create_by(email: 'alexgould17@gmail.com') do |me|
  me.name = "Alex Gould"
  me.password = "wsxedc"
end
me.update_attribute(:confirmed_at, 1.second.ago)

# Add our two test images
if Image.count == 0
  Image.create!(
    title: "First pic!",
    pictype: 0,
    uri: "https://s3-us-west-1.amazonaws.com/alexgcapstonepics/me1.jpg",
    latitude: 37.39194444,
    longitude: -122.00222222,
    width: 1836,
    height: 3264,
    aspect_ratio: 0.5625,
    tags: "Alex Gould,selfie,Stanford",
    user_id: me.id
  )
  Image.create!(
    title: "Second pic!",
    pictype: 0,
    uri: "https://s3-us-west-1.amazonaws.com/alexgcapstonepics/me2.jpg",
    latitude: 37.51361111,
    longitude: -122.19972222,
    width: 2988,
    height: 5312,
    aspect_ratio: 0.5625,
    tags: "Alex Gould,profile pic,at work",
    user_id: me.id
  )
end

puts "There are now #{Faq.count} questions in the FAQ."
puts "There are now #{Image.count} images in the database."
