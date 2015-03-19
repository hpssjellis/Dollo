include <include.scad>;
include <globals.scad>;


module basic_corner(){
rod_size = 5;
//////////////////      NORMAL       ////////////////////

module added(){
		translate([0,0,15]) cube([obj_leg,obj_leg,obj_leg*2], center=true);
		translate([0,15,0]) cube([obj_leg,obj_leg*2,obj_leg], center=true);
		translate([15,0,0]) cube([obj_leg*2,obj_leg,obj_leg], center=true);
}


module taken(){
	cylinder(d=8.5, h=obj_leg*5, center=true);
	rotate([0,90,0]) cylinder(d=8.5, h=obj_leg*5, center=true);
	rotate([90,0,0]) cylinder(d=8.5, h=obj_leg*5, center=true);
	cylinder(d=20, h=28, center=true);
	rotate([0,90,0]) cylinder(d=20, h=28, center=true);
	rotate([90,0,0]) cylinder(d=20, h=28, center=true);
	module wrap(){
				scale([1.1,1.1,1.1]) translate([-20,30-2.5,15]) rotate([90,180,90]) male_dovetail(height=40);
				scale([1.1,1.1,1.1]) translate([-15,30-2.5,-16]) rotate([0,0,-90]) male_dovetail(height=40);
				scale([1.1,1.1,1.1]) translate([-15,30-2.5,-15]) rotate([-90,180,-90]) male_dovetail(height=40);
				scale([1.1,1.1,1.1]) translate([15,30-2.5,-15]) rotate([0,0,90]) male_dovetail(height=40);
	}
	wrap();
	rotate([0,0,-90]) wrap();
	rotate([90,0,0]) wrap();
	rotate([0,45,180]) translate([0,-45,0]) tie_end();
	rotate([0,45,90]) translate([0,-45,0]) tie_end();
	rotate([-90,0,45]) translate([0,-45,0]) tie_end();

}

	//////	support/////
module support(){
	translate([0,30,15-.25/2]) rotate([90,180,90]) cube([9,.25,30], center=true);
}

module corner() {
	difference(){
		added();
		taken();
	}
module support_global(){
support();
rotate([0,90,0]) support();
rotate([0,-90,0]) support();
rotate([0,180,0]) support();


};
support_global();
rotate([0,0,-90]) support_global();
rotate([90,0,0]) support_global();

/////////
translate([0,obj_leg*2-15,0]) rotate([0,0,180]) bow_support();
rotate([90,0,0]) translate([0,obj_leg*2-15,0]) rotate([0,0,180]) bow_support();
rotate([0,0,-90]) translate([0,obj_leg*2-15,0]) rotate([0,0,180]) bow_support();
/////////

};

	rotate([45,0,0]) corner();
}
module full_corner(){
	difference(){
		translate([0,0,5]) rotate([0,-35,0])basic_corner();
		union(){
			cylinder(h=50, d=15);
			translate([-20,0,0]) cylinder(h=50, d=7);
			translate([10,17,0]) cylinder(h=50, d=7);
			translate([10,-17,0]) cylinder(h=50, d=7);
			translate([0,0,-20]) cube([200,200,50], center=true);
		}
	}
}

full_corner();