require 'net/http'
require 'json'
require 'openssl'
require 'cgi'
require 'base64'
require 'string'

class FatSecret
  
  require 'fatsecret/exercise'
  require 'fatsecret/exercise_entry'
  require 'fatsecret/food'
  require 'fatsecret/profile'
  require 'fatsecret/recipe'
  require 'fatsecret/recipe_type'
  require 'fatsecret/weight'
  
  include FatSecret::Exercise
  include FatSecret::ExerciseEntry
  include FatSecret::Food
  include FatSecret::Profile
  include FatSecret::Recipe
  include FatSecret::RecipeType
  include FatSecret::Weight
  
  @@key    = ''
  @@secret = ''
  
  SHA1   = 'HMAC-SHA1'
  SITE   = 'http://platform.fatsecret.com/rest/server.api'
  DIGEST = OpenSSL::Digest::Digest.new('sha1')
  
  def self.init(key, secret)
    @@key = key
    @@secret = secret
    return self
  end
  
  private
    
    def self.get(query)
      params = {
        :format => 'json',
        :oauth_consumer_key => @@key,
        :oauth_nonce => SecureRandom.hex,
        :oauth_signature_method => SHA1,
        :oauth_timestamp => Time.now.to_i,
        :oauth_version => '1.0',
      } 
      params.merge!(query)
      sorted_params = params.sort {|a, b| a.first.to_s <=> b.first.to_s}
      base = base_string('GET', sorted_params)
      http_params = http_params('GET', params)
      sig = sign(base).esc
      uri = uri_for(http_params, sig)
      results = JSON.parse(Net::HTTP.get(uri))
    end
    
    def self.base_string(http_method, param_pairs)
      param_str = param_pairs.collect{|pair| "#{pair.first}=#{pair.last}"}.join('&')
      list = [http_method.esc, SITE.esc, param_str.esc]
      list.join('&')
    end
    
    def self.http_params(method, args)
      pairs = args.sort {|a, b| a.first.to_s <=> b.first.to_s}
      list = []
      pairs.inject(list) {|arr, pair| arr << "#{pair.first.to_s}=#{pair.last}"}
      list.join('&')
    end
    
    def self.sign(base, token='')
      secret_token = "#{@@secret.esc}&#{token.esc}"
      base64 = Base64.encode64(OpenSSL::HMAC.digest(DIGEST, secret_token, base)).chomp.gsub(/\n/, '')
    end
    
    def self.uri_for(params, signature)
      parts = params.split('&')
      parts << "oauth_signature=#{signature}"
      URI.parse("#{SITE}?#{parts.join('&')}")
    end
    
end
