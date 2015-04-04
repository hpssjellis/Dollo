include <publicDomainGearV1.1.scad>;

















///////////////////// FOCUS ON THIS NOW //////////////////////////////
pillar_space = 180;
twist_gears = 0;
thickness_gears = 3;
hole_diameter_gears = 3.5;
pin_position = 7;
radius = 37;
$fn = 60;
tooth_depth_twist = 2;
mirror = true;
mm_per_tooth_gears    = 9;
pressure_angle_gears  = 28;
///////////////////// FOCUS ON THIS NOW //////////////////////////////






























module frame(){
translate([-pillar_space/2,-pillar_space/2,0]) cube([30,30,30], center=true);
translate([pillar_space/2,pillar_space/2,0]) cube([30,30,30], center=true);
translate([-pillar_space/2,pillar_space/2,0]) cube([30,30,30], center=true);
translate([pillar_space/2,-pillar_space/2,0]) cube([30,30,30], center=true);
}
//frame();

//%rotate([0,0,45]) cube([200,200,10], center=true);
holes = 32;
module motor_mount(){
    //rotate([0,0,45]) cube([42,42,5], center=true);
    translate([holes/2,holes/2,0]) cylinder(d=5, h=50);
        translate([-holes/2,holes/2,0]) cylinder(d=5, h=50);
        translate([-holes/2,-holes/2,0]) cylinder(d=5, h=50);
        translate([holes/2,-holes/2,0]) cylinder(d=5, h=50);
}

    
//rotate([0,0,45])motor_mount();
            module pins(height=10, z=0, d=5){
                translate([pin_position,pin_position,z]) cylinder(h=height, d=d);
                translate([-pin_position,-pin_position,z]) cylinder(h=height, d=d);
            }

    module gear_one(hole_diameter_gears=5.5){
        translate([0,0,thickness_gears]) mirror([0,0,1]) gear(mm_per_tooth_gears,12,thickness_gears,hole_diameter_gears,twist_gears);
        gear(mm_per_tooth_gears,12,thickness_gears,hole_diameter_gears,twist_gears);
        translate([0,4.5,0]) cube([5,5,thickness_gears], center=true);
        }
            module gear_large() {
				difference(){
					union(){
						translate([0,0,thickness_gears]) mirror([0,0,1]) gear(mm_per_tooth_gears,22,thickness_gears,hole_diameter_gears,twist_gears);
						gear(mm_per_tooth_gears,22,thickness_gears,hole_diameter_gears,twist_gears);
					}
						rotate([0,0,45]) pins(z=-4);
				}
			}
            module middle_gear(){         
                                gear(mm_per_tooth_gears,12,thickness_gears,hole_diameter_gears,twist_gears);
                                mirror([0,0,1]) translate([0,0,thickness_gears]) gear(mm_per_tooth_gears,12,thickness_gears,hole_diameter_gears,twist_gears);
            }
			module reverse_gear_one(){         
                                gear(mm_per_tooth_gears,6,thickness_gears*2,hole_diameter_gears,twist_gears);
            }
			module reverse_gear_two(){         
								gear(mm_per_tooth_gears,6,thickness_gears*2,hole_diameter_gears,twist_gears);
            }
            module twist() {
                difference() {
                    translate([35,35,0]) linear_extrude(height = 8, center = false, convexity = 10, twist = 360, $fn = 50) translate([tooth_depth_twist, 0, 0]) circle(r = radius);
                        union(){
                            #translate([35,35,3]) cylinder(d=3.5, h=50, center=true);
                            #translate([35, 35, 0]) pins(height=20, d=5.5 );
                        }
                    }   
                }
              module twist_large() {
                difference() {
                    linear_extrude(height = 8*2, center = false, convexity = 10, twist = 360*2, $fn = 50) translate([2, 0, 0]) circle(r = 37);
                        union(){
                            #translate([0,0,3]) cylinder(d=3.5, h=50, center=true);
                            #translate([0, 0, 0]) pins(height=20, d=6 );
                        }
                    }   
                }
        //gear_large();
        //twist();
		//reverse_gear_one();
        //twist_large();
        //middle_gear();
        //gear_one();



