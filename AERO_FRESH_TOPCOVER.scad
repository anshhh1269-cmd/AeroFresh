//
// AeroFresh_TopCover.scad
// Dome top cover with LED ring seat and fan opening (50 mm fan).
// Transparent dome, internal led ring pocket.
// Fan blades included (5-blade rotor).
//
$fn = 120;

dome_dia = 140;         // dome outer diameter
dome_height = 50;
dome_thickness = 2;
led_ring_r = 25;        // 50 mm outer diameter => r=25
fan_r = 25;             // 50 mm fan
fan_mount_h = 6;
nozzle_r = 4;

module dome() {
    // semi-transparent dome shell
    color([1,1,1,0.25])
    difference() {
        translate([0,0,0]) scale([1,1,0.65]) sphere(r = dome_dia/2);
        // inner cut to create hollow
        translate([0,0,-5]) scale([1,1,0.65]) sphere(r = dome_dia/2 - dome_thickness);
    }
}

module led_ring_seat() {
    // seat for 50mm WS2812 ring, slight lip
    color("silver")
    translate([0,0,6]) difference() {
        cylinder(h=4, r=led_ring_r + 3);
        translate([0,0,-1]) cylinder(h=6, r=led_ring_r);
    }
}

module fan_mount_and_blades() {
    // fan housing collar
    color("gray")
    translate([0,0,10]) cylinder(h=fan_mount_h, r=fan_r + 6);

    // 5-blade rotor (simple aesthetic blades)
    color("darkslategray")
    for (i=[0:72:288]) {
        rotate([0,0,i]) translate([fan_r/2,0, fan_mount_h + 2]) rotate([0,20,0]) 
            linear_extrude(height=1) scale([1,0.3]) polygon(points=[[0,0],[18,4],[36,0],[18,-6]]);
    }

    // central hub
    color("black")
    translate([0,0,fan_mount_h + 2]) cylinder(h=3, r=3);
}

// small exhaust nozzle (center top)
module exhaust_nozzle() {
    color("silver")
    translate([0,0,dome_height + 2]) cylinder(h=8, r=nozzle_r);
}

module AeroFresh_TopCover() {
    dome();
    led_ring_seat();
    fan_mount_and_blades();
    exhaust_nozzle();
}

// call when loaded standalone
AeroFresh_TopCover();
