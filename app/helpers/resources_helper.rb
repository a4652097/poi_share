module ResourcesHelper
  def release_time(time)
    @release_time=0
    @release_time=DateTime.parse(Time.now.to_time.strftime('%Y-%m-%d'))- DateTime.parse(time.to_time.strftime('%Y-%m-%d'))
    return @release_time.to_i
  end
end
