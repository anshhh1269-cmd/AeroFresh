//
// AeroFresh_Base.scad
// Circular drone base, 180 mm diameter, mounting points for X-frame arms.
// Author: AeroFresh CAD (generated)
//
$fn = 120;

// Parameters
base_dia = 180;
base_thickness = 3;
arm_width = 12;
arm_length = 70;
motor_pad_r = 10;
center_plate_r = 28;
standoff_hole_r = 1.6; // for M3 screws

module base_plate() {
    color("white")
    difference() {
        // main disc
        translate([0,0,0])
            cylinder(h = base_thickness, r = base_dia/2);

        // cutouts for weight saving (4 spokes)
        for (a = [0:90:270]) {
            rotate([0,0,a]) translate([arm_length/2,0,0]) difference() {
                translate([0,0,0]) square([arm_length, arm_width], center=true);
                translate([arm_length/2 + 6, 0, 0]) circle(r = arm_width/2 + 2);
            }
        }
    }
}

module xframe_arms() {
    color([0.06,0.06,0.06]) // carbon look
    union() {
        // four arms (hull rectangles) crossing center
        for (a = [0:90:270]) {
            rotate([0,0,a]) translate([0,0, base_thickness]) {
                hull() {
                    translate([-6,0,0]) circle(r=6);
                    translate([arm_length,0,0]) circle(r=6);
                }
            }
        }
        // center circular plate (for deck)
        translate([0,0, base_thickness]) cylinder(h=3, r=center_plate_r);
        // motor pads (holes) for each arm end
        for (a = [0:90:270]) {
            rotate([0,0,a]) translate([arm_length,0,0]) {
                translate([0,0,1]) difference() {
                    cylinder(h=6, r=motor_pad_r);
                    cylinder(h=8, r=3); // center hole for shaft clearance
                }
            }
        }
    }
}

module mounting_holes() {
    // four M3 screw holes around center plate for electronics deck
    for (ang = [45,135,225,315]) {
        rotate([0,0,ang]) translate([20,0, base_thickness+3]) cylinder(h=6, r=standoff_hole_r);
    }
}

module AeroFresh_Base() {
    base_plate();
    xframe_arms();
    mounting_holes();
}

// call main module when file is loaded standalone
AeroFresh_Base();
