require 'terminfo'

# add colors
class String
  def colorize(bg)
    "\e[0;0;#{bg}m#{self}\e[0;0m"
  end
end


# TVTVTV
class TV
  @Version = 0.1
  def initialize(args)
    setup_colors
    opts args
    resize
    parse args
  end

  private
  def opts(args)
    args.select { |arg| arg.chr == "-" }.map do |arg|
      case arg
      when "-v", "--version"
        puts @Version
        exit 0
      when "--wavy"
        @wavy = true
      when "--test"
        @test = true
      end
    end
  end

  def parse(args)
    args = args.select { |arg| arg.chr != "-" }

    if @test
      testing

    else
      set_bg args.first
      endless
    end
  end

  def setup_colors
    blk = 40
    red = 41
    grn = 42
    yel = 43
    blu = 44
    ppl = 45
    cyn = 46
    gry = 47
    pnk = 101
    wht = 107

    # backgrounds
    @patts = {}
    @patts['bw'] =    [blk, blk, wht, blk, wht, blk, blk, wht, wht]
    @patts['xmas'] =  [grn, grn, red, red, grn, grn, red, red, red]
    @patts['error'] = [wht, gry, yel, cyn, grn, pnk, red, blu, blk]
    @patts['rasta'] = [blk, grn, grn, yel, yel, red, red, blk, blk]
    @patts['pride'] = [blk, ppl, blu, cyn, grn, yel, pnk, red, blk]

    # pride for testing!
    @patt = @patts['pride']
    @colors = @patt.length
  end

  def resize
    @width = current_width
    @colorwidth = (@width / @colors).floor
    @offset = @wavy? offset : [1]
  end

  def current_width
    TermInfo.screen_size[1]
  end

  # makes offset sample avg = offset difference. for example, if we have a final
  # gap of 3 characters, and a color width of 5, we would want to add 1 to the
  # width of three colors. on average, we can achieve this by sampling from an
  # array whose average is 3/5 - or [0,0,1,1,1].
  #
  # in general, the array of 0s and 1s whose average is equal to a rational
  # fraction x/y such that (x/y) < 1 and >= 0 is composed of y-x 0s and x 1s.
  def offset
    off = []

    ones = @width % @colorwidth
    zeros = @colorwidth - ones

    ones.times { |_| off << 1 }
    zeros.times { |_| off << 0 }

    off
  end

  def tvline
    resize unless @width == current_width

    @patt.each do |bg|
      space = " " * (@colorwidth + @offset.sample)

      print space.colorize bg
    end

    sleep 0.01 # still tunable...
  end

  def helper
    print "Select a pattern (" << @patts.keys.join(", ") << "): "
    parse [] << $stdin.gets.chomp
  end

  def set_bg(color)
    if @patts.keys.include? color
      @patt = @patts[color]
    else
      helper
    end
  end

  def testing
    100.times { |_| tvline }
  end

  def endless
    puts "Turning on the TV... press Ctrl-C to quit."
    sleep 1

    begin
      while true do tvline end
    rescue Interrupt => e
      puts "\nThanks for watching!"
      exit 0
    end
  end
end

