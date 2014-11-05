#!/usr/bin/env ruby
def get_question_token(mad_lib)
  start_index = mad_lib.index('#{')
  end_index = mad_lib.index('}')
  if start_index.nil? || end_index.nil?
    nil
  else
    mad_lib[start_index..end_index]
  end
end

def ask_question(token)
  puts "Please enter a #{token.gsub('#{', '').gsub('}', '')}"
  gets.chomp
end

mad_lib_file = File.new(File.dirname(__FILE__) + '/madlibs.txt', 'r')

mad_lib = mad_lib_file.readlines.join
question_token = get_question_token(mad_lib)

until question_token.nil?
  input = ask_question(question_token)
  mad_lib.sub!(question_token, input)
  question_token = get_question_token(mad_lib)
end

puts mad_lib
