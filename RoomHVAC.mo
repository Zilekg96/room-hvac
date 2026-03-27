model Room
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor RoomAir(C = 60000, T(start = 288.15, fixed = true, displayUnit = "K"))  annotation(
    Placement(transformation(origin = {0, 2}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor HeatLosses(G = 25)  annotation(
    Placement(transformation(origin = {38, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow Heater annotation(
    Placement(transformation(origin = {-32, -8}, extent = {{-10, -10}, {10, 10}})));
  Buildings.Controls.Continuous.LimPID PID(k = 10, Ti = 0.001, yMax = 2000, yMin = 0)  annotation(
    Placement(transformation(origin = {-66, -8}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor TemperatureSensor annotation(
    Placement(transformation(origin = {-10, -42}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  Modelica.Blocks.Sources.TimeTable PrescribedTemperature(table = [0, 295.15; 900, 296.56; 1800, 297.15; 2700, 296.56; 3600, 295.15; 4500, 293.74; 5400, 293.15; 6300, 293.74; 7200, 295.15])  annotation(
    Placement(transformation(origin = {-106, -8}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature annotation(
    Placement(transformation(origin = {78, 0}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  Modelica.Blocks.Sources.TimeTable OutsideTemperature(table = [0, 288.15; 1800, 286.15; 3600, 283.15; 5400, 280.15; 7200, 278.15])  annotation(
    Placement(transformation(origin = {120, 0}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
equation
  connect(RoomAir.port, HeatLosses.port_a) annotation(
    Line(points = {{0, -8}, {0, -19}, {28, -19}, {28, 0}}, color = {191, 0, 0}));
  connect(Heater.port, RoomAir.port) annotation(
    Line(points = {{-22, -8}, {0, -8}}, color = {191, 0, 0}));
  connect(PID.y, Heater.Q_flow) annotation(
    Line(points = {{-55, -8}, {-42, -8}}, color = {0, 0, 127}));
  connect(RoomAir.port, TemperatureSensor.port) annotation(
    Line(points = {{0, -8}, {0, -42}}, color = {191, 0, 0}));
  connect(TemperatureSensor.T, PID.u_m) annotation(
    Line(points = {{-21, -42}, {-66, -42}, {-66, -20}}, color = {0, 0, 127}));
  connect(PrescribedTemperature.y, PID.u_s) annotation(
    Line(points = {{-95, -8}, {-78, -8}}, color = {0, 0, 127}));
  connect(OutsideTemperature.y, prescribedTemperature.T) annotation(
    Line(points = {{110, 0}, {90, 0}}, color = {0, 0, 127}));
  connect(prescribedTemperature.port, HeatLosses.port_b) annotation(
    Line(points = {{68, 0}, {48, 0}}, color = {191, 0, 0}));
  annotation(
    uses(Modelica(version = "4.0.0"), Buildings(version = "12.1.0")));
end Room;
