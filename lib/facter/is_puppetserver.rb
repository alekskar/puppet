Facter.add(:is_puppetserver) do
  setcode do
    Facter.value(:hostname) == 'puppet'
  end
end 
