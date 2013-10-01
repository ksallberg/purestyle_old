module PostsHelper

  def join_tags(post)
    post.category
    post.tags.map { |t| t.name }.join( ", " )
  end
  
  def coderay(text)
    text.gsub(/<code( lang="(.+?)")?>(.+?)<\/code>/m) do
      CodeRay.scan($3, $2).div(:css => :class)
    end
  end
  
  def tagMode(uri)
    
    searchFor = uri[0..5]
    
    match = false
    
    if searchFor.to_s() == "/tags/"
      match = true
    end
    
    return match
  end
  
  def isWithinTag(uri, post)
    
    #What to search for
    searchFor = uri[6..uri.length]
    
    #Fetch all tags
    tags = post.category.split(",")
    
    match = false
    
    tags.each do |eachTag|
      
      if( eachTag.to_s() == searchFor.to_s() )
        
	match = true

      end
      
    end
    
    return match

  end
  
  #if post is in the category of the specified uri, then show it
  def isInCategory(uri, post)
    
    #see if the uri starts with "/?cat="
    if( uri[0..5] == "/?cat=" )
       catId = uri[6..uri.length]
       isOK = false
       if(catId.to_s() == post.category.to_s())
          return true
       else
          return false
       end
    else
      return true
    end
  end
  
  def getTags()
    
    content = []
    
    @theTags.each do |post|
      content += post.category.split(",")
    end
    
    return content.uniq
  end
  
  def getTagsForPost(post)
    
    content = []
    
    tags = post.category.split(",")
    
    tags.each do |tag|
      content += [tag]
    end
    
    return content
  end
  
  def getTagNameFromId(id)
    toReturn = ""
    @tags.each do |tag|
      if( tag.id == id )
        toReturn = tag.name
      end
    end
    return toReturn
  end
  
  def getTagIdFromName(uri)
    
    tagName = uri[6..uri.length]
    
    toReturn = ""
    @tags.each do |tag|
      if( tag.name.to_s() == tagName.to_s() )
        return toReturn = tag.id
      else
        toReturn += tag.name + tagName
      end
    end
    return toReturn
  end
  
  def isInCategory(id, post)
    if(id.to_s() == post.category.to_s())
      return true
    else
      return false
    end
  end
  
  #if post is in the category of the specified uri, then show it
  def specialIsInCategory(uri, post)
    
    #see if the uri starts with "/?cat="
    if( uri[0..5] == "/tags/" )
       catId = uri[6..uri.length]
       isOK = false
       if(catId.to_s() == post.category.to_s())
          return true
       else
          return false
       end
    else
      return true
    end
  end
  
  def truncate_words(text, wordcount, omission)
    text.split[0..(wordcount-1)].join( " " ) + (text.split.size > wordcount ? " " + omission : "")
  end
end
