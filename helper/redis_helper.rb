require 'json'
require 'redis'
require 'connection_pool'

# begin
#   $redisStore = Redis.new(url: ENV['REDIS_URL'])
# rescue
#   $redisStore = ConnectionPool::Wrapper.new(size: 5, timeout: 3) {Redis.new(host: 'localhost', port: 6379)}
# end

class RedisHelper

  def initialize(url = nil)
    if url
      @store = ConnectionPool::Wrapper.new(size: 20, timeout: 10) {Redis.new(url: url)}
    else
      @store = Redis.new(host: 'localhost', port: 6379)
    end
  end

  # timeline
  # user_id: [tweet_id1, tweet_id2, ...]
  def push_mass_tweets(key, tweets)
    tweets.each do |t|
      @store.lpush(key, t)
      @store.expire(key, 24.hours.to_i)
    end
  end

  def get_timeline(key, start, count)
    @store.lrange(key, start, start + count - 1)
  end

  def push_single_tweet(key, tweet)
    @store.lpush(key, tweet)
    @store.expire(key, 120.hours.to_i)
  end

  # user info cache
  # user: user_info_json
  def push_single_user(user_id, user = User.without(:password_hash).find(BSON::ObjectId(user_id)))
    @store.set("user_#{user_id.to_s}", user.to_json)
    @store.expire("user_#{user_id.to_s}", 24.hours.to_i)
  end

  def get_single_user(user_id)
    user = @store.get("user_#{user_id}")
    if user
      return JSON.parse(user)
    else
      user = User.without(:password_hash).find(BSON::ObjectId(user_id))
      push_single_user(user_id, user)
      return user
    end

    # unless cached? "user_#{user_id.to_s}"
    #   push_single_user(user_id)
    # end
    # # TODO
    # # JSON.parse(JSON.parse(store.get("user_#{user_id.to_s}")))
    # JSON.parse(@store.get("user_#{user_id.to_s}"))
  end

  def clear()
    @store.flushall
  end

  # @deprecated, dont need this method
  def cached?(key)
    @store.exists(key)
  end
end

begin
  $redis = RedisHelper.new(ENV['REDIS_URL'])
  pp "Redis online :)"
rescue
  pp "Redis launch failed :("
end
