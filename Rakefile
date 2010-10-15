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

desc "Init and update submodules"
task :submodule do
  system "git submodule init"
  system "git submodule update"
end

desc "Compile Command-T plugin for vim"
task :"command-t" do
  if File.exists? "vim/bundle/command-t"
    if system "cd vim/bundle/command-t/ruby/command-t && ruby extconf.rb && make && make install"
      puts_green "Command-T installed. You win!"
    end
  else
    puts_red "Command T submodule not found, run `rake submodule` to fetch it"
  end
end

desc "create simlinks to the files in the user's home dir"
task :home do
  puts_blue "linking files"
  Dir["home/*"].each do |f|
    symlink_home("#{f}", ".#{File.basename f}")
  end

  symlink_home('vim', '.vim')
  symlink_home('bin', 'bin')
end

desc "create simlinks to the xcode color scheme in the user's Library/Application Support"
task :xcode do
  # TODO: refactor the symlink code, this is ugly
  puts_blue "linking colorscheme files"
  color_themes_dir = File.join( ENV['HOME'], "Library", "Application Support", "Xcode", "Color Themes")
  FileUtils.mkdir_p(color_themes_dir)
  FileUtils.rm(File.join(color_themes_dir, "RistoInk.xccolortheme")) if File.symlink?(File.join(File.dirname(__FILE__)))
  puts File.join(File.dirname(__FILE__), "xcode", "RistoInk.xccolortheme")
  FileUtils.ln_s(File.join(File.dirname(__FILE__), "xcode", "RistoInk.xccolortheme"), color_themes_dir)

end

desc "Configure dotfiles to use zsh"
task :zsh do
  if system "which zsh"
    puts "Change shell to use zsh"
    system "chsh -s `which zsh`"
    system "git submodule init oh-my-zsh"
    system "git submodule update oh-my-zsh"
  else 
    puts "Error: zsh is not installed on your system, or not in your path."
  end

end

desc "Update all bundles"
task :updatebundle do
  dir = File.dirname(__FILE__)
  Dir["vim/bundle/*"].each do |n|
    puts "Updating #{n}"
    `cd #{n};git pull; cd #{dir}`
  end

end

