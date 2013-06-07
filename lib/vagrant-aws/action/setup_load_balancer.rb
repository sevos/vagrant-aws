module VagrantPlugins
  module AWS
    module Action
      class SetupLoadBalancer
        def initialize(app, env)
          @app    = app
          @logger = Log4r::Logger.new("vagrant_aws::action::connect_aws")
        end

        def call(env)
          @app.call(env)
        end

      end
    end
  end
end
