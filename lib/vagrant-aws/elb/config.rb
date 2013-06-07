require "vagrant"

module VagrantPlugins
  module AWS
    module ELB
      class Config < Vagrant.plugin("2", :config)

        class ELB 
          class HealhCheck < 
            attr_reader :listeners

            def initialize(name)
              @listeners = []
              @name = name
            end

            def listener(protocol, ports)
              puts "Defining listener #{protocol} #{ports.inspect}"
              @listeners << [protocol, ports]
            end

            def health_check=(hc)
              @health_check = hc
            end
          end


          # The list of defined Elastic Load Balancers
          #
          # @return [Array<VagrantPlugins::AWS::ELB::Config::ELB>]
          attr_reader :elbs


          def initialize
            @elbs = {}
          end

          # Defines an Elastic Load Balancer
          #
          #     elb.define "production-web" do |elb|
          #       elb.listener :http, 80 => 80
          #     end
          #
          # @param [String] elb name
          def define(name)
            self.elbs[name] = ELB.new(name)
            yield self.elbs[name]
          end
        end
      end
    end
  end

