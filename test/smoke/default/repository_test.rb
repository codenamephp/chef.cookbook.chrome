describe apt('http://dl.google.com/linux/chrome/deb/') do
  it { should exist }
  it { should be_enabled }
end
