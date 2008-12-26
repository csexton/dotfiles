# Create a simlink in the user's home directory from the files in ./home
# src - file name of a file in .home/
# dest - name of the symlink to create in $HOME
def symlink_home(src, dest)
  home_dir = ENV['HOME']
  if( !File.exists?(File.join(home_dir, dest)) || File.symlink?(File.join(home_dir, dest)) )
    # FileUtils.ln_sf was making odd nested links, and this works.
    FileUtils.rm(File.join(home_dir, dest)) if File.symlink?(File.join(home_dir, dest))
    FileUtils.ln_s(File.join(File.dirname(__FILE__), src), File.join(home_dir, dest))
    puts "  \e[00;32m #{dest} -> #{src}\e[00m"
  else
    puts "  \e[00;31mUnable to symlink #{dest} because it exists and is not a symlink\e[00m"
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

desc "Create simlinks to the files in the user's home dir"
task :symlink do
  puts "\e[01;32mLinking files\e[00m"
  Dir["home/*"].each do |f|
    symlink_home("#{f}", ".#{File.basename f}")
  end

  symlink_home('vim', '.vim')
end
