Factory.define :user do |u|
  u.username 'testuser%d'
  u.email '%{username}@example.com'
  u.password u.password_confirmation('foobarbaz')
end
