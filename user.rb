require 'pry'

class User
  @@all_users = []
  attr_accessor :name, :username, :password, :friends, :pictures, :posts

  def initialize(name, username, password)
    @name = name
    if(@@all_users.detect {|x| x==username})
      puts "Username already exits"
    else
      @username = username
      @password = password
      @posts = [] #needs to be a class

      @pictures = []
      @friends = [] #needs to be an array of objects
      @@all_users << self
    end
  end

  def post(message)
    post = {:time => Time.now, :message => message}
    posts << post
  end
  #add a friend to the friends array
  def add_friend(friend)
    friends << friend
    friend.friends << self
  end

  def view_friends
    friends.each {|x| puts x}
  end

  def view_friends_in_common(username)
  end

  def add_picture(picture)
    pictures << picture
  end

  def view_own_posts
    posts.each {|x| puts x }
  end

  def view_wall
  end

  def show_feed
    self.friends.each do |f|
      puts "#{f.name}: #{f.posts.last[:message]}"


    end
  end
  def self.all_users
    @@all_users
  end
end

grill = User.new("Aaron Grill", "aarongrill", "123")
saber = User.new("Saber Khan", "saber", "123")
danny = User.new("Danny f", "dannyf", "123")

danny.post("hello world")
grill.post("Yo!")
saber.post("this is the first one")

danny.add_friend(saber)
grill.add_friend(danny)
grill.add_friend(saber)


binding.pry
