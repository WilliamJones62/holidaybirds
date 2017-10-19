class HolidaybirdController < ApplicationController

  def fsv
    set_variables 'FSV'
  end

  def ret
    set_variables 'RET'
  end

  def consumer
    set_variables 'CON'
  end

  def fsr
    set_variables 'FSR'
  end

  def totals
    everything = Holidaybird.all
    sku_array = Array.new
    @main = Array.new
    everything.each do |s|
      if !sku_array.include?(s.sku)
        sku_array.push(s.sku)
        shipped = 0
        ordered = 0
        forecast = 0
        harvest = 0
        first_instances_of_sku = Holidaybird.where(sku: s.sku).first
        all_instances_of_sku = Holidaybird.where(sku: s.sku).all
        all_instances_of_sku.each do|t|
          shipped += t.shipped
          ordered += t.ordered
          forecast += t.forecast
          harvest += t.harvest
        end
        first_instances_of_sku.shipped = shipped
        first_instances_of_sku.ordered = ordered
        first_instances_of_sku.forecast = forecast
        first_instances_of_sku.harvest = harvest
        @main.push(first_instances_of_sku)
      end
    end
    @main = @main.sort_by &:sku
    @date = get_db_timestamp
  end

  def set_variables (channel)
    @main = Holidaybird.where(channel: channel).all
    @main = @main.sort_by &:sku
    @date = get_db_timestamp
  end

  def get_db_timestamp
    first = Holidaybird.first
    date = first.datetime
  end
end
