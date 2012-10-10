class CodeDialog

  def initialize
    @buffer = nil
    @pos = 0
  end

  def read(cbuf = [], off, len)
    if @buffer == nil
      @in = showDialog()

      if @in == nil
        return -1
      else
        p @in
        @buffer = @in + "\n"
        @pos = 0
      end
    end

    @size = 0
    @length = @buffer.length
    cbuf = []

    while @pos < @length && @size < len
      i = off + @size++
      cbuf[i] = @buffer[@pos+=1]
    end
    if @pos == @length
      @buffer = nil
    end

    return @size
  end
  
  def close
    p "close"
  end

  def showDialog
    while true
      x = gets
      s += x

      if x.to_s == "end"
        return 
      end
    end
  end
  

end
