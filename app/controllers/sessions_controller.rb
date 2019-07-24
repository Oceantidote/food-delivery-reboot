require_relative "../views/session_view"

class SessionsController

  def initialize(employee_repository)
    @employee_repository = employee_repository
    @session_view = SessionView.new
  end

  def sign_in
    @session_view.welcome
    username = @session_view.ask("username")
    password = @session_view.ask("password")
    user = @employee_repository.find_by_username(username)
    if user && user.password == password
      @session_view.sign_in_success(user)
      user
    else
      @session_view.wrong_creds
      sign_in
    end
    # ask for username
    # ask for password
    # find employee from repo
    # check if passwords match
    # if not retry login
    # if they do log them in
  end
end
