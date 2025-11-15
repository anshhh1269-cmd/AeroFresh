// AeroFresh_Assembly.scad
// FINAL — Dome → Rubber Tile w/ Components → Base

include <AeroFresh_Base.scad>;

include <AeroFresh_Top.scad>;

// ---- BASE (Bottom) ----

    AeroFresh_Base();

    



// ---- DOME (Top) ----
// Dome sits above rubber tile and components
// Rubber tile 9mm + components roughly 20–25mm → dome at 40mm is correct
translate([0,0,50])
    AeroFresh_Top();

