User.destroy_all
puts "Creating users..."

u1 = User.create username: 'bsmith', password_digest: 'chicken', first_name: 'Bob', last_name: 'Smith', email: 'bob.smith@ga.co', image: 'http://www.placecage.com/c/250/250'
u2 = User.create username: 'jsmithers', password_digest: 'chicken', first_name: 'John', last_name: 'Smithers', email: 'john.smithers@ga.co', image: 'http://www.placecage.com/c/250/250'
u3 = User.create username: 'bbillers', password_digest: 'chicken', first_name: 'Bill', last_name: 'Billers', email: 'bill.billers@ga.co', image: 'http://www.placecage.com/c/250/250'
u4 = User.create username: 'ssquarepants', password_digest: 'chicken', first_name: 'Spongebob', last_name: 'Squarepants', email: 'spongebob.squarepants@ga.co', image: 'http://www.placecage.com/c/250/250'

puts "Created #{User.all.length} users..."


Article.destroy_all
puts "Creating articles..."

art1 = Article.create title: "Healthcare policy changes.", publish_date: "2018-05-14", url: "http://www.placecage.com/350/350", article_api_id: "aaaaa", section: "General"
art2 = Article.create title: "NASA announcement.", publish_date: "2018-05-15", url: "http://www.placecage.com/350/350", article_api_id: "bbbbb", section: "General"
art3 = Article.create title: "Political debate.", publish_date: "2018-05-16", url: "http://www.placecage.com/350/350", article_api_id: "ccccc", section: "General"
art4 = Article.create title: "Compulsory religious education.", publish_date: "2018-05-17", url: "http://www.placecage.com/350/350", article_api_id: "ddddd", section: "General"

puts "Created #{Article.all.length} articles..."


Comment.destroy_all
puts "Creating comments..."

c1 = Comment.create subject: "The link between vaccines and autism.", text_body: "You make an excellent point. However..."
c2 = Comment.create subject: "The link between vaccines and autism.", text_body: "This reminds me of the time when I..."
c3 = Comment.create subject: "Moon landing conspiracy debunked.", text_body: "Please no Ad Hominem attacks."
c4 = Comment.create subject: "Moon landing conspiracy debunked.", text_body: "In conclusion..."
c5 = Comment.create subject: "Trump and Putin, and Hillary Clinton's emails.", text_body: "As a mother..."
c6 = Comment.create subject: "Trump and Putin, and Hillary Clinton's emails.", text_body: "Down with the patriarchy."
c7 = Comment.create subject: "Why abortion doctors are serial killers.", text_body: "Thoughts and prayers."
c8 = Comment.create subject: "Why abortion doctors are serial killers.", text_body: "This is good for bitcoin."

art1.comments << c1
art1.comments << c2
art2.comments << c3
art2.comments << c4
art3.comments << c5
art3.comments << c6
art4.comments << c7
art4.comments << c8

u1.comments << c1
u1.comments << c3
u2.comments << c2
u2.comments << c4
u3.comments << c5
u3.comments << c7
u4.comments << c6
u4.comments << c8

puts "Created #{Comment.all.size} comments..."