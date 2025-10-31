//
// AeroFresh_Components.scad
// Electronics models and wiring visualization
// ESP32 (30-pin) approximate box, MPU6050, MOSFET, TP4056, battery, pump, tubing, LED ring.
// Wire colors: red=V+, black=GND, blue=DATA, green=SCL/SDA (I2C), yellow=signal to MOSFETs
//
$fn = 60;

// Helper modules
module board_box(x,y,z, col="gray", label="") {
    color(col) translate([ -x/2, -y/2, 0 ]) cube([x,y,z]);
    if (label != "") translate([-x/2+1, -y/2+1, z+1]) color("black") text(label, size=4);
}

// ESP32 dev board (approx dimensions)
module ESP32_30pin() {
    board_box(50,25,6, "darkslategray","ESP32");
    // side USB port block
    color("silver") translate([26, -12, 2]) cube([6,4,3]);
    // header pins visual
    color("black") for (i=[0:29]) translate([-24 + i*1.6, 12, 3]) cube([1.2,1,1.5]);
}

// MPU6050 approximate
module MPU6050() {
    color("tan") translate([-12, -12, 0]) cube([12,12,3]);
    translate([-11, -8, 3]) color("black") text("MPU6050", size=2);
}

// TP4056 module approx
module TP4056() {
    color("lightblue") translate([0,0,0]) cube([18,12,3]);
    translate([1,1,3]) color("black") text("TP4056", size=2);
}

// MOSFET (IRFZ44N) simple block
module MOSFET(name="Q1") {
    color("black") translate([0,0,0]) cube([6,4,6]);
    translate([0,0,6]) color("white") text(name, size=2);
}

// Battery (LiPo) approx
module LiPo() {
    color("orange") translate([-30,-12,0]) cube([60,24,10]);
    translate([-28,-8,11]) color("black") text("LiPo 3S (11.1V)", size=3);
}

// WS2812 ring
module WS2812_ring(r=25, thickness=3) {
    color("orange")
    difference() {
        translate([0,0,0]) cylinder(h=thickness, r=r+3);
        translate([0,0,-1]) cylinder(h=thickness+2, r=r-8);
    }
    // LEDs as small dots
    for (a = [0:360/8:360-360/8]) {
        rotate([0,0,a]) translate([r,0,thickness+0.5]) color("red") sphere(r=0.9);
    }
}

// Mini air pump
module air_pump() {
    color("white") translate([0,0,0]) cube([18,10,12]);
    translate([1,1,12]) color("black") text("Pump", size=2);
}

// Fan housing (for wiring view)
module fan_unit(r=25) {
    color("lightgray") translate([-r,-r,0]) cylinder(h=10, r=r);
    // rotor is modeled in top cover but place a mount here
}

// Simple connector (JST) block
module JST(label="J1", pins=2) {
    color("brown") translate([-6,-3,0]) cube([12,6,3]);
    translate([-5,-2,3]) color("white") text(label, size=2);
}

// Wires: draw as thin cylinders between points
module wire(p1=[0,0,0], p2=[10,0,0], col=[1,0,0]) {
    color(col)
    translate(p1) rotate(vect_to_rot(p1,p2)) cylinder(h=vec_len(p1,p2), r=0.6);
}

// vector helpers
function vec_len(p1) = sqrt((p1[0]-p1[0])*(p1[0]-p1[0])); // placeholder; replaced in wire via an inline calculation

// Because OpenSCAD doesn't support complex vector math easily inline in a small scaffold,
// below we draw wires as straight thin boxes (simple visual)
module wire_box(p1=[0,0,0], p2=[20,0,0], color_name="red") {
    dx = p2[0]-p1[0];
    dy = p2[1]-p1[1];
    dz = p2[2]-p1[2];
    len = sqrt(dx*dx + dy*dy + dz*dz);
    // Place a thin stretched box between points (approximate)
    translate([p1[0], p1[1], p1[2]]) rotate([0,0,0]) color(color_name) cube([len,0.8,0.8]);
}

// Layout positions (these are just placement coordinates relative to center)
ESP32_pos = [-10, -5, 12];
TP4056_pos = [40, -10, 6];
MOSFET_pos = [40, 20, 6];
LiPo_pos = [-40, 30, 6];
Pump_pos = [55, 40, 3];
Fan_pos = [0, 60, 6];
LED_pos = [0, 40, 18];
MPU_pos = [-20, 15, 8];
JST_pump = [60,45,6];

// Assembling components in place
module components_layout() {
    translate(ESP32_pos) ESP32_30pin();
    translate(TP4056_pos) TP4056();
    translate(MOSFET_pos) MOSFET("Qpump");
    translate(LiPo_pos) LiPo();
    translate(Pump_pos) air_pump();
    translate(Fan_pos) fan_unit(25);
    translate(LED_pos) WS2812_ring(25, 3);
    translate(MPU_pos) MPU6050();
    // connectors
    translate(JST_pump) JST("J_PUMP", 2);

    // wires (simple colored boxes for visualization)
    // LiPo + to TP4056
    wire_box([LiPo_pos[0]+20, LiPo_pos[1], LiPo_pos[2]+5], [TP4056_pos[0]-8, TP4056_pos[1], TP4056_pos[2]+2],"red");
    // TP4056 OUT+ to Buck/5V rail (represented to the ESP32 VIN)
    wire_box([TP4056_pos[0]+8, TP4056_pos[1], TP4056_pos[2]+2], [ESP32_pos[0]+20, ESP32_pos[1]+6, ESP32_pos[2]+2],"red");
    // GND common
    wire_box([LiPo_pos[0]+20, LiPo_pos[1]-6, LiPo_pos[2]+2],[ESP32_pos[0]+20,ESP32_pos[1]-6,ESP32_pos[2]+2],"black");
    // ESP32 to LED data (GPIO18)
    wire_box([ESP32_pos[0]+22, ESP32_pos[1], ESP32_pos[2]+3], [LED_pos[0], LED_pos[1], LED_pos[2]+3],"blue");
    // ESP32 to MPU6050 (I2C SDA,SCL)
    wire_box([ESP32_pos[0]+5, ESP32_pos[1]+8, ESP32_pos[2]+2],[MPU_pos[0]+6,MPU_pos[1],MPU_pos[2]+2],"green");
    wire_box([ESP32_pos[0]+5, ESP32_pos[1]+10, ESP32_pos[2]+2],[MPU_pos[0]+6,MPU_pos[1]+2,MPU_pos[2]+2],"green");
    // ESP32 to MOSFET gate (pump control)
    wire_box([ESP32_pos[0]+16, ESP32_pos[1]-6, ESP32_pos[2]+2],[MOSFET_pos[0],MOSFET_pos[1]-2,MOSFET_pos[2]+2],"yellow");
    // MOSFET drain to Pump negative
    wire_box([MOSFET_pos[0]+6, MOSFET_pos[1], MOSFET_pos[2]+2],[Pump_pos[0]-9,Pump_pos[1],Pump_pos[2]+6],"black");
    // Pump + to battery positive (via 12V rail note)
    wire_box([LiPo_pos[0]+18,LiPo_pos[1],LiPo_pos[2]+8],[Pump_pos[0]+9,Pump_pos[1],Pump_pos[2]+6],"red");
    // Fan power (12V) from battery positive
    wire_box([LiPo_pos[0]+18,LiPo_pos[1]+4,LiPo_pos[2]+8],[Fan_pos[0],Fan_pos[1]+6,Fan_pos[2]+6],"red");
    wire_box([Fan_pos[0],Fan_pos[1]-6,Fan_pos[2]+2],[ESP32_pos[0]+18,ESP32_pos[1]-8,ESP32_pos[2]+2],"yellow"); // fan control signal approx
}

components_layout();
