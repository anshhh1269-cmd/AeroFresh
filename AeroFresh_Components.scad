// -----------------------------------------------------------
// AERO FRESH – Full Rubber Tile Electronics Assembly (3D)
// Size: 180 mm x 120 mm
// -----------------------------------------------------------

tile_w = 180;
tile_h = 120;
tile_t = 5;

// Base Plate (Rubber Tile)
module rubber_tile() {
    color([0.25,0.18,0.10])
        cube([tile_w, tile_h, tile_t]);
}

// Generic Component Block
module comp(x,y,z,w,h,t,c=[0,0,1],label="") {
    translate([x,y,z])
    color(c)
        cube([w,h,t]);

    // label above part
    translate([x + w/2, y + h/2, z + t + 0.5])
        color([1,1,1])
            linear_extrude(0.5)
                text(label, size = 6, halign="center", valign="center");
}

// Wires – as 2mm thick tubes
module wire(p1=[0,0,0], p2=[10,0,0], c=[1,0,0]) {
    color(c)
        hull() {
            translate(p1) sphere(1);
            translate(p2) sphere(1);
        }
}

// -----------------------------------------------------------
// COMPONENT PLACEMENT (based on your reference image)
// -----------------------------------------------------------

// ESP32
esp32_pos = [15, 20, tile_t];
comp(esp32_pos[0], esp32_pos[1], esp32_pos[2],
     40, 60, 6, c=[0.1,0.1,0.1], label="ESP32");

// TP4056 charger
tp_pos = [95, 65, tile_t];
comp(tp_pos[0], tp_pos[1], tp_pos[2],
     35, 25, 5, c=[0.0,0.3,1], label="TP4056");

// MT3608 step-up
mt_pos = [75, 35, tile_t];
comp(mt_pos[0], mt_pos[1], mt_pos[2],
     30, 20, 5, c=[0.1,0.5,1], label="MT3608");

// GY-521 Accelerometer
gyro_pos = [20, 80, tile_t];
comp(gyro_pos[0], gyro_pos[1], gyro_pos[2],
     25, 30, 5, c=[0.0,0.4,1], label="GY-521");

// MOSFET Pack
mos1_pos = [75, 10, tile_t];
comp(mos1_pos[0], mos1_pos[1], mos1_pos[2],
     18, 20, 7, c=[0.05,0.05,0.05], label="MOSFET1");

mos2_pos = [98, 10, tile_t];
comp(mos2_pos[0], mos2_pos[1], mos2_pos[2],
     18, 20, 7, c=[0.05,0.05,0.05], label="MOSFET2");

// Fan
fan_pos = [130, 60, tile_t];
comp(fan_pos[0], fan_pos[1], fan_pos[2],
     35, 35, 8, c=[0.1,0.1,0.1], label="FAN");

// LED Ring
ring_pos = [140, 30, tile_t];
color([1,1,1])
translate([ring_pos[0], ring_pos[1], ring_pos[2]])
    cylinder(h=4, d=30, center=false);

// Air pump
air_pos = [135, 95, tile_t];
comp(air_pos[0], air_pos[1], air_pos[2],
     40, 25, 8, c=[0.1,0.1,0.1], label="AIR PUMP");

// Battery
bat_pos = [10, 100, tile_t];
comp(bat_pos[0], bat_pos[1], bat_pos[2],
     45, 25, 10, c=[0.4,0.4,0.4], label="BATTERY");

// -----------------------------------------------------------
// WIRES (simplified clean wiring)
// -----------------------------------------------------------

// Color Legend:
// 5V = RED
// 3.3V = ORANGE
// GND = BLACK
// Signal = YELLOW

// ESP32 ⇢ TP4056 (Signal Example)
wire([esp32_pos[0]+40, esp32_pos[1]+30, tile_t+3],
     [tp_pos[0], tp_pos[1]+10, tile_t+3],
     [1,1,0]); // yellow

// ESP32 ⇢ MT3608
wire([esp32_pos[0]+40, esp32_pos[1]+10, tile_t+3],
     [mt_pos[0], mt_pos[1]+10, tile_t+3],
     [1,0.5,0]); // orange

// TP4056 ⇢ FAN (5V red)
wire([tp_pos[0]+35, tp_pos[1]+5, tile_t+3],
     [fan_pos[0], fan_pos[1]+10, tile_t+3],
     [1,0,0]);

// FAN GND (black)
wire([fan_pos[0]+5, fan_pos[1]+35, tile_t+3],
     [esp32_pos[0], esp32_pos[1]+55, tile_t+3],
     [0,0,0]);

// -----------------------------------------------------------

rubber_tile();

