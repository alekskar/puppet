Facter.add(:mem_to_allocate) do
  setcode do
#    if Facter.value(:memorysize_mb) < 1024
     if $::memorysize_mb < 1024
      '512m'
#    elsif Facter.value(:memorysize_mb) < 2048
     elsif $::memorysize_mb < 2048
      '1g'
#    elsif Facter.value(:memorysize_mb) < 4048
     elsif $::memorysize_mb < 4096
      '2g'
    else
      '4g'
    end
  end
end
