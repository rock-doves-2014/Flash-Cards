require 'yelp'

client = Yelp::Client.new({ consumer_key: "3U4t_J8B5bgrlJyLCpS2lQ",
                            consumer_secret: "qzveH8N8GqhVtg7aFusfLrbXsdU",
                            token: "4CqSHEORMkvhnrR69ew8hytdS-w5fS_I",
                            token_secret: "8fzmBuEu8-MxHKX84W-NEY50-Fw"
                          })

# Alternate method of establishing client
# Yelp.client.configure do |config|
#   config.consumer_key = YOUR_CONSUMER_KEY
#   config.consumer_secret = YOUR_CONSUMER_SECRET
#   config.token = YOUR_TOKEN
#   config.token_secret = YOUR_TOKEN_SECRET
# end



params = { term: 'food',
           limit: 2,
           # category_filter: 'discgolf'
         }

locale = { lang: 'fr' }

p client.search('San Francisco', params)


