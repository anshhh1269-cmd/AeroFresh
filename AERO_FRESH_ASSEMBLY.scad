//
// AeroFresh_Assembly.scad
// Main assembly file - includes base, components, top cover.
// Use this to render whole model.
// Ensure the other component files are in same folder or copy content here.
//
include <AERO_FRESH_XFRAME.scad>;
include <AERO_FRESH_TOPCOVER.scad>;
include <AERO_FRESH_COMPONENTS.scad>;

// small transform adjustments so parts align inside base and under dome
translate([0,0,0]) AeroFresh_Base();

// place electronics deck on center plate
translate([0,0,6]) rotate([0,0,0]) {
    // components.scad already places parts around center; keep as-is
    components_layout();
}

// top cover slightly above components
translate([0,0,60]) AeroFresh_TopCover();
