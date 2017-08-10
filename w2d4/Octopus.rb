string = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(array)
  fish_length = array[0]
  array.each_index do |i1|
    array.each_with_index do |e2, i2|
      next if i2 <= i1
      fish_length = e2 if fish_length.length < e2.length
    end
  end
  fish_length
end

def dominant_octopus(array)
  #quick sort
  return array if array.length < 2
  middle = array[array.length / 2]

  left = array.select { |word| word.length < middle.length }
  #array[middle] =
  right = array.select { |word| word.length > middle.length }

  dominant_octopus(right)
end


def clever_octopus(array)
  longest_string = [array[0]]
  array.each { |word| longest_string = word if word.length > longest_string[0].length }
  longest_string
end

def dancing_octopus(array)
  #could assign all the values to a tentacle..
  #then shuffle the values
  #then prompt the octopus to
end

# p dominant_octopus(string)
