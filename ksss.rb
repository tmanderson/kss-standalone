#!/usr/bin/env ruby
require 'rubygems'
require 'kss'
require 'erb'

@cssdir = ARGV.shift()
@template = '';
@output;

File.open('mytemplate.html').each {
	|line| @template << line
}

@styles = Kss::Parser.new(@cssdir)

if ARGV.length
	ARGV.each do |sec|
		@section = @styles.section(sec)
		@output = ERB.new(@template, 0).result();
	end 
end

File.open('cssdocs.html', 'w+') {
 	|f| f.write(@output)
}