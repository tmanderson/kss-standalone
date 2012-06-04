#!/usr/bin/env ruby
require 'rubygems'
require 'kss'
require 'erb'

@cssdir = ARGV.shift()
@template = '';
@output = '';
@example_html;
@styleguide_block = '';

@styles = Kss::Parser.new(@cssdir)
@_out_buf = '';

File.open('templates/styleguide.html').each {
    |line| @template << line
}

File.open('templates/_styleguide_block.html').each {
    |line| @styleguide_block << line
}

def styleguide_block(section,element, &block)
    @section = @styles.section(section)
    @example_html = element
    @output << ERB.new(@styleguide_block,0).result();
end

if ARGV.length != 0
    ARGV.each do |sec|
        @section = @styles.section(sec)
        @output << ERB.new(@template, nil, nil, '@output').result();
    end 
else
    @output = ERB.new(@template, nil, nil, '@output').result();
end



File.open('cssdocs.html', 'w+') {
    |f| f.write(@output)
}
