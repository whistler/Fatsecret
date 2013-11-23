class String
  
  def esc
    CGI.escape(self).gsub("%7E", "~").gsub("+", "%20") 
  end
  
end
