def puts_red(str)
  puts "  \e[00;31m#{str}\e[00m"
end
def puts_green(str)
  puts "  \e[00;32m#{str}\e[00m"
end
def puts_blue(str)
  puts "  \e[00;34m#{str}\e[00m"
end

# Create a simlink in the user's home directory from the files in ./home
# src - file name of a file in .home/
# dest - name of the symlink to create in $HOME
def symlink_home(src, dest)
  home_dir = ENV['HOME']
  if( !File.exists?(File.join(home_dir, dest)) || File.symlink?(File.join(home_dir, dest)) )
    # FileUtils.ln_sf was making odd nested links, and this works.
    FileUtils.rm(File.join(home_dir, dest)) if File.symlink?(File.join(home_dir, dest))
    FileUtils.ln_s(File.join(File.dirname(__FILE__), src), File.join(home_dir, dest))
    puts_green "  #{dest} -> #{src}"
  else
    puts_red "  Unable to symlink #{dest} because it exists and is not a symlink"
  end
end 

# Detect if this is a mac
def mac?
  RUBY_PLATFORM =~ /darwin/i
end

# Detect if this is linux
def linux?
  RUBY_PLATFORM =~ /linux/i
end

desc "create simlinks to the files in the user's home dir"
task :symlink do
  puts_blue "linking files"
  dir["home/*"].each do |f|
    symlink_home("#{f}", ".#{file.basename f}")
  end

  symlink_home('vim', '.vim')
end

desc "create simlinks to the xcode color scheme in the user's Library/Application Support"
task :symlink_xcode do
  # TODO: refactor the symlink code, this is ugly
  puts_blue "linking colorscheme files"
  color_themes_dir = File.join( ENV['HOME'], "Library", "Application Support", "Xcode", "Color Themes")
  FileUtils.mkdir_p(color_themes_dir)
  FileUtils.rm(File.join(color_themes_dir, "RistoInk.xccolortheme")) if File.symlink?(File.join(File.dirname(__FILE__)))
  puts File.join(File.dirname(__FILE__), "xcode", "RistoInk.xccolortheme")
  FileUtils.ln_s(File.join(File.dirname(__FILE__), "xcode", "RistoInk.xccolortheme"), color_themes_dir)

end
