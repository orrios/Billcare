class MeasurementsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index





  end


  def gas

  end

  def electricity
    @measurements = Measurement.all.order("created_at DESC")

    @data1 =[{x: 1258322400000,  y: 0}, {x: 1260961200000, y: 5}, {
        x: 1263639600000,
        y: 7
    }, {x: 1266188400000, y: 5}, {x: 1268740800000, y: 6}, {x: 1271368800000, y: 8}, {
                 x: 1274004000000,
                 y: 11
             }, {x: 1276639200000, y: 9}, {x: 1279274400000, y: 12}, {x: 1281952800000, y: 13}, {
                 x: 1284588000000,
                 y: 17
             }, {x: 1287223200000, y: 17}, {x: 1289858400000, y: 18}, {x: 1292497200000, y: 20}, {
                 x: 1295175600000,
                 y: 20
             }, {x: 1297724400000, y: 27}, {x: 1300276800000, y: 32}, {x: 1302904800000, y: 29}, {
                 x: 1305540000000,
                 y: 34
             }, {x: 1308175200000, y: 34}, {x: 1310810400000, y: 36}, {x: 1313488800000, y: 43}, {
                 x: 1316124000000,
                 y: 44
             }, {x: 1318759200000, y: 42}, {x: 1321394400000, y: 47}, {x: 1324033200000, y: 46}, {
                 x: 1326711600000,
                 y: 50
             }, {x: 1329303600000, y: 57}, {x: 1331899200000, y: 54}, {x: 1334527200000, y: 59}, {
                 x: 1337162400000,
                 y: 62
             }, {x: 1339797600000, y: 66}, {x: 1342432800000, y: 61}, {x: 1345111200000, y: 68}, {
                 x: 1347746400000,
                 y: 67
             }, {x: 1350381600000, y: 73}, {x: 1353016800000, y: 63}, {x: 1355655600000, y: 54}, {
                 x: 1358334000000,
                 y: 67
             }, {x: 1360882800000, y: 74}, {x: 1363435200000, y: 81}, {x: 1366063200000, y: 89}, {
                 x: 1368698400000,
                 y: 83
             }, {x: 1371333600000, y: 88}, {x: 1373968800000, y: 86}, {x: 1376647200000, y: 81}, {
                 x: 1379282400000,
                 y: 83
             }, {x: 1381917600000, y: 95}, {x: 1384552800000, y: 86}, {x: 1387191600000, y: 83}, {
                 x: 1389870000000,
                 y: 89
             }, {x: 1392418800000, y: 90}, {x: 1394971200000, y: 94}, {x: 1397599200000, y: 100}, {
                 x: 1400234400000,
                 y: 100
             }, {x: 1402869600000, y: 99}, {x: 1405504800000, y: 99}, {x: 1408183200000, y: 93}, {
                 x: 1410818400000,
                 y: 97
             }, {x: 1413453600000, y: 98}]

    winter_limit = 700
    @data1 = Measurement.all.sort_by{|measure| measure.time}
    @data1 = @data1.map {|measure| {x: measure.time, y:measure.value}}
    #@data1 = @data1.sort_by {|v| v[:x]}
    min_time = @data1.first[:x]
    max_time = @data1.last[:x]
    @data2 = [[min_time,winter_limit],[max_time, winter_limit]]
    @data3 = [[min_time, 0],[max_time, winter_limit]]

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
    Measurement.create :value => params[:value], :time => params[:time]
    render :nothing => true
  end
end



private
  def measurement_params
    params.require(:measurement).permit(:value, :time)
  end