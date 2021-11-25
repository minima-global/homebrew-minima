class Minima < Formula
  homepage "https://minima.global"
  head "https://github.com/minima-global/Minima.git", branch: "feature-homebrew"
  version "test-1"

  depends_on "openjdk@11"

  def install
      inreplace "brew/minima" do |s|
      	s.gsub! "##PREFIX##", "#{prefix}"
      	s.gsub! "##HOMEBREW_PREFIX##", "#{HOMEBREW_PREFIX}"
      end      
      inreplace "mcli/brew/mcli" do |s|
      	s.gsub! "##PREFIX##", "#{prefix}"
      	s.gsub! "##HOMEBREW_PREFIX##", "#{HOMEBREW_PREFIX}"
      end      
      inreplace "brew/minima.plist" do |s|
      	s.gsub! "##BIN##", "#{bin}"
      	s.gsub! "##PLIST_NAME##", "#{plist_name}"
      	s.gsub! "##HOMEBREW_PREFIX_ETC##", "#{etc}"
        s.gsub! "##HOMEBREW_PREFIX_LOG##", "#{var}/log"
      end      
      prefix.install "brew/minima.plist", "jar/minima.jar", "mcli/jar/mcli.jar" 
      prefix.install_symlink "minima.plist" => "#{plist_name}.plist"
      etc.install "brew/minima.conf" => "minima.conf" unless File.exists? etc/"minima.conf"
      bin.install "brew/minima" => "minima"
      bin.install "mcli/brew/mcli" => "mcli"
      (var/"log").mkpath unless File.exists? var/"log"
  end

  def caveats; <<~EOS
    For running Minima with brew services, here some intereting locations...

    Logs:   #{var}/log/minima.log
    Data:   ~/.minima-brew
    Config: #{etc}/minima.conf
  EOS
  end
end
