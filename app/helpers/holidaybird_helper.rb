module HolidaybirdHelper
  def display_stamp(datetime)
    formatted = datetime.strftime("%I:%M:%S %p on %A %B %d %Y")
  end
end
