class MeasurementsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index

  end


  def gas

  end

  def electricity
    if Measurement.first
    else
      Measurement.create([{value: 0, time: Time.now}])
    end

    @data1 = Measurement.all.sort_by{|measure| measure.time}
    @data1 = @data1.map {|measure| {x: measure.time*1000, y:measure.value}}
    @data1 = @data1
    winter_limit = @data1.last[:y]
    @min_time = @data1.first[:x]
    @max_time = @min_time+(1000*60*5) #los 1000 es un segundo. se quieren ver 5 minutos
    @data2 = [[@min_time,0.05],[@max_time, 0.05]]
    @data3 = [[@min_time, 0],[@max_time, 0.05]]

    render :index
  end

  def water

  end

  def new
    @measurement = measurement.new
  end
  def asd

  end

  def create
    @measurement = Measurement.new(measurement_params)
  end

  def addition
    if Measurement.first
      Measurement.create :value => params[:value].to_f*4*220/(1000*3600)+Measurement.last.value.to_f, :time => params[:time].to_i # *4*220/(1000*3600) es para transformar a Kw/h
      if Measurement.last.time - Measurement.first.time > 300
        Measurement.delete_all
      end
    else
      Measurement.create :value => params[:value].to_f*4*220/(1000*3600), :time => params[:time].to_i
    end

    render :nothing => true
  end
end



private
  def measurement_params
    params.require(:measurement).permit(:value, :time)
  end