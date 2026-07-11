// --- Parameters ---
shoe_height = 34;
shoe_depth = 45;
shoe_width = 75;

leg_height = 87 + shoe_height;
leg_depth = 4.5;
leg_width = 10;

module shoe(width, depth, height) {
    cube([width, depth, height], center=true);
}

module leg(w, d, h) {
    upper_h = 40;
    leg_lower_h = h - upper_h;
    center_hole_r = 5/2;
    
    difference() {  
        translate([0, 0, leg_lower_h/2])
            cube([w, d, leg_lower_h], center=true);

        translate([0, 0, leg_lower_h - center_hole_r])
        rotate([90, 0, 0])
        cylinder(10, center_hole_r, center_hole_r, center=true);
         
    }
    
    
    // second part of the leg
    // slightly tilted 
    second_part_h = 20;
    
    translate([2·, 0, leg_lower_h + second_part_h / 2])
    rotate([0, 15, 0])
    cube([w, d, second_part_h], center=true);
    
  
}

shoe(shoe_width, shoe_depth, shoe_height);
leg(leg_width, leg_depth, leg_height);