require_relative "linked_list"
require_relative "node"

class HashMap
  
 attr_accessor :buckets, :array, :load_factor, :capacity

  def initialize
    @buckets = 16
    @capacity = buckets
    @load_factor = 0.75
    @array = Array.new(buckets){DoublyLinkedList.new}
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char{|char| hash_code = prime_number*hash_code + char.ord}
    hash_code % buckets
  end
  def set(key, value)
    # before setting the pair into a hashmap 
    # we have to check if it is time to grow the hashmap
    if self.has?(key)
      self.remove(key)
    end
    hash_key = hash(key)
    
    array[hash_key].insert(key,value)

    if self.entries.size > @capacity * @load_factor
      expand
    end
    array 
        
  end  
#3-get(key) takes one argument as a key and returns the value 
#that is assigned to this key. If key is not found, return nil.
  def expand
    self.buckets = self.buckets + 16
    self.capacity = @buckets
    until self.array.size == buckets
      self.array << DoublyLinkedList.new
    end
  end

  def get(key)
    hash_key = hash(key)
    array[hash_key].get(key) 
  end

  #4-has?(key) takes a key as an argument and returns true or false based on whether or not the key is in the hash map.
  def has?(key)
    for bucket in self.array
      bucket.include?(key)
  end

  def remove(key)
    if self.has?(key)
      for bucket in self.array
        bucket.delete(key)
      end
    end

    end
  end

  def length
    len = 0
    for bucket in self.array
      len = len + bucket.length
    end
    return len
  end

  def clear
    
    for bucket in self.array
      unless bucket.is_empty?
        keys = bucket.keys
        for key in keys
          bucket.delete(key)
        end
      end
    end
    return self
  end

  def keys
    keys = []
    for bucket in self.array
      keys << bucket.keys
    end
    return keys.compact.flatten
  end

  def values
    values = []
    for bucket in self.array
      values << bucket.values
    end
    return values.compact.flatten
  end

  def entries
    pair = []
    for bucket in self.array
      pair << bucket.pairs
    end
    return pair.compact.flatten(1)
  end
end

test = HashMap.new
test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')
test.set('moon', 'silver')
# # test.set('apple', 'red') 
# test.set('apple', 'red') 
# test.set('moon', 'silver')
test.set('apple', 'red')
# test.set('banana', 'yellow')
# test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')
test.set('moon', 'silver')
test.set('tomato','red')
test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')
test.set('moon', 'silver')
p test.length

p test.keys
p test.values
p test.entries
test.remove('moon')
p test.length
p test.get('lion')
p test.clear.length
