module ScrobbleSomafm
  def self.start args
    begin
      play 'secretagent' do |artist, track|
        puts "Now Playing: #{track} by #{artist}"
      end
    rescue Interrupt
    end
  end

  def self.play channel
    IO.popen "mplayer -quiet -vo none -ao coreaudio http://somafm.com/startstream=#{channel}.pls 2>&1" do |io|
      while line = io.gets
        parse(line) { |artist, track| yield artist, track }
      end
    end
  end

  def self.parse line
    yield $1, $2 if line =~ /ICY Info: StreamTitle='(.*) - (.*)';StreamUrl='(.*)';/
  end
end
