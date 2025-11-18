// Air Freshener Drone Base Tile Assembly - HIGH QUALITY
// Complete component layout with ALL wiring and detailed labels
// Author: Drone Design
// Scale: 1:1 for reference

// Base Parameters
BASE_WIDTH = 300;
BASE_LENGTH = 350;
BASE_HEIGHT = 15;
RUBBER_THICKNESS = 10;

// Component positions (x, y, z from base center)
ESP32_X = -100;
ESP32_Y = -110;
ESP32_Z = RUBBER_THICKNESS + 5;

TP4056_X = -100;
TP4056_Y = -20;
TP4056_Z = RUBBER_THICKNESS + 5;

BATTERY_X = -100;
BATTERY_Y = 80;
BATTERY_Z = RUBBER_THICKNESS + 8;

MT3608_X = 0;
MT3608_Y = -110;
MT3608_Z = RUBBER_THICKNESS + 5;

VOLTAGE_REG_X = 0;
VOLTAGE_REG_Y = 0;
VOLTAGE_REG_Z = RUBBER_THICKNESS + 5;

MOSFET_X = 0;
MOSFET_Y = 110;
MOSFET_Z = RUBBER_THICKNESS + 5;

WS2812B_X = 100;
WS2812B_Y = -110;
WS2812B_Z = RUBBER_THICKNESS + 5;

PUMP_X = 100;
PUMP_Y = -20;
PUMP_Z = RUBBER_THICKNESS + 5;

GY521_X = 100;
GY521_Y = 80;
GY521_Z = RUBBER_THICKNESS + 5;

FAN_X = 0;
FAN_Y = 0;
FAN_Z = RUBBER_THICKNESS + 12;

HEATER_X = 50;
HEATER_Y = -50;
HEATER_Z = RUBBER_THICKNESS + 5;

SWITCH_X = -50;
SWITCH_Y = -50;
SWITCH_Z = RUBBER_THICKNESS + 8;

SCENT_OIL_X = 0;
SCENT_OIL_Y = 0;
SCENT_OIL_Z = RUBBER_THICKNESS + 30;

// Wire connection nodes for all connections
// Battery outputs
BATT_POS = [BATTERY_X - 30, BATTERY_Y, BATTERY_Z + 10];
BATT_NEG = [BATTERY_X + 30, BATTERY_Y, BATTERY_Z + 10];

// TP4056 nodes
TP4056_IN_POS = [TP4056_X - 15, TP4056_Y, TP4056_Z + 5];
TP4056_IN_NEG = [TP4056_X + 15, TP4056_Y, TP4056_Z + 5];
TP4056_OUT_POS = [TP4056_X - 15, TP4056_Y + 15, TP4056_Z + 5];
TP4056_OUT_NEG = [TP4056_X + 15, TP4056_Y + 15, TP4056_Z + 5];

// MT3608 nodes
MT3608_IN_POS = [MT3608_X - 12, MT3608_Y, MT3608_Z + 4];
MT3608_IN_NEG = [MT3608_X + 12, MT3608_Y, MT3608_Z + 4];
MT3608_OUT_POS = [MT3608_X - 12, MT3608_Y + 12, MT3608_Z + 4];
MT3608_OUT_NEG = [MT3608_X + 12, MT3608_Y + 12, MT3608_Z + 4];

// Voltage Regulator nodes
VREG_IN_POS = [VOLTAGE_REG_X - 8, VOLTAGE_REG_Y, VOLTAGE_REG_Z + 3];
VREG_IN_NEG = [VOLTAGE_REG_X + 8, VOLTAGE_REG_Y, VOLTAGE_REG_Z + 3];
VREG_OUT_POS = [VOLTAGE_REG_X - 8, VOLTAGE_REG_Y + 10, VOLTAGE_REG_Z + 3];
VREG_OUT_NEG = [VOLTAGE_REG_X + 8, VOLTAGE_REG_Y + 10, VOLTAGE_REG_Z + 3];

// ESP32 nodes
ESP32_5V = [ESP32_X - 15, ESP32_Y + 20, ESP32_Z + 7.5];
ESP32_GND = [ESP32_X + 15, ESP32_Y + 20, ESP32_Z + 7.5];
ESP32_GPIO_PUMP = [ESP32_X - 15, ESP32_Y - 20, ESP32_Z + 7.5];
ESP32_GPIO_LED = [ESP32_X + 15, ESP32_Y - 20, ESP32_Z + 7.5];
ESP32_SDA = [ESP32_X - 10, ESP32_Y, ESP32_Z + 7.5];
ESP32_SCL = [ESP32_X + 10, ESP32_Y, ESP32_Z + 7.5];

// MOSFET nodes
MOSFET_GATE = [MOSFET_X - 5, MOSFET_Y, MOSFET_Z + 4];
MOSFET_SOURCE = [MOSFET_X + 5, MOSFET_Y - 10, MOSFET_Z + 4];
MOSFET_DRAIN = [MOSFET_X + 5, MOSFET_Y + 10, MOSFET_Z + 4];

// Pump nodes
PUMP_POS = [PUMP_X - 5, PUMP_Y, PUMP_Z + 5];
PUMP_NEG = [PUMP_X + 5, PUMP_Y, PUMP_Z + 5];

// Heater nodes
HEATER_POS = [HEATER_X - 12, HEATER_Y, HEATER_Z + 4];
HEATER_NEG = [HEATER_X + 12, HEATER_Y, HEATER_Z + 4];

// Fan nodes
FAN_POS = [FAN_X - 15, FAN_Y, FAN_Z + 5];
FAN_NEG = [FAN_X + 15, FAN_Y, FAN_Z + 5];

// WS2812B nodes
LED_POS = [WS2812B_X, WS2812B_Y, WS2812B_Z + 3];
LED_GND = [WS2812B_X, WS2812B_Y + 10, WS2812B_Z + 3];
LED_DATA = [WS2812B_X, WS2812B_Y - 10, WS2812B_Z + 3];

// GY521 nodes
GY521_SDA = [GY521_X - 5, GY521_Y, GY521_Z + 4];
GY521_SCL = [GY521_X + 5, GY521_Y, GY521_Z + 4];
GY521_GND = [GY521_X, GY521_Y - 8, GY521_Z + 4];
GY521_3V3 = [GY521_X, GY521_Y + 8, GY521_Z + 4];

// Helper functions

// Enhanced label with background box
module label(text, position, size=5, rotation=[0,0,0], color="black") {
    translate(position)
        rotate(rotation)
            group() {
                // Label text
                color(color)
                    linear_extrude(height=0.8)
                        text(text, size=size, font="Arial", halign="center", valign="center");
            }
}

// Advanced ESP32 module
module esp32_module() {
    // Main board
    color("royalblue") cube([38, 48, 15], center=true);
    // Gold pads
    color("gold") translate([-19, -24, 8]) cube([2, 2, 3], center=true);
    // Pin headers - Left side
    for(i=[0:7]) {
        translate([-19, -24+i*6, 11]) {
            color("black") cube([1, 2, 4], center=true);
            color("gold") cube([1.5, 2.5, 1], center=true);
        }
    }
    // Pin headers - Right side
    for(i=[0:7]) {
        translate([19, -24+i*6, 11]) {
            color("black") cube([1, 2, 4], center=true);
            color("gold") cube([1.5, 2.5, 1], center=true);
        }
    }
    // USB connector
    color("silver") translate([0, -27, -2]) cube([8, 6, 4], center=true);
}

// Enhanced Charging module (TP4056)
module tp4056_module() {
    color("crimson") cube([32, 28, 10], center=true);
    // SMD components
    for(i=[0:3]) {
        translate([-10+i*7, -8, 5.5]) color("gray") cube([3, 2, 2], center=true);
        translate([-10+i*7, 8, 5.5]) color("gray") cube([3, 2, 2], center=true);
    }
    // LED indicators
    color("red") translate([-8, 0, 5.5]) cube([2, 2, 1], center=true);
    color("yellow") translate([8, 0, 5.5]) cube([2, 2, 1], center=true);
    // Micro USB
    color("silver") translate([0, -15, 0]) cube([5, 3, 3], center=true);
}

// Enhanced Buck converter (MT3608)
module mt3608_module() {
    color("mediumpurple") cube([25, 25, 8], center=true);
    // Inductor (large component)
    color("saddlebrown") translate([0, -8, 4.5]) cylinder(h=5, r=4, center=true, $fn=16);
    // SMD components
    for(i=[0:2]) {
        translate([-7+i*7, 5, 4.5]) color("gray") cube([3, 2, 2], center=true);
    }
    // Adjustment pot
    color("gold") translate([9, 0, 4]) cylinder(h=2, r=1.5, center=true, $fn=12);
}

// Enhanced Li-Po Battery pack
module battery() {
    color("darkgreen") cube([65, 55, 22], center=true);
    // Battery cell (Lipo)
    color("forestgreen") translate([0, -5, 0]) cube([55, 35, 20], center=true);
    // Label area
    color("white") translate([0, 0, 11.5]) cube([50, 40, 0.5], center=true);
    // Terminal pads (thick)
    color("red") translate([-30, 25, 11.5]) cylinder(h=3, r=4, center=true, $fn=12);
    color("black") translate([30, 25, 11.5]) cylinder(h=3, r=4, center=true, $fn=12);
    // Connector
    color("silver") translate([0, -25, 0]) cube([20, 4, 8], center=true);
}

// Enhanced MOSFET module
module mosfet_module() {
    color("sienna") cube([22, 30, 9], center=true);
    // IC chip
    color("black") translate([0, 0, 4.5]) cube([12, 12, 2], center=true);
    // Pin indicators
    color("gold") translate([-8, -10, 4.5]) cube([2, 2, 1], center=true);
    // Gate, Drain, Source pads
    for(i=[-10, 0, 10]) {
        color("gold") translate([8, i, 4.5]) cube([2, 3, 1], center=true);
    }
}

// Enhanced Voltage regulator
module voltage_regulator() {
    color("darkorange") cube([20, 22, 7], center=true);
    // SOT-89 package
    color("darkgray") translate([0, 0, 3.8]) cube([12, 14, 3], center=true);
    // Heat tab
    color("silver") translate([0, 0, 0.5]) cube([14, 8, 1], center=true);
}

// Enhanced WS2812B Ring
module ws2812b_ring() {
    // PCB ring
    color("darkblue") cylinder(h=3, r=22, center=true, $fn=64);
    // LED dots (12 WS2812B)
    for(i=[0:11]) {
        angle = i * 30;
        rx = 16*cos(angle);
        ry = 16*sin(angle);
        translate([rx, ry, 1.8])
            color("yellow") cube([5, 5, 2], center=true);
        // LED glow
        translate([rx, ry, 2])
            color("yellow", 0.3) sphere(r=6, $fn=16);
    }
    // Power pads
    color("red") translate([-20, 0, 1.5]) cylinder(h=1, r=1.5, center=true, $fn=12);
    color("black") translate([20, 0, 1.5]) cylinder(h=1, r=1.5, center=true, $fn=12);
}

// Enhanced GY-521 Gyroscope
module gy521_module() {
    color("midnightblue") cube([18, 22, 9], center=true);
    // MPU-6050 chip
    color("black") translate([0, -3, 4.5]) cube([10, 10, 2], center=true);
    // Crystal
    color("silver") translate([-6, 6, 4.5]) cube([4, 3, 1], center=true);
    // Capacitors
    for(i=[-6, 6]) {
        translate([i, -7, 4.5]) color("gray") cube([3, 2, 1.5], center=true);
    }
}

// Enhanced Mini pump motor
module pump_motor() {
    color("darkred") cylinder(h=32, r=9, center=true, $fn=20);
    // Motor shaft
    color("silver") cylinder(h=38, r=2, center=true, $fn=12);
    // Outlet nozzle (3mm)
    color("steelgray") translate([0, 0, 20]) cylinder(h=6, r=2.5, center=true, $fn=16);
    // Inlet
    color("steelgray") translate([0, 0, -20]) cylinder(h=4, r=3.5, center=true, $fn=16);
    // Connectors
    color("red") translate([-8, 0, -16]) cylinder(h=2, r=1.5, center=true, $fn=12);
    color("black") translate([8, 0, -16]) cylinder(h=2, r=1.5, center=true, $fn=12);
}

// Enhanced 12V Cooling Fan
module fan_12v() {
    // Fan shroud
    color("darkgray") cylinder(h=15, r=35, center=true, $fn=48);
    // 3-blade fan impeller
    for(i=[0:2]) {
        angle = i * 120;
        x = 18*cos(angle);
        y = 18*sin(angle);
        translate([x, y, 0])
            color("saddlebrown") cube([28, 6, 12], center=true);
    }
    // Motor center
    color("black") cylinder(h=16, r=10, center=true, $fn=20);
    // Connectors
    color("red") translate([-12, 0, -8]) cylinder(h=2, r=1.5, center=true, $fn=12);
    color("black") translate([12, 0, -8]) cylinder(h=2, r=1.5, center=true, $fn=12);
}

// Enhanced Heater resistor
module heater_resistor() {
    color("orangered") cube([35, 18, 9], center=true);
    // Resistor coils
    for(i=[0:3]) {
        translate([-10+i*7, 0, 5]) color("darkred") cylinder(h=2, r=2, $fn=12);
    }
    // Connection tabs
    color("copper") translate([-18, 0, 4.5]) cube([3, 4, 2], center=true);
    color("copper") translate([18, 0, 4.5]) cube([3, 4, 2], center=true);
}

// Enhanced Power switch
module power_switch() {
    color("floralwhite") cube([16, 22, 13], center=true);
    // Toggle actuator
    color("darkslategray") translate([0, 0, 9]) cube([4, 10, 5], center=true);
    // Connector pins
    for(i=[-6, 6]) {
        color("gold") translate([i, -10, 4]) cube([2, 2, 1], center=true);
    }
}

// Enhanced Scent Oil Reservoir
module scent_oil_reservoir() {
    // Outer dome
    color("darkorange", 0.5) sphere(r=25, $fn=48);
    // Inner transparent reservoir
    color("orange", 0.6) cylinder(h=28, r=22, center=true, $fn=48);
    // Liquid level (3/4 full)
    color("darkorange", 0.8) cylinder(h=21, r=20, center=true, $fn=48);
    // Fill cap (threaded appearance)
    color("silver") translate([0, 0, 18]) cylinder(h=6, r=10, center=true, $fn=32);
    color("white") translate([0, 0, 20]) cylinder(h=2, r=8, center=true, $fn=32);
    // Outlet spout (to pump)
    color("steelgray") translate([24, 0, 5]) cylinder(h=5, r=2.5, center=true, $fn=16);
    // Vent hole
    color("silver") translate([-22, 0, 18]) cylinder(h=1, r=1.5, center=true, $fn=12);
}

// Rubber base tile
module rubber_base() {
    color("DarkSlateGray", 0.85) 
        cube([BASE_WIDTH, BASE_LENGTH, RUBBER_THICKNESS], center=true);
    
    // Mounting holes for X-frame
    for(x=[-120, 120]) {
        for(y=[-150, 150]) {
            translate([x, y, -RUBBER_THICKNESS/2 - 2])
                color("gray") cylinder(h=6, r=5, center=true, $fn=20);
        }
    }
    // Text on base
    translate([0, -160, RUBBER_THICKNESS/2 + 0.5])
        color("white") linear_extrude(height=0.3)
            text("DRONE BASE TILE - 300x350mm", size=8, font="Arial", halign="center");
}

// Smooth curved wire path
module wire_connection(from, to, wire_color, wire_rad, label_text, label_pos) {
    steps = 30;
    for(i=[0:steps-1]) {
        t1 = i / steps;
        t2 = (i+1) / steps;
        
        // Bezier curve with height arc
        p1x = from[0] + (to[0] - from[0]) * t1;
        p1y = from[1] + (to[1] - from[1]) * t1;
        p1z = from[2] + (to[2] - from[2]) * t1 + 15*sin(t1*180);
        
        p2x = from[0] + (to[0] - from[0]) * t2;
        p2y = from[1] + (to[1] - from[1]) * t2;
        p2z = from[2] + (to[2] - from[2]) * t2 + 15*sin(t2*180);
        
        draw_wire_segment([p1x, p1y, p1z], [p2x, p2y, p2z], wire_rad, wire_color);
    }
    
    // Add label midway
    if(label_text != "") {
        mid = [(from[0]+to[0])/2, (from[1]+to[1])/2, (from[2]+to[2])/2 + 20];
        label(label_text, mid, 3.5, [0,0,0], wire_color);
    }
}

// Draw wire segment as cylinder
module draw_wire_segment(from, to, radius, wire_color) {
    midpoint = [(from[0] + to[0])/2, (from[1] + to[1])/2, (from[2] + to[2])/2];
    distance = sqrt(pow(to[0]-from[0], 2) + pow(to[1]-from[1], 2) + pow(to[2]-from[2], 2));
    
    if(distance > 0.1) {
        angle_xy = atan2(to[1]-from[1], to[0]-from[0]);
        angle_z = asin((to[2]-from[2])/distance);
        
        translate(midpoint)
            rotate([0, angle_z, angle_xy])
                color(wire_color) cylinder(h=distance, r=radius, center=true, $fn=12);
    }
}

// WIRING SYSTEM - ALL CONNECTIONS
module complete_wiring() {
    // CHARGING CIRCUIT
    wire_connection(BATT_POS, TP4056_IN_POS, "red", 1.5, "BAT+", [0, 0, 0]);
    wire_connection(BATT_NEG, TP4056_IN_NEG, "black", 1.5, "BAT-", [0, 0, 0]);
    
    // TP4056 OUTPUT to MT3608
    wire_connection(TP4056_OUT_POS, MT3608_IN_POS, "orange", 1.3, "5V", [0, 0, 0]);
    wire_connection(TP4056_OUT_NEG, MT3608_IN_NEG, "black", 1.3, "GND", [0, 0, 0]);
    
    // TP4056 OUTPUT to ESP32
    wire_connection(TP4056_OUT_POS, ESP32_5V, "orange", 1.2, "5V", [0, 0, 0]);
    wire_connection(TP4056_OUT_NEG, ESP32_GND, "black", 1.2, "GND", [0, 0, 0]);
    
    // MT3608 OUTPUT (12V BOOST) to Voltage Regulator
    wire_connection(MT3608_OUT_POS, VREG_IN_POS, "red", 1.6, "12V", [0, 0, 0]);
    wire_connection(MT3608_OUT_NEG, VREG_IN_NEG, "black", 1.6, "GND", [0, 0, 0]);
    
    // VOLTAGE REGULATOR to 12V FAN (PRIMARY)
    wire_connection(VREG_OUT_POS, FAN_POS, "red", 2.0, "12V FAN+", [0, 0, 0]);
    wire_connection(VREG_OUT_NEG, FAN_NEG, "black", 2.0, "FAN-", [0, 0, 0]);
    
    // VOLTAGE REGULATOR to MOSFET (12V Control)
    wire_connection(VREG_OUT_POS, MOSFET_DRAIN, "red", 1.4, "12V", [0, 0, 0]);
    wire_connection(VREG_OUT_NEG, MOSFET_SOURCE, "black", 1.4, "GND", [0, 0, 0]);
    
    // ESP32 GPIO to MOSFET GATE (Pump/Heater Control)
    wire_connection(ESP32_GPIO_PUMP, MOSFET_GATE, "blue", 1.0, "GPIO_CTRL", [0, 0, 0]);
    
    // MOSFET to PUMP (Switched 12V)
    wire_connection(MOSFET_DRAIN, PUMP_POS, "darkred", 1.5, "PUMP+", [0, 0, 0]);
    wire_connection(MOSFET_SOURCE, PUMP_NEG, "black", 1.5, "PUMP-", [0, 0, 0]);
    
    // MOSFET to HEATER (Switched 12V)
    wire_connection(MOSFET_DRAIN, HEATER_POS, "darkred", 1.4, "HEAT+", [0, 0, 0]);
    wire_connection(MOSFET_SOURCE, HEATER_NEG, "black", 1.4, "HEAT-", [0, 0, 0]);
    
    // ESP32 to WS2812B LED RING
    wire_connection(ESP32_GPIO_LED, LED_DATA, "yellow", 1.0, "DATA", [0, 0, 0]);
    wire_connection(ESP32_5V, LED_POS, "red", 1.0, "5V", [0, 0, 0]);
    wire_connection(ESP32_GND, LED_GND, "black", 1.0, "GND", [0, 0, 0]);
    
    // ESP32 I2C to GY-521 GYROSCOPE
    wire_connection(ESP32_SDA, GY521_SDA, "green", 1.0, "SDA", [0, 0, 0]);
    wire_connection(ESP32_SCL, GY521_SCL, "purple", 1.0, "SCL", [0, 0, 0]);
    wire_connection(ESP32_GND, GY521_GND, "black", 1.0, "GND", [0, 0, 0]);
    wire_connection(ESP32_5V, GY521_3V3, "cyan", 1.0, "3.3V", [0, 0, 0]);
    
    // PUMP to SCENT OIL RESERVOIR (Physical connection)
    wire_connection([PUMP_X, PUMP_Y + 15, PUMP_Z], [SCENT_OIL_X + 20, SCENT_OIL_Y - 5, SCENT_OIL_Z - 15], "brown", 2.5, "OIL LINE", [0, 0, 0]);
}

// COMPONENT LABELS
module component_labels() {
    // Main labels with clear positioning
    label("ESP32\nMicrocontroller", [ESP32_X, ESP32_Y - 40, ESP32_Z + 20], 5.5);
    
    label("TP4056\nCharger Module", [TP4056_X, TP4056_Y - 25, TP4056_Z + 20], 5);
    
    label("Li-Po Battery\n(3.7V)", [BATTERY_X, BATTERY_Y + 40, BATTERY_Z + 22], 5);
    
    label("MT3608\nBoost Converter\n(5V→12V)", [MT3608_X, MT3608_Y - 35, MT3608_Z + 20], 4.5);
    
    label("5V Voltage\nRegulator", [VOLTAGE_REG_X, VOLTAGE_REG_Y - 25, VOLTAGE_REG_Z + 20], 5);
    
    label("MOSFET\nSwitch Module", [MOSFET_X, MOSFET_Y + 40, MOSFET_Z + 20], 5);
    
    label("WS2812B\n12x RGB LED Ring", [WS2812B_X, WS2812B_Y - 35, WS2812B_Z + 20], 4.5);
    
    label("Mini Pump\n(12V DC)", [PUMP_X, PUMP_Y - 25, PUMP_Z + 20], 5);
    
    label("GY-521\n6-Axis Gyro\nIMU", [GY521_X, GY521_Y + 40, GY521_Z + 20], 4.5);
    
    label("12V COOLING FAN\n(CENTER - PRIMARY)", [FAN_X, FAN_Y - 55, FAN_Z + 25], 6, [0,0,0], "darkred");
    
    label("Heater\nResistor\n(12V)", [HEATER_X, HEATER_Y - 25, HEATER_Z + 20], 4.5);
    
    label("Power\nSwitch\n(ON/OFF)", [SWITCH_X, SWITCH_Y - 25, SWITCH_Z + 20], 4.5);
    
    label("SCENT OIL\nRESERVOIR\n(Dome Top)", [SCENT_OIL_X, SCENT_OIL_Y, SCENT_OIL_Z + 30], 5.5, [0,0,0], "darkorange");
}

// Power distribution labels
module power_labels() {
    label("BAT 3.7V", [BATTERY_X - 50, BATTERY_Y + 5, BATTERY_Z + 15], 4, [0,0,0], "red");
    label("5V Rail", [TP4056_X + 40, TP4056_Y + 5, TP4056_Z + 15], 4, [0,0,0], "orange");
    label("12V Boost", [MT3608_X + 40, MT3608_Y + 10, MT3608_Z + 15], 4, [0,0,0], "red");
}

// Full assembly
module full_assembly() {
    // Base tile
    rubber_base();
    
    // Main components
    translate([ESP32_X, ESP32_Y, ESP32_Z]) esp32_module();
    translate([TP4056_X, TP4056_Y, TP4056_Z]) tp4056_module();
    translate([BATTERY_X, BATTERY_Y, BATTERY_Z]) battery();
    translate([MT3608_X, MT3608_Y, MT3608_Z]) mt3608_module();
    translate([VOLTAGE_REG_X, VOLTAGE_REG_Y, VOLTAGE_REG_Z]) voltage_regulator();
    translate([MOSFET_X, MOSFET_Y, MOSFET_Z]) mosfet_module();
    translate([WS2812B_X, WS2812B_Y, WS2812B_Z]) ws2812b_ring();
    translate([PUMP_X, PUMP_Y, PUMP_Z]) pump_motor();
    translate([GY521_X, GY521_Y, GY521_Z]) gy521_module();
    translate([FAN_X, FAN_Y, FAN_Z]) fan_12v();
    translate([HEATER_X, HEATER_Y, HEATER_Z]) heater_resistor();
    translate([SWITCH_X, SWITCH_Y, SWITCH_Z]) power_switch();
    translate([SCENT_OIL_X, SCENT_OIL_Y, SCENT_OIL_Z]) scent_oil_reservoir();
    
    // All wiring connections
    complete_wiring();
    
    // Component labels
    component_labels();
    power_labels();
}

// Render
full_assembly();

// Render settings for high quality
$fn = 48;  // High quality smooth curves