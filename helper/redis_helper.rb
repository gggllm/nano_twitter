require 'json'
require 'redis'
require 'connection_pool'

# $redis = Redis.new(host: 'nanotwitter.aouf4s.0001.use2.cache.amazonaws.com', port: 6379)
# $redisStore = Redis.new(host: 'localhost', port: 6379)
#
begin
  # $redisStore = ConnectionPool::Wrapper.new(size: 5, timeout: 3) {Redis.new(host: ENV['REDIS_URL'])}
  $redisStore = Redis.new(host: ENV['REDIS_URL'])
rescue
  $redisStore = ConnectionPool::Wrapper.new(size: 5, timeout: 3) {Redis.new(host: 'localhost', port: 6379)}
end

def cached?(store, key)
  store.exists(key)
end

# timeline
# user_id: [tweet_id1, tweet_id2, ...]
def push_mass_tweets(store, key, tweets)
  tweets.each do |t|
    store.lpush(key, t)
    store.expire(key, 24.hours.to_i)
  end
end

def get_timeline(store, key, start, count)
  store.lrange(key, start, start + count - 1)
end

def push_single_tweet(store, key, tweet)
  store.lpush(key, tweet)
  store.expire(key, 120.hours.to_i)
end

# user info cache
# user: user_info_json
def push_single_user(store, key, user)
  store.set(key, user.to_json)
  store.expire(key, 24.hours.to_i)
end

def get_single_user(store, key)
  # JSON.parse(JSON.parse(store.get(key)))
  JSON.parse(store.get(key))
end

def clear(store)
  store.flushall
end
