# Mars rover problem

#plateau_size_x = 5
#plateau_size_y = 5
#  
#rovers = [[[1,2,'N'], "LMLMLMLMM"], [[3,3,'E'], "MMRMMRMRRM"]]


def setup_rover_data(rover)
  data = {}
  data[:location] = {x: rover[0][0], y: rover[0][1], orientation: rover[0][2]}
  data[:movements] = rover[1].split('') # Array of movements
  data
end

def rotate(dir, side)
  if side == "L"
    rotation = -1
  else
    rotation = 1
  end
  
  if dir == "N"
    return ["N", "E", "S", "W"].rotate(rotation)[0]
  elsif dir == "E"
    return ["E", "S", "W", "N"].rotate(rotation)[0]
  elsif dir == "S"
    return ["S", "W", "N", "E"].rotate(rotation)[0]
  elsif dir == "W"
    return ["W", "N", "E", "S"].rotate(rotation)[0]
  end
end

def move(loc)
  if loc[:orientation] == "N"
    loc[:y] += 1
  elsif loc[:orientation] == "S"
    loc[:y] -= 1
  elsif loc[:orientation] == "W"
    loc[:x] -= 1
  elsif loc[:orientation] == "E"
    loc[:x] += 1
  end
  loc
end

def make_movement(loc, movement)
  if movement == "L" || movement == "R"
    new_orientation = rotate(loc[:orientation], movement)
    loc[:orientation] = new_orientation
    return loc
  else
    return move(loc)
  end
end

plateau_size = gets.chomp
size = plateau_size.split.collect{ |x| x.to_i }
plateau_size_x = size[0]
plateau_size_y = size[1]
rovers = []
i = 0
while (input = gets) != "\n"
  input = input.chomp
  d = input.split
  rovers[i] = []
  rovers[i][0] = [d[0].to_i, d[1].to_i, d[2]]
  rovers[i][1] = gets.chomp
  i += 1
end

rovers.each do |rover|
  rover_data = setup_rover_data(rover)
  current_location = rover_data[:location]
  rover_data[:movements].each do |movement|
    current_location = make_movement(current_location, movement)
  end
    
  p "#{current_location[:x]} #{current_location[:y]} #{current_location[:orientation]}"
end
