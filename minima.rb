class Minima < Formula
  homepage "https://minima.global"
  url "https://github.com/minima-global/Minima/archive/d83bd20d077e3d3f718fe169f8bb3614c98df2aa.tar.gz"
  sha256 "745055a8a39e21ae7da08bf7937a4014ac59c115b344661b074f15f9b31ba5bc"
  version "0.100.30"

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
    For running Minima with brew services, here are some useful locations...

    Logs:   #{var}/log/minima.log
    Data:   ~/.minima-brew
    Config: #{etc}/minima.conf
  EOS
  end
end
