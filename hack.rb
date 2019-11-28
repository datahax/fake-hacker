#!/usr/bin/env ruby
# frozen_string_literal: true

require 'curses'

def main
  filename = 'DOOM/linuxdoom-1.10/p_pspr.c'
  chunk_size = 40
  current_pos = 0
  file_data = File.read(filename)

  Curses.init_screen
  Curses.noecho # do not show typed keys
  Curses.stdscr.scrollok true

  puts "Hacking #{filename}"

  loop do
    # Get a chunk
    chunk = file_data.slice(current_pos, chunk_size)

    # Print the chunk
    unless Curses.getch.nil?
      Curses.addstr(chunk)
      Curses.refresh
    end

    # Update chunk position
    current_pos += chunk_size
  end
end

main
