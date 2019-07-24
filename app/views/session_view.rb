class SessionView

  def ask(thing)
    puts "Please enter your #{thing}"
    gets.chomp
  end

  def sign_in_success(user)
    if user.manager?
      puts "[MANAGER] Welcome #{user.username}"
    else
      puts "[DELIVERY GUY] Welcome #{user.username}"
    end
  end

  def wrong_creds
    puts "Wrong credentials, please try again"
  end

  def welcome
    puts "Hi, welcome to the food delivery app, please sign in."
  end
end
