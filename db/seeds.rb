User.destroy_all
puts "Creating users..."

u1 = User.create username: 'bsmith', password_digest: 'chicken', first_name: 'Bob', last_name: 'Smith', email: 'bob.smith@ga.co', image: 'http://www.placecage.com/c/250/250'
u2 = User.create username: 'jsmithers', password_digest: 'chicken', first_name: 'John', last_name: 'Smithers', email: 'john.smithers@ga.co', image: 'http://www.placecage.com/c/250/250'
u3 = User.create username: 'bbillers', password_digest: 'chicken', first_name: 'Bill', last_name: 'Billers', email: 'bill.billers@ga.co', image: 'http://www.placecage.com/c/250/250'
u4 = User.create username: 'ssquarepants', password_digest: 'chicken', first_name: 'Spongebob', last_name: 'Squarepants', email: 'spongebob.squarepants@ga.co', image: 'http://www.placecage.com/c/250/250'

puts "Created #{User.all.length} users..."


Article.destroy_all
puts "Creating articles..."

art1 = Article.create title: "Healthcare policy changes.", publish_date: "2018-05-14", url: "http://www.placecage.com/350/350"
art2 = Article.create title: "NASA announcement.", publish_date: "2018-05-15", url: "http://www.placecage.com/350/350"
art3 = Article.create title: "Political debate.", publish_date: "2018-05-16", url: "http://www.placecage.com/350/350"
art4 = Article.create title: "Compulsory religious education.", publish_date: "2018-05-17", url: "http://www.placecage.com/350/350"

puts "Created #{Article.all.length} articles..."


Argument.destroy_all
puts "Creating arguments..."

arg1 = Argument.create title: "The triumph of man over smallpox."
arg2 = Argument.create title: "The link between vaccines and autism."
arg3 = Argument.create title: "Evolution of laser technology."
arg4 = Argument.create title: "The moon-landing conspiracy."
arg5 = Argument.create title: "Trump and Putin."
arg6 = Argument.create title: "Hillary Clinton's emails."
arg7 = Argument.create title: "Constitutional separation of church and state."
arg8 = Argument.create title: "God bless America."

puts "Created #{Argument.count} arguments..."



Comment.destroy_all
puts "Creating comments..."

c1 = Comment.create text_body: "This is good for bitcoin."
c2 = Comment.create text_body: "This is great for bitcoin."
c3 = Comment.create text_body: "This is amazing for bitcoin."
c4 = Comment.create text_body: "This is fantastic for bitcoin."
c5 = Comment.create text_body: "This is incredible for bitcoin."
c6 = Comment.create text_body: "This is terrific for bitcoin."
c7 = Comment.create text_body: "This is excellent for bitcoin."
c8 = Comment.create text_body: "I took out a third mortgage on my house to invest in bitcoin."

# Why does terminal say no comments or arguments created, but they have been correctly created in the database?
puts "Created #{Comment.all.size} comments..."

art1.arguments << arg1
art1.arguments << arg2
art2.arguments << arg3
art2.arguments << arg4
art3.arguments << arg5
art3.arguments << arg6
art4.arguments << arg7
art4.arguments << arg8

u1.arguments << arg1
u1.arguments << arg3
u2.arguments << arg2
u2.arguments << arg4
u3.arguments << arg5
u3.arguments << arg7
u4.arguments << arg6
u4.arguments << arg8

u1.comments << c1
u1.comments << c3
u2.comments << c2
u2.comments << c4
u3.comments << c5
u3.comments << c7
u4.comments << c6
u4.comments << c8

arg1.comments << c1
arg2.comments << c2
arg3.comments << c3
arg4.comments << c4
arg5.comments << c5
arg6.comments << c6
arg7.comments << c7
arg8.comments << c8