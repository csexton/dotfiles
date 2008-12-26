# Create a simlink in the user's home directory from the files in ./home
# src - file name of a file in .home/
# dest - name of the symlink to create in $HOME
def symlink_home(src, dest)
  home_dir = ENV['HOME']
  if( !File.exists?(File.join(home_dir, dest)) || File.symlink?(File.join(home_dir, dest)) )
    # FileUtils.ln_sf was making odd nested links, and this works.
    FileUtils.rm(File.join(home_dir, dest), :verbose => true) if File.exists?(File.join(home_dir, dest))
    FileUtils.ln_s(File.join(File.dirname(__FILE__), src), File.join(home_dir, dest), :verbose => true)
  else
    puts "Unable to symlink #{dest} because it exists and is not a symlink"
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
  puts "Linking files"
  Dir["home/*"].each do |f|
    symlink_home("home/#{f}", ".#{f}")
  end

  symlink_home('vim', '.vim')
end
