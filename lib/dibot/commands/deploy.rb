module Dibot
  class Commands::Deploy
    class << self
      attr_accessor :connection

      def establish_connection(options)
        @connection = options
      end
    end

    attr_accessor :project, :stage

    def match(body)
      return unless body =~ /^dibot\sdeploy\s/

      if body =~ /^dibot\sdeploy\s(.*)\sto\s(.*)/
        @project = $1
        @stage = $2.capitalize
      elsif body =~ /^dibot\sdeploy\s(.*)/
        @project = $1
        @stage = "Production"
      end
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
      WebistranoResource::Resource.site = connection["server"]
      WebistranoResource::Resource.user = connection["user"]
      WebistranoResource::Resource.password = connection["password"]

      project = WebistranoResource::Project.find_by_name(project)
      stage = project.find_stage_by_name("Production")

      deployment = WebistranoResource::Deployment.new(:project_id => project.id, :stage_id => stage.id)
      deployment.task = "deploy"
      deployment.save
    end
  end
end

Dibot::Commands.register Dibot::Commands::Deploy.new
