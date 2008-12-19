module Ffmpegger
  module Processor
    
    def convert
      vputs "Running #{first_command}"
      out = %x[#{first_command}]
      %x[#{clean_command}]
      vputs "Running #{second_command}"
      out = %x[#{second_command}]
    end
    
    def all_options
      @all_options ||= "-vcodec libx264 -b #{bitrate}000k -r #{framerate} -s #{resolution} -bf 3 -qcomp 0.7 -g #{keyint} -keyint_min #{keyintmin} -refs 5 -flags +4mv -cmp 256 -coder 0 -me_range 16 -sc_threshold 40 -i_qfactor 0.71 -level 30 -qmin 10 -qmax 51 -qdiff 4 -padcolor 000000 -padtop #{padtop} -padbottom #{padbottom} -padleft #{padleft} -padright #{padright}"
    end
    
    def first_options
      @first_options ||= "-subq 1 -me hex -partitions 0 -trellis 0 -flags2 +mixed_refs"
    end
    
    def second_options
      @second_options ||= "-subq #{subq} -me umh -partitions parti4x4+parti8x8+partp4x4+partp8x8+partb8x8 -flags2 +wpred+mixed_refs+brdo+8x8dct -trellis 1"
    end
    
    def first_command
      @command ||= "#{fpath} -y -i #{inputfile} -threads #{threads} -pass 1 -an #{all_options} #{firstoptions} -passlogfile #{logfile} #{tmpfile}"
    end
    
    def clean_command
      @clean_command ||= "rm #{tmpfile}"
    end
    
    def second_command
      @second_command ||= "#{fpath} -y -i #{inputfile} -threads #{threads} -pass 2 -acodec libfaac -ar #{audiofreq} -ab #{audiobitrate}000 -ac 2 #{all_options} #{secondoptions} -passlogfile #{logfile} #{tmpfile}"
    end
    def inputfile
      @file
    end
    def tmpfile
      options[:tmpfile] ||= "filename.flv"
    end
    def fpath
      options[:fpath] ||= %x[which ffmpeg].chomp
    end
    def bcpath
      options[:bcpath] ||= %x[which bc].chomp
    end
  end
end
