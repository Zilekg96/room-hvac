model Room
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor RoomAir(C = 60000, T(start = 288.15, fixed = true))  annotation(
    Placement(transformation(origin = {0, 2}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor HeatLosses(G = 25)  annotation(
    Placement(transformation(origin = {38, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature OutsideTemperature(T = 278.15)  annotation(
    Placement(transformation(origin = {74, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow Heater annotation(
    Placement(transformation(origin = {-32, -8}, extent = {{-10, -10}, {10, 10}})));
  Buildings.Controls.Continuous.LimPID PID(k = 10, Ti = 0.001, yMax = 2000, yMin = 0)  annotation(
    Placement(transformation(origin = {-66, -8}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor TemperatureSensor annotation(
    Placement(transformation(origin = {-10, -42}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  Modelica.Blocks.Sources.Constant PrescribedTemperature(k = 295.15)  annotation(
    Placement(transformation(origin = {-112, -8}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(RoomAir.port, HeatLosses.port_a) annotation(
    Line(points = {{0, -8}, {0, -19}, {28, -19}, {28, 0}}, color = {191, 0, 0}));
  connect(OutsideTemperature.port, HeatLosses.port_b) annotation(
    Line(points = {{64, 0}, {48, 0}}, color = {191, 0, 0}));
  connect(Heater.port, RoomAir.port) annotation(
    Line(points = {{-22, -8}, {0, -8}}, color = {191, 0, 0}));
  connect(PID.y, Heater.Q_flow) annotation(
    Line(points = {{-55, -8}, {-42, -8}}, color = {0, 0, 127}));
  connect(RoomAir.port, TemperatureSensor.port) annotation(
    Line(points = {{0, -8}, {0, -42}}, color = {191, 0, 0}));
  connect(TemperatureSensor.T, PID.u_m) annotation(
    Line(points = {{-21, -42}, {-66, -42}, {-66, -20}}, color = {0, 0, 127}));
  connect(PrescribedTemperature.y, PID.u_s) annotation(
    Line(points = {{-100, -8}, {-78, -8}}, color = {0, 0, 127}));

annotation(
    uses(Modelica(version = "4.0.0"), Buildings(version = "12.1.0")));
end Room;
