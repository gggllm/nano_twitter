require_relative 'user_service.rb'
require_relative 'follow_service.rb'
require_relative 'tweet_service.rb'
require_relative '../helper/service_helper.rb'

class Services
    attr_accessor :user_service

    self.user_service = UserService.new
    self.follow-service=FollowService.new
end
