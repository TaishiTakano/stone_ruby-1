class Hoge
  # @@tmp = "hogehoge"  
  
@@str = "str"


  def initialize
   @tmp = "piyopiyo"
  end

  def getStr
    return @@str
  end 

  attr_accessor :tmp, :str
end

h = Hoge.new

puts h.tmp
puts h.getStr


class SampleClass
  def initialize(num)
    @num = num
  end

  def getnum
    @num
  end
end

o = SampleClass.new(10)

p o

p o.getnum #=> 10
