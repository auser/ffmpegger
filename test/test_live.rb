# Just test usage, everything else has been tested
require File.dirname(__FILE__) + '/../lib/ffmpegger'

Ffmpegger.convert "#{File.dirname(__FILE__)}/samples/cb.mov" do
  verbose true
  resolution "720x480"
  bitrate "500"
end