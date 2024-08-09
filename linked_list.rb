require_relative 'node'

class DoublyLinkedList
  
  include Enumerable # To implement an each method for list
  attr_accessor :head

  def initialize(head=nil)
    @head = head
  end

  # Check if the list is empty or not
  def is_empty?
        if self.head == nil
          return true
        else
          return false
         end 
  end

  def insert(key,value)
    new_node = Node.new(key,value)
    if is_empty?
      @head = new_node
      self.head = new_node
    else
      current = @head
      until current.next == nil
        current = current.next
      end
      current.next = new_node
      new_node.prev = current
    end
  end

  def length
    len = 0
    if self.is_empty?
      return len
    else
      len = 1
      current = self.head
      until current.next == nil
        current = current.next
        len += 1
      end
      return len
    end
  end

  def include?(key)
    return false if self.is_empty?
    return true if self.head.key == key
    
    current = @head
    until current.next == nil
      current = current.next
      if current.key == key
        return true
        break
      end
    end
    return false
  end

  def delete(key)
    if self.include?(key)
      if self.head.key == key
        removed_value = @head.value
        new_head = @head.next
        @head = new_head
        # @head.prev = nil
        return removed_value
      else
        current = self.head.next
        until current.next == nil
          if current.key == key
            removed_value = current.value
            current.prev.next = current.next
            current.next.prev = current.prev
            # current.prev = nil
            return removed_value
          else
            current = current.next
          end
        end
        if current.key == key
          removed_value = current.value
          current.prev.next = nil
          return removed_value
        end          
      end
    else
      return nil
    end      
  end

  # def delete_all
  #   unless self.is_empty?
  #     current = @head
  #     until current.next == nil
  #       current.next = nil

  #     end
  #   end
  #     self = DoublyLinkedList.new
  #     return self
  #   end
  # end

  #get value by a given key
  def get(key)
    unless self.is_empty?
      current = @head
      until current.next == nil
        if current.key == key
          return current.value
        else
          current = current.next
        end
      end
      if current.key == key 
        return current.value
      end
    else
      return nil
    end
  end

  # get list of all keys in linked list
  
  def keys
      keys = []
    unless self.is_empty?
      current = @head
      until current.next == nil
        keys << current.key 
        current = current.next
      end
      keys << current.key
      return keys
    else
      return nil
    end
  end

  def values
    values = []
    unless self.is_empty?
    current = @head
    until current.next == nil
      values << current.value 
      current = current.next
    end
    values << current.value
    return values
  else
    return nil
  end
end

  def pairs
    pair = []
    unless self.is_empty?
    current = @head
    until current.next == nil
      key = current.value
      value = current.key
      pair << [key,value] 
      current = current.next
    end
      key = current.value
      value = current.key
      pair << [key,value] 
      return pair
  else
    return nil
  end
end

end




# list1 = DoublyLinkedList.new
# list1.insert("apple", "red")
# list1.insert("elephant", "grey")
# list1.insert("tomato","red")
# p list1
# # p list1.delete_all
# p list1.keys
# p list1.values
# p list1.pairs