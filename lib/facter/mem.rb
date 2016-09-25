Facter.add(:mem_to_allocate) do
  setcode do
    if Facter.value(:memorysize_mb).to_f < 1024
      '512m'
    elsif Facter.value(:memorysize_mb).to_f < 2048
      '1g'
    elsif Facter.value(:memorysize_mb).to_f < 4096
      '2g'
    else
      '4g'
    end
  end
end

