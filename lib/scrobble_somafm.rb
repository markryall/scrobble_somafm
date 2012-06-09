module ScrobbleSomafm
  def self.start args
    begin
      play args.shift do |artist, track|
        puts "Now Playing: #{track} by #{artist}"
      end
    rescue Interrupt
    end
  end

  def self.find_channel text
    %w{secretagent doomed groovesalad illstreet indiepop lush sonicuniverse spacestation}.grep(/#{text}/).first
  end

  def self.play text
    channel = find_channel text    
    abort "Unknown channel #{text}" unless channel
    puts "Playing channel #{channel}"
    IO.popen "mplayer -quiet -vo none -ao coreaudio http://somafm.com/startstream=#{channel}.pls 2>&1" do |io|
      while line = io.gets
        parse(line) { |artist, track| yield artist, track }
      end
    end
  end

  def self.parse line
    yield $1, $2 if line =~ /ICY Info: StreamTitle='(.*) - (.*)';StreamUrl='(.*)';/
  end

  def self.abort message
    puts message
    exit 0
  end
end
