require "Medusahoseki"
require "NeoPathfinding"

puts "Enemy Placement"

def proximity_de_medusahoseki(a, b)
  maximum_distance     = b
  distance_probability = a
  
  calculation = maximum_distance - ( maximum_distance * distance_probability )
  calculation = calculation.round
  
  "Distance from Medusahoseki: #{calculation}"
end

def proximity_de_nemedusahoseki(a, b)
  maximum_distance     = b
  distance_probability = 1 - a
  
  calculation = maximum_distance - ( maximum_distance * distance_probability )
  calculation = calculation.round
  
  "Distance from Nemedusahoseki ( Salamander Riding Goat ): #{calculation}"
end

def proximity_de_memorie(a)
  year_period = 12
  
  calculation = 12 - ( 12 * a )
  calculation = calculation.round
  
  "this memory was from a prior #{calculation} year period"
end

def mperiod_sprox(a, b)
  "#{a} over #{b}"
end

## That But...
def sore_shikashi(a, b)
  "That #{a} but without #{b}"
end

## That also
def sore_matawa(a, b)
  "That #{a} but also #{b}"
end

## That time
def self.sore_float(condition)
  if condition
    yield
    
    return true
  end
  
  false
end

def self.shikashi_float(already_done, condition)
  return true if already_done
  
  if condition
    yield
    
    return true
  end
end

def self.sonota_float(already_done)
  yield unless already_done
  
  unless already_done
    #if defined?($otherwise)
      #puts "#{$otherwise_not[0]} is 'THAT'"
      #puts "#{$otherwise_not[1]} is 'WHAT'"
    #end
  end
end

## A place of many rivers flowing together.
def self.matawa_float(already_done)
  yield unless already_done
  
  unless already_done
    #if defined?($otherwise)
      #puts "#{$otherwise_not[0]} is 'THAT'"
      #puts "#{$otherwise_not[1]} is 'WHAT'"
    #end
  end
end

def is_entity_anomalous?(a)
  if    a ==   :mundane; print "This entity is mundane. "
  elsif a == :uncertain; print "It is uncertain the nature of this entity. "
  elsif a == :anomalous; print "This entity is possibly anomalous in nature. "
  else
    print "It is uncertain the nature of this entity. "
  end
end

def study_artefacts?(d, e, f)
  a = :object,  d
  b = :subject, e
  c = :verb,    f
  
  g = :mundane, :uncertain, :anomalous
  
  aspects = [
    [[a[0], a[0], a[0]], [a[0], a[0], b[0]], [a[0], a[0], c[0]]],
    [[b[0], b[0], a[0]], [b[0], b[0], b[0]], [b[0], b[0], c[0]]],
    [[c[0], c[0], a[0]], [c[0], c[0], b[0]], [c[0], c[0], c[0]]],
  ], [
    [[a[1], a[1], a[1]], [a[1], a[1], b[1]], [a[1], a[1], c[1]]],
    [[b[1], b[1], a[1]], [b[1], b[1], b[1]], [b[1], b[1], c[1]]],
    [[c[1], c[1], a[1]], [c[1], c[1], b[1]], [c[1], c[1], c[1]]],
  ], [
    [[g[0], g[0], g[0]],
     [g[0], g[0], g[1]],
     [g[0], g[0], g[2]]],

    [[g[1], g[1], g[0]],
     [g[1], g[1], g[1]],
     [g[1], g[1], g[2]]],

    [[g[2], g[2], g[0]],
     [g[2], g[2], g[1]],
     [g[2], g[2], g[2]]],
  ]
  
  symbols      = aspects[0]
  description  = aspects[1]
  nature       = aspects[2]
  
  row_options = [0, 1, 2]
  col_options = [0, 1, 2]
  arr_options = [0, 1, 2]
  
  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample
  
  current_symbol      = symbols[cur_row][cur_col][cur_arr] #.strip
  current_description = description[cur_row][cur_col][cur_arr] #.strip
  current_nature      = nature[cur_row][cur_col][cur_arr] #.strip

  $current_nature = current_nature
  
  "#{current_symbol}, #{current_description}"
end

## Standard Reasoning
def quantiffirm(p, q, probability)
  case probability
  when 0.00010..0.1250
    "#{p} therefore #{q} is false."
  when 0.1251..0.3625
    "#{p} therefore #{q} is largely false."
  when 0.3626..0.5125
    "#{p} therefore #{q} is partially true."
  when 0.5126..0.7563
    "#{p} therefore #{q} is largely true."
  when 0.7564..0.9999
    "#{p} therefore #{q} is true."
  else
    "#{p} therefore #{q} is not quantifiable."
  end
end

def etudevaluate(a1, a2, b1, b2, c1, c2, x, y)
  2.times do
    get_statistics(:first_word,  graviteformee(a1, a2),
                   :second_word, graviteformee(b1, b2),
                   :third_word,  graviteformee(c1, c2))

                   dynamic_reward_allocation
                   dynamic_reward_allocation

    cognitive_threshold = 100
    probability         = 0.9 / $current_probability
    odds                = probability / ( 1 - probability )
    charted_assessment  = cognitive_threshold * probability
    
    size_of_map_y = x
    size_of_map_x = y
    
    map_cognitive_y = ( size_of_map_y * charted_assessment ) % size_of_map_y
    map_cognitive_x = ( size_of_map_x * charted_assessment ) % size_of_map_x
  
    puts "\nLEARNING ASSESSMENT"
    puts "The current map size is: #{x} by #{y}"
    puts "The current cognitive threshold is #{cognitive_threshold}"
    puts "The current probability is #{probability}"
    puts "The current odds of learning this word is #{odds}"
    puts "The current assessment of learning ability is #{charted_assessment}"
    puts "Therefore the approximate location of cognitive loading is the tile of #{map_cognitive_y} and #{map_cognitive_x}."
    puts quantiffirm("The cognitive threshold is #{cognitive_threshold}", "the approximate location of cognitive loading is the tile of #{map_cognitive_y} and #{map_cognitive_x}", probability)
    
    puts " "
  end
end

def risk_factor(risk)
  case risk
  when 0.750..1.000; print "Maximum Risk"; puts quantiffirm(": Such activities carry Maximum Risk", "this activity probably has Maximum risk", risk)
  when 0.500..0.749; print "High Risk";    puts quantiffirm(": Such activities carry High Risk", "this activity probably has High risk",    risk)
  when 0.250..0.499; print "Medium Risk";  puts quantiffirm(": Such activities carry Medium Risk", "this activity probably has Medium risk",  risk)
  when 0.125..0.249; print "Mild Risk";    puts quantiffirm(": Such activities carry Mild Risk", "this activity probably has Mild risk",    risk)
  when 0.010..0.124; print "Minimal Risk"; puts quantiffirm(": Such activities carry Minimal Risk", "this activity probably has Minimal risk", risk)
  else
    puts "The risk factor is unquantifiable."
  end
end

def thresholding(a, y, x)
  cognitive_threshold = 100
  probability         = a
  odds                = probability / ( 1 - probability )
  charted_assessment  = cognitive_threshold * probability
    
  size_of_map_y = y
  size_of_map_x = x
    
  map_cognitive_y = ( size_of_map_y * charted_assessment ) % size_of_map_y
  map_cognitive_x = ( size_of_map_x * charted_assessment ) % size_of_map_x
  
  ## This is for charting end destinations.
  $map_cognitive_y = map_cognitive_y
  $map_cognitive_x = map_cognitive_x

  matrix = [
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ]

  grid = Grid.new(matrix)

  start_node = grid.node(map_cognitive_y, map_cognitive_y)
  end_node = grid.node(map_cognitive_y-5, map_cognitive_y-5)

  finder = AStarFinder.new()
  path = finder.find_path(start_node, end_node, grid)

  puts grid.to_s(path, start_node, end_node)
  
  puts "LEARNING ASSESSMENT"
  puts "The current map size is: #{x} by #{y}"
  puts "The current cognitive threshold is #{cognitive_threshold}"
  #puts "The current probability is #{probability}"
  puts "The current odds of learning this word is #{odds}"
  #puts "The current assessment of learning ability is #{charted_assessment}"
  puts "Therefore the approximate location of cognitive loading is the tile of #{map_cognitive_y.to_i} and #{map_cognitive_x.to_i}."
  puts quantiffirm("The cognitive threshold is #{cognitive_threshold}", "the approximate location of cognitive loading is the tile of #{map_cognitive_y} and #{map_cognitive_x}", probability)  
  puts " "
end

a = "+--G--+--+--+--G--+
|.....|..|..|.....|
|.xxx.+..+..+.xxx.|
G.xxx.........xxx.G
|.xxx.+..+..+.xxx.|
|.....|..|..|.....|
+--G--+--+--+--G--+"

b = "+--G--+     +--G--+
|.....|     |.....|
|.xxx.+     +.xxx.|
G.xxx.G*****G.xxx.|
|.xxx.+*****+.xxx.|
|.....|     |.....|
+--G--+     +--G--+"

c = "+--G--+--G--+--G--+
|....C|.....|C....|
|.....+.xxx.+.....|
G.......xxx.......G
|.....+.xxx.+.....|
|....C|.....|C....|
+--G--+--G--+--G--+"

d = "+--G-----G-----G--+
|.................|
|.................|
G.................G
|.................|
|.................|
+--G-----G-----G--+"

e = "TTT.TTTTT.TTTTT.TTT
T.....T.....T.....T
T.....T.....T.....T
...................
T.....T.....T.....T
T.....T.....T.....T
TTT.TTTTT.TTTTT.TTT"

f = "TTT.TTTTT.TTTTT.TTT
T.....T.....T.....T
T.....T..~..T.....T
........~~~........
T.....T..~..T.....T
T.....T.....T.....T
TTT.TTTTT.TTTTT.TTT"

g = "TTT.TTTTT.TTTTT.TTT
T.....T.....T.....T
T..~..T.....T..~..T
..~~~.........~~~..
T..~..T.....T..~..T
T.....T.....T.....T
TTT.TTTTT.TTTTT.TTT"

h = "TTT.TTTTT.TTTTT.TTT
T.................T
T.................T
...................
T.................T
T.................T
TTT.TTTTT.TTTTT.TTT"

i = "%B%.%B%B%.%B%B%.%B%
B.#.#.B.....B.#.#.B
%#.#.#%.....%#.#.#%
...................
%#.#.#%.....%.#.#.%
B.#.#.B.....B#.#.#B
%B%.%B%B%.%B%B%.%B%"

j = "%B%.%B%B%.%B%B%.%B%
B.....B#.#.#B.....B
%.....%.#.#.%.....%
...................
%.....%#.#.#%.....%
B.....B.#.#.B.....B
%B%.%B%B%.%B%B%.%B%"

k = "%B%B%B%B%.%B%B%B%B%
B.................B
%.................%
...................
%.................%
B.................B
%B%B%B%B%.%B%B%B%B%"

l = "###.#####.#####.###
#.....#.....#.....#
#.....#.....#.....#
...................
#.....#.....#.....#
#.....#.....#.....#
###.#####.#####.###"

m = "###.#####.#####.###
#.................#
#.................#
...................
#.................#
#.................#
###.#####.#####.###"

map_layouts = [
  [[a, a, a, a, a, a, a, a, a, a, a, a, a],
   [a, a, a, a, a, a, a, a, a, a, a, a, b],
   [a, a, a, a, a, a, a, a, a, a, a, a, c],
   [a, a, a, a, a, a, a, a, a, a, a, a, d],
   [a, a, a, a, a, a, a, a, a, a, a, a, e],
   [a, a, a, a, a, a, a, a, a, a, a, a, f],
   [a, a, a, a, a, a, a, a, a, a, a, a, g],
   [a, a, a, a, a, a, a, a, a, a, a, a, h],
   [a, a, a, a, a, a, a, a, a, a, a, a, i],
   [a, a, a, a, a, a, a, a, a, a, a, a, j],
   [a, a, a, a, a, a, a, a, a, a, a, a, k],
   [a, a, a, a, a, a, a, a, a, a, a, a, l],
   [a, a, a, a, a, a, a, a, a, a, a, a, m]],

  [[b, b, b, b, b, b, b, b, b, b, b, b, a],
   [b, b, b, b, b, b, b, b, b, b, b, b, b],
   [b, b, b, b, b, b, b, b, b, b, b, b, c],
   [b, b, b, b, b, b, b, b, b, b, b, b, d],
   [b, b, b, b, b, b, b, b, b, b, b, b, e],
   [b, b, b, b, b, b, b, b, b, b, b, b, f],
   [b, b, b, b, b, b, b, b, b, b, b, b, g],
   [b, b, b, b, b, b, b, b, b, b, b, b, h],
   [b, b, b, b, b, b, b, b, b, b, b, b, i],
   [b, b, b, b, b, b, b, b, b, b, b, b, j],
   [b, b, b, b, b, b, b, b, b, b, b, b, k],
   [b, b, b, b, b, b, b, b, b, b, b, b, l],
   [b, b, b, b, b, b, b, b, b, b, b, b, m]],

  [[c, c, c, c, c, c, c, c, c, c, c, c, a],
   [c, c, c, c, c, c, c, c, c, c, c, c, b],
   [c, c, c, c, c, c, c, c, c, c, c, c, c],
   [c, c, c, c, c, c, c, c, c, c, c, c, d],
   [c, c, c, c, c, c, c, c, c, c, c, c, e],
   [c, c, c, c, c, c, c, c, c, c, c, c, f],
   [c, c, c, c, c, c, c, c, c, c, c, c, g],
   [c, c, c, c, c, c, c, c, c, c, c, c, h],
   [c, c, c, c, c, c, c, c, c, c, c, c, i],
   [c, c, c, c, c, c, c, c, c, c, c, c, j],
   [c, c, c, c, c, c, c, c, c, c, c, c, k],
   [c, c, c, c, c, c, c, c, c, c, c, c, l],
   [c, c, c, c, c, c, c, c, c, c, c, c, m]],

  [[d, d, d, d, d, d, d, d, d, d, d, d, a],
   [d, d, d, d, d, d, d, d, d, d, d, d, b],
   [d, d, d, d, d, d, d, d, d, d, d, d, c],
   [d, d, d, d, d, d, d, d, d, d, d, d, d],
   [d, d, d, d, d, d, d, d, d, d, d, d, e],
   [d, d, d, d, d, d, d, d, d, d, d, d, f],
   [d, d, d, d, d, d, d, d, d, d, d, d, g],
   [d, d, d, d, d, d, d, d, d, d, d, d, h],
   [d, d, d, d, d, d, d, d, d, d, d, d, i],
   [d, d, d, d, d, d, d, d, d, d, d, d, j],
   [d, d, d, d, d, d, d, d, d, d, d, d, k],
   [d, d, d, d, d, d, d, d, d, d, d, d, l],
   [d, d, d, d, d, d, d, d, d, d, d, d, m]],

  [[e, e, e, e, e, e, e, e, e, e, e, e, a],
   [e, e, e, e, e, e, e, e, e, e, e, e, b],
   [e, e, e, e, e, e, e, e, e, e, e, e, c],
   [e, e, e, e, e, e, e, e, e, e, e, e, d],
   [e, e, e, e, e, e, e, e, e, e, e, e, e],
   [e, e, e, e, e, e, e, e, e, e, e, e, f],
   [e, e, e, e, e, e, e, e, e, e, e, e, g],
   [e, e, e, e, e, e, e, e, e, e, e, e, h],
   [e, e, e, e, e, e, e, e, e, e, e, e, i],
   [e, e, e, e, e, e, e, e, e, e, e, e, j],
   [e, e, e, e, e, e, e, e, e, e, e, e, k],
   [e, e, e, e, e, e, e, e, e, e, e, e, l],
   [e, e, e, e, e, e, e, e, e, e, e, e, m]],

  [[f, f, f, f, f, f, f, f, f, f, f, f, a],
   [f, f, f, f, f, f, f, f, f, f, f, f, b],
   [f, f, f, f, f, f, f, f, f, f, f, f, c],
   [f, f, f, f, f, f, f, f, f, f, f, f, d],
   [f, f, f, f, f, f, f, f, f, f, f, f, e],
   [f, f, f, f, f, f, f, f, f, f, f, f, f],
   [f, f, f, f, f, f, f, f, f, f, f, f, g],
   [f, f, f, f, f, f, f, f, f, f, f, f, h],
   [f, f, f, f, f, f, f, f, f, f, f, f, i],
   [f, f, f, f, f, f, f, f, f, f, f, f, j],
   [f, f, f, f, f, f, f, f, f, f, f, f, k],
   [f, f, f, f, f, f, f, f, f, f, f, f, l],
   [f, f, f, f, f, f, f, f, f, f, f, f, m]],

  [[g, g, g, g, g, g, g, g, g, g, g, g, a],
   [g, g, g, g, g, g, g, g, g, g, g, g, b],
   [g, g, g, g, g, g, g, g, g, g, g, g, c],
   [g, g, g, g, g, g, g, g, g, g, g, g, d],
   [g, g, g, g, g, g, g, g, g, g, g, g, e],
   [g, g, g, g, g, g, g, g, g, g, g, g, f],
   [g, g, g, g, g, g, g, g, g, g, g, g, g],
   [g, g, g, g, g, g, g, g, g, g, g, g, h],
   [g, g, g, g, g, g, g, g, g, g, g, g, i],
   [g, g, g, g, g, g, g, g, g, g, g, g, j],
   [g, g, g, g, g, g, g, g, g, g, g, g, k],
   [g, g, g, g, g, g, g, g, g, g, g, g, l],
   [g, g, g, g, g, g, g, g, g, g, g, g, m]],

  [[h, h, h, h, h, h, h, h, h, h, h, h, a],
   [h, h, h, h, h, h, h, h, h, h, h, h, b],
   [h, h, h, h, h, h, h, h, h, h, h, h, c],
   [h, h, h, h, h, h, h, h, h, h, h, h, d],
   [h, h, h, h, h, h, h, h, h, h, h, h, e],
   [h, h, h, h, h, h, h, h, h, h, h, h, f],
   [h, h, h, h, h, h, h, h, h, h, h, h, g],
   [h, h, h, h, h, h, h, h, h, h, h, h, h],
   [h, h, h, h, h, h, h, h, h, h, h, h, i],
   [h, h, h, h, h, h, h, h, h, h, h, h, j],
   [h, h, h, h, h, h, h, h, h, h, h, h, k],
   [h, h, h, h, h, h, h, h, h, h, h, h, l],
   [h, h, h, h, h, h, h, h, h, h, h, h, m]],

  [[i, i, i, i, i, i, i, i, i, i, i, i, a],
   [i, i, i, i, i, i, i, i, i, i, i, i, b],
   [i, i, i, i, i, i, i, i, i, i, i, i, c],
   [i, i, i, i, i, i, i, i, i, i, i, i, d],
   [i, i, i, i, i, i, i, i, i, i, i, i, e],
   [i, i, i, i, i, i, i, i, i, i, i, i, f],
   [i, i, i, i, i, i, i, i, i, i, i, i, g],
   [i, i, i, i, i, i, i, i, i, i, i, i, h],
   [i, i, i, i, i, i, i, i, i, i, i, i, i],
   [i, i, i, i, i, i, i, i, i, i, i, i, j],
   [i, i, i, i, i, i, i, i, i, i, i, i, k],
   [i, i, i, i, i, i, i, i, i, i, i, i, l],
   [i, i, i, i, i, i, i, i, i, i, i, i, m]],

  [[j, j, j, j, j, j, j, j, j, j, j, j, a],
   [j, j, j, j, j, j, j, j, j, j, j, j, b],
   [j, j, j, j, j, j, j, j, j, j, j, j, c],
   [j, j, j, j, j, j, j, j, j, j, j, j, d],
   [j, j, j, j, j, j, j, j, j, j, j, j, e],
   [j, j, j, j, j, j, j, j, j, j, j, j, f],
   [j, j, j, j, j, j, j, j, j, j, j, j, g],
   [j, j, j, j, j, j, j, j, j, j, j, j, h],
   [j, j, j, j, j, j, j, j, j, j, j, j, i],
   [j, j, j, j, j, j, j, j, j, j, j, j, j],
   [j, j, j, j, j, j, j, j, j, j, j, j, k],
   [j, j, j, j, j, j, j, j, j, j, j, j, l],
   [j, j, j, j, j, j, j, j, j, j, j, j, m]],

  [[k, k, k, k, k, k, k, k, k, k, k, k, a],
   [k, k, k, k, k, k, k, k, k, k, k, k, b],
   [k, k, k, k, k, k, k, k, k, k, k, k, c],
   [k, k, k, k, k, k, k, k, k, k, k, k, d],
   [k, k, k, k, k, k, k, k, k, k, k, k, e],
   [k, k, k, k, k, k, k, k, k, k, k, k, f],
   [k, k, k, k, k, k, k, k, k, k, k, k, g],
   [k, k, k, k, k, k, k, k, k, k, k, k, h],
   [k, k, k, k, k, k, k, k, k, k, k, k, i],
   [k, k, k, k, k, k, k, k, k, k, k, k, j],
   [k, k, k, k, k, k, k, k, k, k, k, k, k],
   [k, k, k, k, k, k, k, k, k, k, k, k, l],
   [k, k, k, k, k, k, k, k, k, k, k, k, m]],

  [[l, l, l, l, l, l, l, l, l, l, l, l, a],
   [l, l, l, l, l, l, l, l, l, l, l, l, b],
   [l, l, l, l, l, l, l, l, l, l, l, l, c],
   [l, l, l, l, l, l, l, l, l, l, l, l, d],
   [l, l, l, l, l, l, l, l, l, l, l, l, e],
   [l, l, l, l, l, l, l, l, l, l, l, l, f],
   [l, l, l, l, l, l, l, l, l, l, l, l, g],
   [l, l, l, l, l, l, l, l, l, l, l, l, h],
   [l, l, l, l, l, l, l, l, l, l, l, l, i],
   [l, l, l, l, l, l, l, l, l, l, l, l, j],
   [l, l, l, l, l, l, l, l, l, l, l, l, k],
   [l, l, l, l, l, l, l, l, l, l, l, l, l],
   [l, l, l, l, l, l, l, l, l, l, l, l, m]],

  [[m, m, m, m, m, m, m, m, m, m, m, m, a],
   [m, m, m, m, m, m, m, m, m, m, m, m, b],
   [m, m, m, m, m, m, m, m, m, m, m, m, c],
   [m, m, m, m, m, m, m, m, m, m, m, m, d],
   [m, m, m, m, m, m, m, m, m, m, m, m, e],
   [m, m, m, m, m, m, m, m, m, m, m, m, f],
   [m, m, m, m, m, m, m, m, m, m, m, m, g],
   [m, m, m, m, m, m, m, m, m, m, m, m, h],
   [m, m, m, m, m, m, m, m, m, m, m, m, i],
   [m, m, m, m, m, m, m, m, m, m, m, m, j],
   [m, m, m, m, m, m, m, m, m, m, m, m, k],
   [m, m, m, m, m, m, m, m, m, m, m, m, l],
   [m, m, m, m, m, m, m, m, m, m, m, m, m]],
]

row_options = [0, 1, 2, 3, 4, 5, 6, 7, 8]
col_options = [0, 1, 2, 3, 4, 5, 6, 7, 8]
arr_options = [0, 1, 2, 3, 4, 5, 6, 7, 8]

3.times do
  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample

  current_map = map_layouts[cur_row][cur_col][cur_arr]

  if    current_map == a; puts a
  elsif current_map == b; puts b
  elsif current_map == c; puts c
  elsif current_map == d; puts d
  elsif current_map == e; puts e
  elsif current_map == f; puts f
  elsif current_map == g; puts g
  elsif current_map == h; puts h
  elsif current_map == i; puts i
  elsif current_map == j; puts j
  elsif current_map == k; puts k
  elsif current_map == l; puts l
  elsif current_map == m; puts m
  else
    puts a
  end
end

# Consider Umuduragone for later on.
encounter_rate("[ Umigarugo ] Sea Gargoyals reside at the outside edges of the ancient castle",
               "[ Acideduragone ] Acid dragons resides in the ocean and sometimes reach out to land.",
               "[ Acideserupenete ] Acid serpents are in the deepest depths of Cthulhu's dungeon.",
               "[ Noneseturason ] Traitorous nuns eventually betray the party but you can never predict which one does that.",
               "[ Wancien / Habucorose ] Cthulhu lies at the final depths of darkness of the ancient temple; corrosive hive of snakes at the edge of darkness.")

puts "Predicting HeatMap"
encounter_heatmap = sore_float($current_probability > 0.8) do
  puts "#{$current_definition} is highly developed"

  puts mperiod_sprox(proximity_de_nemedusahoseki(150, $current_probability), proximity_de_memorie($current_probability))
end

encounter_heatmap = shikashi_float(encounter_heatmap, $current_probability < 0.2) do
  puts "#{$current_definition} is marginally developed"

  puts mperiod_sprox(proximity_de_nemedusahoseki(150, $current_probability), proximity_de_memorie($current_probability))
end

encounter_heatmap = matawa_float(encounter_heatmap) do
  puts "#{$current_definition} is somewhat developed"

  puts mperiod_sprox(proximity_de_nemedusahoseki(150, $current_probability), proximity_de_memorie($current_probability))
end

puts "Anamolous Monsters"
get_edge_cases(:acid_dragons,   "are dragons that have evolved to live in an acidic environment in the ocean.",
               :sea_gargoyals,  "are grotesque creatures as statues in the day, and come alive to hunt sailors.",
               :acid_serpents,  "are giant snakes that spew acid to destroy their enemies.",
               :poison_moss,    "is a toxic plant-like entity that needs special clogs in order to walk over.",
               :treasonous_nun, "are religious figures from the enemy encampment that ally with the main party.",
               :cthulhu,        "is first elder god of the Cthulhu mythos that destroys mankind when awakened.")
               
puts "Edge Case HeatMap"
edge_case_heatmap = sore_float($current_probability > 0.8) do
  puts "#{$current_definition} is highly developed"

  puts mperiod_sprox(proximity_de_nemedusahoseki(150, $current_probability), proximity_de_memorie($current_probability))
end

edge_case_heatmap = shikashi_float(edge_case_heatmap, $current_probability < 0.2) do
  puts "#{$current_definition} is marginally developed"

  puts mperiod_sprox(proximity_de_nemedusahoseki(150, $current_probability), proximity_de_memorie($current_probability))
end

edge_case_heatmap = matawa_float(edge_case_heatmap) do
  puts "#{$current_definition} is somewhat developed"

  puts mperiod_sprox(proximity_de_nemedusahoseki(150, $current_probability), proximity_de_memorie($current_probability))
end

puts "Trap Placement"
trap_rate("[ Pointe De Le Radeau ] Spiked sea rafts are a constant danger for warring sailors and mariners.",
          "[ Girochin Plaque ] Pressure plates are a trap that, when you step on the plate beheads its victims.",
          "[ Koke No Poison ] Poison Moss grows randomly inside the dungeon, and you need to wear special clogs to traverse it.",
          "[ Le Mien Poison ] Poison mines are similar to landmines, except they spew poisoning gas at victims.",
          "[ Faiseur De Veuves ] Guillotines are the most common method of capital punishment for murderers outisde of war time.")

puts "Trap HeatMap"
trap_heatmap = sore_float($current_probability > 0.8) do
  puts "#{$current_definition} is highly developed"

  puts mperiod_sprox(proximity_de_nemedusahoseki(150, $current_probability), proximity_de_memorie($current_probability))
end

trap_heatmap = shikashi_float(trap_heatmap, $current_probability < 0.2) do
  puts "#{$current_definition} is marginally developed"

  puts mperiod_sprox(proximity_de_nemedusahoseki(150, $current_probability), proximity_de_memorie($current_probability))
end

trap_heatmap = matawa_float(trap_heatmap) do
  puts "#{$current_definition} is somewhat developed"

  puts mperiod_sprox(proximity_de_nemedusahoseki(150, $current_probability), proximity_de_memorie($current_probability))
end
    
puts "Anamolous Traps"
get_edge_cases(:poison_moss,     "is grass like moss that poisons the player when you walk on it.",
               :spiked_raft,     "is a spiked wooden raft that tricks a vaulting player into landing on it.",
               :poison_mine,     "is a poison spraying mine that requires an antidote to treat.",
               :pressure_plate,  "is a pressure plate that beheads the character as they pass through it.",
               :guillotine,      "is an official execution device for deserters and defectors.",
               :one_way_dungeon, "is a cavern you can fall in but not easily escape.")
          
puts "Anomalous Trap HeatMap"
anomalous_trap_heatmap = sore_float($current_probability > 0.8) do
  puts "#{$current_definition} is highly developed"

  puts mperiod_sprox(proximity_de_nemedusahoseki(150, $current_probability), proximity_de_memorie($current_probability))
end

anomalous_trap_heatmap = shikashi_float(anomalous_trap_heatmap, $current_probability < 0.2) do
  puts "#{$current_definition} is marginally developed"

  puts mperiod_sprox(proximity_de_nemedusahoseki(150, $current_probability), proximity_de_memorie($current_probability))
end

anomalous_trap_heatmap = matawa_float(anomalous_trap_heatmap) do
  puts "#{$current_definition} is somewhat developed"

  puts mperiod_sprox(proximity_de_nemedusahoseki(150, $current_probability), proximity_de_memorie($current_probability))
end

puts "Loot Placement"
loot_rate("[ Le Sabot De Poison Hafelin ] Special wooden shoes that can resist the effects of poisonous moss.",
          "[ Les Axes De Urgence ] Emergency axes can be found which can be used to chop down doors or fend off enemies.",
          "[ Anos Kaidokuzaios ] Antidotes are able to treat injuries from poisonous moss.",
          "Acid resistant boats are needed in order to traverse water with high PH values.",
          "Healing salves can recover lost life points.")

puts "Loot HeatMap"
loot_heatmap = sore_float($current_probability > 0.8) do
  puts "#{$current_definition} is highly developed"

  puts mperiod_sprox(proximity_de_nemedusahoseki(150, $current_probability), proximity_de_memorie($current_probability))
end

loot_heatmap = shikashi_float(loot_heatmap, $current_probability < 0.2) do
  puts "#{$current_definition} is marginally developed"

  puts mperiod_sprox(proximity_de_nemedusahoseki(150, $current_probability), proximity_de_memorie($current_probability))
end

loot_heatmap = matawa_float(loot_heatmap) do
  puts "#{$current_definition} is somewhat developed"

  puts mperiod_sprox(proximity_de_nemedusahoseki(150, $current_probability), proximity_de_memorie($current_probability))
end

puts "Anamolous Loot"
get_edge_cases(:le_sabot_de_poison_hafelin, "Special wooden shoes for resisting poison caused by poison moss.",
               :les_axes_de_urgence,        "Emergency axes for chopping down wooden doors and attacking enemies.",
               :anos_kaidokuzaios,          "Antidotes for clearing out poison from the body.",
               :healing_salves,             "Healing salves for cuts and bruises; first aid kit box.",
               :caffein,                    "Caffein pills for keeping yourself awake at specific hours.",
               :alcohol,                    "Vampire Wine for extremely special occassions.")

puts "Anamolous Loot HeatMap"
loot_heatmap = sore_float($current_probability > 0.8) do
  puts "#{$current_definition} is highly developed"

  puts mperiod_sprox(proximity_de_nemedusahoseki(150, $current_probability), proximity_de_memorie($current_probability))
end

loot_heatmap = shikashi_float(loot_heatmap, $current_probability < 0.2) do
  puts "#{$current_definition} is marginally developed"

  puts mperiod_sprox(proximity_de_nemedusahoseki(150, $current_probability), proximity_de_memorie($current_probability))
end

loot_heatmap = matawa_float(loot_heatmap) do
  puts "#{$current_definition} is somewhat developed"

  puts mperiod_sprox(proximity_de_nemedusahoseki(150, $current_probability), proximity_de_memorie($current_probability))
end

puts "Mutations"
mutation_rate("[ Le Yeux De Mutation ] Mutations are sometime acquired when developing wounds that heal.",
              "[ Guerison Partielle ] Incomplete healing wounds can sometimes develop infections that don't go away except from rare medications.",
              "[ Perte De Raison ] Sometimes sanity lost happens rather than any longterm injuries.")

puts "Mutations HeatMap"
mutations_heatmap = sore_float($current_probability > 0.8) do
  puts "#{$current_definition} is highly developed"

  puts mperiod_sprox(proximity_de_nemedusahoseki(150, $current_probability), proximity_de_memorie($current_probability))
end

mutations_heatmap = shikashi_float(mutations_heatmap, $current_probability < 0.2) do
  puts "#{$current_definition} is marginally developed"

  puts mperiod_sprox(proximity_de_nemedusahoseki(150, $current_probability), proximity_de_memorie($current_probability))
end

mutations_heatmap = matawa_float(mutations_heatmap) do
  puts "#{$current_definition} is somewhat developed"

  puts mperiod_sprox(proximity_de_nemedusahoseki(150, $current_probability), proximity_de_memorie($current_probability))
end

puts "DIALOGUE"

2.times do
  get_statistics(:contrastive_one,  "Cette granit rouge Je ne jute lentement, mais cette granit rouge Je ne mange quicely.",
                 :contrastive_two, "Cette banane violet Je jute lentement, mais cette la banane violet Je ne jute quicely.",
                 :contrastive_tre,     "Cette pomme jaune Je mange lentement, mais cette granit violet Je mange lentement.")

                 dynamic_reward_allocation

  get_statistics(:contrastive_fro,   "Cette granit violet Je jute lentement, mais cette pomme jaune Je mange lentement.",
                 :contrastive_fiv,   "Cette pomme violet Je mange quicely, mais cette pomme rouge Je ne jute lentement.",
                 :contrastive_six, "Cette pomme rouge Je ne jute quicely, mais cette pomme jaune Je ne mange lentement.")
                 
                 dynamic_reward_allocation
end

puts "Dialogue HeatMap"
dialogue_heatmap = sore_float($current_probability > 0.8) do
  puts "#{$current_definition} is highly developed"

  puts mperiod_sprox(proximity_de_nemedusahoseki(150, $current_probability), proximity_de_memorie($current_probability))
end

dialogue_heatmap = shikashi_float(dialogue_heatmap, $current_probability < 0.2) do
  puts "#{$current_definition} is marginally developed"

  puts mperiod_sprox(proximity_de_nemedusahoseki(150, $current_probability), proximity_de_memorie($current_probability))
end

dialogue_heatmap = matawa_float(dialogue_heatmap) do
  puts "#{$current_definition} is somewhat developed"

  puts mperiod_sprox(proximity_de_nemedusahoseki(150, $current_probability), proximity_de_memorie($current_probability))
end

puts "ANOMALOUS ENVIRONMENTS"
2.times do
  get_statistics(:artefact_one, study_artefacts?("door", "wooden",   "locked"),
                 :artefact_two, study_artefacts?("door", "metallic", "locked"),
                 :artefact_tre, study_artefacts?("door", "marble",   "locked"))

  dynamic_reward_allocation
  #thresholding($current_probability, 12, 12)
end

puts "Anomalous Environmental HeatMap"
dialogue_heatmap = sore_float($current_probability > 0.8) do
  puts "#{$current_definition} is highly developed"

  puts mperiod_sprox(proximity_de_nemedusahoseki(150, $current_probability), proximity_de_memorie($current_probability))
end

dialogue_heatmap = shikashi_float(dialogue_heatmap, $current_probability < 0.2) do
  puts "#{$current_definition} is marginally developed"

  puts mperiod_sprox(proximity_de_nemedusahoseki(150, $current_probability), proximity_de_memorie($current_probability))
end

dialogue_heatmap = matawa_float(dialogue_heatmap) do
  puts "#{$current_definition} is somewhat developed"

  puts mperiod_sprox(proximity_de_nemedusahoseki(150, $current_probability), proximity_de_memorie($current_probability))
end

print "Current Nature: "; is_entity_anomalous?($current_nature)
puts " "
