module GBCLXML
  class Tokens    
    def self.representation(a)      
      if    a.is_a?(String)
        if    a ==       "cette"; print "    <#{a}>"
        elsif a ==    "maisette"; print "    <#{a}>"
        elsif a ==       "sinon"; print "    <#{a}>"
        elsif a ==        "sore"; print "    <#{a}>"
        elsif a ==    "shikashi"; print "    <#{a}>"
        elsif a ==      "matawa"; print "    <#{a}>"
        elsif a ==      "cettef"; puts "</#{a}>"
        elsif a ==   "maisettef"; puts "</#{a}>"
        elsif a ==      "sinonf"; puts "</#{a}>"
        elsif a ==       "soref"; puts "</#{a}>"
        elsif a ==   "shikashif"; puts "</#{a}>"
        elsif a ==     "matawaf"; puts "</#{a}>"
        elsif a ==     "necette"; print "    <#{a}>"
        elsif a ==  "nemaisette"; print "    <#{a}>"
        elsif a ==     "nesinon"; print "    <#{a}>"
        elsif a ==      "nesore"; print "    <#{a}>"
        elsif a ==  "neshikashi"; print "    <#{a}>"
        elsif a ==    "nematawa"; print "    <#{a}>"
        elsif a ==    "necettef"; puts "</#{a}>"
        elsif a == "nemaisettef"; puts "</#{a}>"
        elsif a ==    "nesinonf"; puts "</#{a}>"
        elsif a ==     "nesoref"; puts "</#{a}>"
        elsif a == "neshikashif"; puts "</#{a}>"
        elsif a ==   "nematawaf"; puts "</#{a}>"
        else
          print "#{a} "
        end
      else
        puts "Error: No support for #{a}"
      end
    end
    
    #def self.representationf(a)
    #  b = a.split(" ")
    #
    #  if    b.is_a?(String)
    #    if    b ==     "cette"; print "    <#{a}>"
    #    elsif b ==  "maisette"; print "    <#{a}>"
    #    elsif b ==     "sinon"; print "    <#{a}>"
    #    elsif b ==      "sore"; print "    <#{a}>"
    #    elsif b ==  "shikashi"; print "    <#{a}>"
    #    elsif b ==    "matawa"; print "    <#{a}>"
    #    elsif b ==    "cettef"; puts "</#{a}>"
    #    elsif b == "maisettef"; puts "</#{a}>"
    #    elsif b ==    "sinonf"; puts "</#{a}>"
    #    elsif b ==     "soref"; puts "</#{a}>"
    #    elsif b == "shikashif"; puts "</#{a}>"
    #    elsif b ==   "matawaf"; puts "</#{a}>"
    #    else
    #      print "#{b} "
    #    end
    #  else
    #    puts "Error: No support for #{b}"
    #  end
    #end
  end
  
  class Lexer
    def self.analyze(text)
      if text.is_a?(Array)
        index      = 0
        size_limit = text.size.to_i

        puts "<?xml version='1.0' encoding='UTF-8'?>"
        puts "<?xml-stylesheet type='text/css' href='aimap.css'?>"

        puts "<screen>"
        puts "  <container>"

        size_limit.times do
          print GBCLXML::Tokens.representation(text[index])
        
          index = index + 1
        end
        
        puts "  </container>"
        puts "  <connection> | </connection>"
        puts "</screen>"
      else
        puts "Error: No support for #{text}"
        
        abort
      end
    end
  end
  
  class Parsing
    # def self.parse
    #   print "What file name? ( Skip for default file name )"; name = gets.chomp
    #
    #   if File.exist?("#{name}.gbcl")
    #     lex = GBCLXML::Lexer

    #     system("touch #{name}.gbcl")

    #     read_file = File.readlines("source/#{name}.gbcl")

    #     index      = 0
    #     size_limit = index.size.to_i

    #     size_limit.times do
    #       lex.analyze(read_file[index])
          
    #       index = index + 1
    #     end
    #   else
    #     lex = GBCLXML::Lexer

    #     read_file = File.readlines("source/#{name}.gbcl")

    #     index      = 0
    #     size_limit = index.size.to_i

    #     size_limit.times do
    #       lex.analyze(read_file[index])
    #     
    #       index = index + 1
    #     end
    #   end
    # end
    
    def self.interpret
      lex  = GBCLXML::Lexer
      line = 0
      
      loop do
        print "GBCL (#{line}) >> "; action = gets #.chomp
        
        if action == "clear"
          system("clear")
        elsif action == "exit"
          abort
        else
          new_output = action.to_s.split(" ")
      
          lex.analyze(new_output)
        
          line = line + 1
        end
      end
    end
    
    #def self.autoparse
    #  require "NeoPathfinding"

    #  lex  = GBCLXML::Lexer
    #  line = 0
      
    #  carg = cette(ARGV[0], ARGV[1])
    #  marg = maisette(ARGV[2], ARGV[3])
    #  sarg = sinon(ARGV[4], ARGV[5], ARGV[6], ARGV[7])

    #  first_assertion    = "cette #{carg} cettef"
    #  second_assertion   = "maisette #{marg} maisettef"
    #  third_assertion    = "sinon #{sarg} sinonf"
   
    #  2.times do
    #    get_statistics(:cette,     first_assertion,
    #                   :maisette, second_assertion,
    #                   :sinon,     third_assertion)
                       
    #                   dynamic_mode_switcher
    #  end
      
    #  new_output = $current_definition.split(" ")
    #  lex.analyze(new_output)
    #end
  end
end

GBCLXML::Parsing.interpret
