module Dibot
  class Commands::Deploy
    include Capybara::DSL

    class << self
      attr_accessor :connection

      def establish_connection(options)
        @connection = options
      end
    end

    attr_accessor :project

    def match(body)
      return unless body =~ /^dibot\sdeploy\s(.*)/

      @project = $1
    end

    def call(room, message)
      return unless match(message[:body])

      deploy(@project)
      room.speak "deploying #{@project}"
    end

    def connection
      self.class.connection
    end

    def deploy(project)
      Capybara.run_server = true
      Capybara.current_driver = :selenium
      Capybara.app_host = connection["server"] 

      visit "/"
      fill_in "login", :with => connection["user"]
      fill_in "password", :with => connection["password"]
      click_button "Log in"
      
      click_link project
      click_link "Production"
      click_link "Deploy"
      click_button "Start deployment"
    end
  end
end

Dibot::Commands.register Dibot::Commands::Deploy.new
