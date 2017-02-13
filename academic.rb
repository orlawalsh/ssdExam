WKS_PER_SEMESTER = 12

class Topic
  attr_reader   :noLectures, :name 
  
  def initialize(noLectures, name)
     @noLectures = noLectures
     @name = name
  end  
  
end

class Subject    # aka Module
  def initialize(name, noLectures, credits)
     @noLecturesPerWeek = noLectures
     @name = name
     @credits = credits
     @topics = []
  end 

  def findTopic name
      @topics.find {|topic| topic.name == name }
  end

  def addTopic topic
  	if (computeTopicTotal + topic.noLectures <= 
                     WKS_PER_SEMESTER * @noLecturesPerWeek )
       @topics << topic 
       true
    else
  	   false
    end
  end

  def removeTopic name
    result = false
    topic = findTopic name
    if topic 
       @topics.delete topic
       result = true
    end
    return result
  end
  
  def mergeTopics old_name1, old_name2, new_name
      merged = nil
      topic1 = findTopic(old_name1)
      topic2 = findTopic(old_name2 )
    if ( topic1 != nil && topic2 != nil )
      merged = Topic.new( 
          (topic1.noLectures + topic2.noLectures), new_name )
      removeTopic topic1.name
      removeTopic topic2.name
      addTopic merged
    end
    return merged
  end

   def otherMethod arg1, arg2
      # some code
      # more code
      # etc
      # etc
      # etc
   end

  private

  def computeTopicTotal 
  	@topics.inject(0) {|sum, topic| sum += topic.noLectures}
  end
end
