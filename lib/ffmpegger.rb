$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

Dir["#{File.dirname(__FILE__)}/ffmpegger/*.rb"].each {|f| require f }

module Ffmpegger
  def self.convert(file, opts={}, &block)
    FFMpegConverter.convert(file, opts, &block)
  end
  class FFMpegConverter
    include Dsl, Configurable, Processor
    
    default_options({
      :threads => 1,
      :framerate => 30,
      :resolution => "640x480",
      :audiofreq => 44100,
      :audiobitrate => 96000,
      :bitrate => 2,
      :ptop => 0,
      :pbottom => 0,
      :pleft => 0,
      :pright => 0,
      :qcomp => 1,
      :subq => 6,
      :fpath => "/usr/local/bin/ffmpeg"
    })
    
    def initialize(file, opts={}, &block)
      @file = file
      set_vars_from_options opts
      instance_eval &block if block
      convert
    end
    
    def self.convert(file, opts={}, &block)
      new(file, opts, &block).convert
    end
    
  end
end