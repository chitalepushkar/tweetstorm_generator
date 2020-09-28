#!/usr/bin/env ruby

# The first 3 characters in a tweet are reserved for prefixing tweet numbers to the content.
# MAX_WORD_COUNT considers the tweet content.
MAX_WORD_COUNT = 137

def create_tweetstorm(large_tweet)
  # Checking for nil or whitespace text as an argument.
  if large_tweet.nil? || large_tweet =~ /\A\s*\z/
    print 'Argument missing. Please pass tweet text as an argument.'
    return
  end

  tweet_collection = []
  tweet = ''
  for char_index in 0..large_tweet.length-1
    if (tweet.length < MAX_WORD_COUNT)
      # Append character to temporary string 'tweet' until length reaches MAX_WORD_COUNT.
      tweet << large_tweet[char_index]
    else
      # Add tweet to collection if character limit reached.
      tweet_collection << tweet
      tweet = large_tweet[char_index]
    end
  end
  tweet_collection << tweet
  prefix_tweet_count(tweet_collection)
end

# Prefix (tweet number / total tweets) to individual tweets.
def prefix_tweet_count(tweet_collection)
  # Deleting tweet chunks containing only whitespaces.
  tweet_collection.delete_if {|tweet| tweet =~ /\A\s*\z/ }
  tweet_collection.each_with_index do |tweet, tweet_index|
    print tweet.prepend("#{tweet_index+1}/#{tweet_collection.length}")
    print "\n"
  end
end

create_tweetstorm(ARGV[0])
