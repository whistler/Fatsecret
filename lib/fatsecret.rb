require 'net/http'
require 'json'
require 'openssl'
require 'cgi'
require 'base64'

class String 
    def esc 
        CGI.escape(self).gsub("%7E", "~").gsub("+", "%20") 
    end 
end 

class FatSecret

  @@key = ""
  @@secret = ""

  SHA1 = "HMAC-SHA1" 
  SITE = "http://platform.fatsecret.com/rest/server.api"
  DIGEST = OpenSSL::Digest::Digest.new('sha1')

  def self.init(key, secret)
    @@key = key
    @@secret = secret
    return nil  #don't return the secret key
  end


  #--------------------------------
  #---   Food Functionality
  #--------------------------------

    def self.autocomplete_food(expression, max_results=4)
    query = {
      :method => 'foods.autocomplete',
      :expression => expression.esc,
          :max_results => max_results
    }
    get(query)
  end

  def self.food_id_for_barcode(barcode)
    query = {
      :method => 'food.find_id_for_barcode',
      :barcode => barcode
    }
    get(query)
  end

  def self.search_food(expression, page_number=0, max_results=20)
    query = {
      :method => 'foods.search',
      :search_expression => expression.esc,
      :page_number => page_number,
          :max_results => max_results
    }
    get(query)
  end

  def self.food(id)
    query = { 
      :method => 'food.get',
      :food_id => id
    }
    get(query)
  end

  #--------------------------------
  #---   Recipe Functionality
  #--------------------------------

  def self.search_recipes(expression,max_results=20)
    query = {
        :method => 'recipes.search',
        :search_expression => expression.esc,
        :max_results => max_results
    }
    get(query)
  end

  def self.recipe(id)
    query = {
        :method => 'recipe.get',
        :recipe_id => id
    }
    get(query)
  end

  #--------------------------------
  #---   Exercise Functionality
  #--------------------------------

  def self.get_exercises
    query = {
        :method => 'exercises.get',
    }
    get(query)
  end



  private 

  def self.get(query) 
    params = {
      :format => 'json',
      :oauth_consumer_key => @@key, 
      :oauth_nonce => SecureRandom.hex, 
      :oauth_signature_method => SHA1, 
      :oauth_timestamp => Time.now.to_i, 
      :oauth_version => "1.0", 
    } 
    params.merge!(query)
    sorted_params = params.sort {|a, b| a.first.to_s <=> b.first.to_s} 
    base = base_string("GET", sorted_params) 
    http_params = http_params("GET", params) 
    sig = sign(base).esc 
    uri = uri_for(http_params, sig) 
    results = JSON.parse(Net::HTTP.get(uri))
  end 

  def self.base_string(http_method, param_pairs) 
    param_str = param_pairs.collect{|pair| "#{pair.first}=#{pair.last}"}.join('&') 
    list = [http_method.esc, SITE.esc, param_str.esc] 
    list.join("&") 
  end 

  def self.http_params(method, args) 
    pairs = args.sort {|a, b| a.first.to_s <=> b.first.to_s} 
    list = [] 
    pairs.inject(list) {|arr, pair| arr << "#{pair.first.to_s}=#{pair.last}"} 
    list.join("&") 
  end 

  def self.sign(base, token='') 
    secret_token = "#{@@secret.esc}&#{token.esc}"
    base64 = Base64.encode64(OpenSSL::HMAC.digest(DIGEST, secret_token, base)).gsub(/\n/, '') 
  end 

  def self.uri_for(params, signature) 
    parts = params.split('&') 
    parts << "oauth_signature=#{signature}" 
    URI.parse("#{SITE}?#{parts.join('&')}") 
  end 

end
