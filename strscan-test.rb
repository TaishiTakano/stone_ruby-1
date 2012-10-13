require "strscan"

text = ""

while true
  print ">>"
  s = gets.chomp
  if s == "Q" then break end
  text +=  s
end

section = { "" => {} }
current = section[""]
s = StringScanner.new(text)

  while !s.eos?
    case
    when s.scan(/\s+/)
      # nothing
    when s.scan(/\[(.+?)\]/)
      section[s[1]] = current = {}
    when s.scan(/(\w+)\s*=\s*(["'])?([^\n]+)\2/)
      current[s[1]] = s[3]
    when s.scan(/(\w+)\s*=\s*(\d+\.\d+)/)
      current[s[1]] = s[2].to_f
    when s.scan(/(\w+)\s*=\s*([\d]+)/)
      current[s[1]] = s[2].to_i
    else
      raise "Parse Error. rest=#{ s.rest }"
    end
  end

p section
