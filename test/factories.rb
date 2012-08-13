Factory.define :user do |u|
  u.username 'testuser%d'
  u.email '%{username}@example.com'
  u.password u.password_confirmation('foobarbaz')
end

Factory.define :feed do |f|
  f.title 'feed%d'
  f.url '%{title}.com'
  f.feed_url '%{title}.com/feed.xml'
end
