			
$fs = 0.1;




translate([16.0, 16, 0])
{

// Right outer tilt mount
translate([-35,-145,-126])rotate([90,0,180]) outer_tilt_right_mount();

// Left outer tilt mount
translate([-35,90,-126])rotate([90,0,180]) outer_tilt_nema_mount();


// Left inner tilt mount
translate([-18,80,-142])rotate([90,0,0]) inner_tilt_mount();

// Right inner tilt mount
translate([-18,-120,-142])rotate([90,0,180]) inner_tilt_mount();

// Camera mount
translate([-18, -51, -69])mirror([ 0, 0, 1 ])
{
union()
{
	difference()
	{
		// The base
		translate([-30,0,0]) cube([60, 70, 12]);

		// Holes for the M6 rod
		translate([24,80,6])rotate([90,0,0])cylinder(80,3,3);
		translate([-24,80,6])rotate([90,0,0])cylinder(80,3,3);

		// Mounting holes for camera base
		translate([0,35,0])cylinder(12,4,4);
		// Dig out a hole for the camera base
		translate([-33,35,0])cylinder(12,7,7);
	}

	// Support for camera base
	translate([-30,4.8,12]) cube([60, 5, 5]);
	translate([-30,60.2,12]) cube([60, 5, 5]);
}
}

// Upper pan unit
translate([-60, -65, -30])
{
mirror([ 0, 0, 1 ]) {
difference()
{
	// The plate
	cube([88, 100, 12]);
	translate([11,100,6])rotate([90,0,0])cylinder(100,4,4);
	translate([77,100,6])rotate([90,0,0])cylinder(100,4,4);
	translate([44,50,0])cylinder(3,21,21);
	
	translate([44,50,7])cylinder(5,4.5,4.5,$fn=6);
	#translate([44,50,0])cylinder(12,2.5,2.5);
}
}
}


// Top unit

difference()
		{
	translate([-61, -77, -15])cube([88, 127, 5]);
	// Motor axis
	translate([-16, -16.0, -15])cylinder(5,2.5,2.5);
	// Bearing
	translate([-16, -16.0, -15])cylinder(3,21,21);
	
	// Screw mounts
	translate([-52,-68, -15])cylinder(5,2.5,2.5);
	translate([18,-68, -15])cylinder(5,2.5,2.5);
	translate([18,41, -15])cylinder(5,2.5,2.5);
	translate([-52,41, -15])cylinder(5,2.5,2.5);
}



// Bottom unit


union()
{

// The Benro mount
translate([-45, -46.0, 65])benro_mount();

// Add some stands to make the unit stay stable on a table
translate([-45,-77, 65])cube([57, 10, 10.7]);
translate([-45,40, 65])cube([57, 10, 10.7]);

// The lid
difference()
		{
	translate([-61, -77, 60])cube([88, 127, 5]);
	
	// Screw mounts
	translate([-52,-68, 60])cylinder(5,2.5,2.5);
	translate([18,-68, 60])cylinder(5,2.5,2.5);
	translate([18,41, 60])cylinder(5,2.5,2.5);
	translate([-52,41, 60])cylinder(5,2.5,2.5);
}
}	



// The main unit
difference()
		{
union()
{
	
	union(){
		difference()
		{
			union(){
				translate([-27,-36,0])cube([20, 36, 15]);
				//translate([-17.0,-24.5,0])cylinder(15,10,10);
			}
			translate([-16.3,-16,0])cylinder(15,6,6);
		}
		

	}

	nema_17_mount();
	translate([-61, 0, 0]) cube([34, 5,47]); // Extended front
	translate([-61, -75, 0]) cube([5,130,47]); // New side panel
	translate([22, -75, 0]) cube([5,130,47]); // Extended side panel
	translate([-27, 0, 0]) cube([5,50,47]); // Extended middle panel
	translate([-61, -50, 0])cube([88, 15,5]); // Bottom inforcement


	translate([-61, 45, 0])cube([88, 5,47]); // Bottom panel

	translate([-61, -77, 0])cube([88, 5,47]); // Top panel

	// 5mm Screw mounts
	difference()
	{
		translate([-56,-72, 0])cube([8, 8 ,47]);
		translate([-52,-68, 0])cylinder(47,2.5,2.5);
	}

	difference()
	{
		translate([14,-72, 0])cube([8, 8 ,47]);
		translate([18,-68, 0])cylinder(47,2.5,2.5);
	}

	difference()
	{
		translate([-56,37, 0])cube([8, 8 ,47]);
		translate([-52,41, 0])cylinder(47,2.5,2.5);
	}
}

	// Remove some shit at the bottom panel
translate([-61, 50, 0])cube([88, 5,47]); // Bottom panel
}


}

module benro_mount()
{
difference()
		{
	cube([58.3, 60, 10.7]);
	//translate([29.15, 30, 0])cylinder(12.7,2.0,2.0);
	//#translate([4.15, 0, 0])cube([50, 60, 10.7]);
	translate([0.2, 0, -3])rotate([0,-30 , 0])cube([5, 60, 15]);
	translate([52.2, 0, -3])rotate([0, 30, 0])cube([5, 60, 15]);
}
}

module outer_tilt_right_mount()
{
union()
{
	// tilt axis mount
	union(){
		difference()
		{
			union(){
				translate([-27,-26,0])cube([20, 26, 15]);
				//translate([-17.0,-24.5,0])cylinder(15,10,10);
			}
			translate([-16.3,-16,0])cylinder(15,6,6);
		}
		
		
		difference()
		{
		translate([-7,-26,0])cube([20,26,15]);
		translate([33,-25,-1])cylinder(16,40,40);
		}

		
		difference()
		{
			translate([-47,-26,0])cube([20,26,15]);
			translate([-67,-25,-1])cylinder(16,40,40);
		}
	}

	//nema_17_mount();
	translate([-61, 0, 0]) cube([88, 5,15]); // Extended front
	translate([-61, 0, 0]) cube([5,80,15]); // New side panel
	translate([22, 0, 0]) cube([5,80,15]); // Extended side panel
	translate([-19, 0, 0]) cube([5,80,15]); // Extended middle panel
	translate([-61, 50, 0])cube([88, 15,5]); // Bottom inforcement

	difference()
	{
		translate([-61, 80, 0])cube([88, 15,15]); // Bottom panel
		translate([-50, 87, 0]) cylinder(15,4,4);
		translate([16, 87, 0]) cylinder(15,4,4);
	}
}
}
module outer_tilt_nema_mount()
{
union()
{
	// tilt axis mount
	union(){
		difference()
		{
			union(){
				translate([-27,-26,0])cube([20, 26, 15]);
				//translate([-17.0,-24.5,0])cylinder(15,10,10);
			}
			translate([-16.3,-16,0])cylinder(15,6,6);
		}
		
		
		difference()
		{
		translate([-7,-26,0])cube([20,26,5]);
		translate([33,-25,-1])cylinder(6,40,40);
		}

		
		difference()
		{
			translate([-47,-26,0])cube([20,26,5]);
			translate([-67,-25,-1])cylinder(6,40,40);
		}
	}

	nema_17_mount();
	translate([-61, 0, 0]) cube([34, 5,47]); // Extended front
	translate([-61, 0, 0]) cube([5,80,47]); // New side panel
	translate([22, 0, 0]) cube([5,80,47]); // Extended side panel
	translate([-27, 0, 0]) cube([5,80,47]); // Extended middle panel
	translate([-61, 50, 0])cube([88, 15,5]); // Bottom inforcement

	difference()
	{
		translate([-61, 80, 0])cube([88, 15,47]); // Bottom panel
		translate([-50, 87, 0]) cylinder(47,4,4);
		translate([16, 87, 0]) cylinder(47,4,4);
	}
}
}

module inner_tilt_mount()
{
difference()
{
	union()
	{
		// The motor axis mount
		cylinder(15,6,6);


		// Base of the cradle
	
		translate([-30,60,0]) cube([60, 12, 30]);
		translate([-27.5,55,0])cube([55, 10, 8]);
		
	
		
		// Three support pins
		translate([-6,0,0])cube([12, 60, 10]);
		translate([-6,0,0])rotate([0,0,21.7])cube([8, 65, 10]);
		translate([-2.6,0,0])rotate([0,0,-21.7])cube([8, 68, 10]);

		// 45-degree support for the support pins
		translate([-6,58,5])rotate([45,0,0])cube([12, 10, 6]);
		translate([-30.5,58,5])rotate([45,0,0])cube([11.3, 10, 6]);
		translate([19.1,58,5])rotate([45,0,0])cube([11.3, 10, 6]);
	}

	// Make room for nuts
	translate([-30,60,0])cube([12, 12, 7]);
	translate([18,60,0])cube([12, 12, 7]);

	// Hole for motor axis
	cylinder(15,2.5,2.5);
	// Hole for ensuring that the pin does not rotate
	translate([0,6,12])rotate([90,0,0])cylinder(12,1,1);

	// Holes for camera platform
	translate([24,66,0])cylinder(30,3,3);
	translate([-24,66,0])cylinder(30,3,3);

	// Clean edges
	translate([-14.5,0,0])rotate([0,0,21.7])cube([8, 70, 20]);
	translate([-40,60,0]) cube([10, 12, 30]);

	// Clean more edges
	translate([5.9,0,0])rotate([0,0,-21.7])cube([8, 68, 20]);
	translate([30,60,0]) cube([10, 12, 30]);
}
}
module nema_17_mount()
{
	$fs = 0.1;

	wall_thickness = 5;
	motor_width = 42;
   frame_length = 100;	
	frame_width = motor_width + (wall_thickness + 1)*2;
	bolt = 4;
	height = 25;
	
	//these are all the mount point holes.
	x1 = -wall_thickness;
	y1 = wall_thickness*2;
	x2 = frame_width+wall_thickness;
	y2 = wall_thickness*2;
	x3 = -wall_thickness;
	y3 = frame_width-wall_thickness*2;
	x4 = frame_width + wall_thickness;
	y4 = frame_width-wall_thickness*2;
	
	//center the whole thing in X
	translate([-frame_width/2, 0, 0])
	{
		difference()
		{
			//build the main unit.
			union()
			{
				//structure
				cube([wall_thickness, frame_width, frame_width]); //front face
				cube([frame_width, wall_thickness, frame_width]); //left face
				translate([frame_width-wall_thickness, 0, 0])     //right face
					cube([wall_thickness, frame_width, frame_width]);
				
	

		
			}


			//front left mount hole
			echo(x1, y1);
			translate([x1, y1, 0])
			{
				cylinder(r=bolt/2, h=wall_thickness);
				translate([0,0,wall_thickness])
					cylinder(r=bolt, h=wall_thickness*2);
			}
			
			//front right mount hole
			echo(x2, y2);
			translate([x2, y2, 0])
			{
				cylinder(r=bolt/2, h=wall_thickness);
				translate([0,0,wall_thickness])
					cylinder(r=bolt, h=wall_thickness*2);			
			}
			
			//rear left mount hole
			echo(x3, y3);
			translate([x3, y3, 0])
			{
				cylinder(r=bolt/2, h=wall_thickness);
				translate([0,0,wall_thickness])
					cylinder(r=bolt, h=wall_thickness*2);
			}
			
			//rear right mount hole
			echo(x4, y4);
			translate([x4, y4, 0])
			{
				cylinder(r=bolt/2, h=wall_thickness);
				translate([0,0,wall_thickness])
					cylinder(r=bolt, h=wall_thickness*2);
			}
			
			//mount hole slits
			translate([frame_width + wall_thickness*1.5, frame_width-wall_thickness*2, wall_thickness/2])
				cube(size=[wall_thickness, 0.1, wall_thickness*3], center=true);
			translate([frame_width + wall_thickness*1.5, wall_thickness*2, wall_thickness/2])
				cube(size=[wall_thickness, 0.1, wall_thickness*3], center=true);
			translate([-wall_thickness*1.5, frame_width-wall_thickness*2, wall_thickness/2])
				cube(size=[wall_thickness, 0.1, wall_thickness*3], center=true);
			translate([-wall_thickness*1.5, wall_thickness*2, wall_thickness/2])
				cube(size=[wall_thickness, 0.1, wall_thickness*3], center=true);

			//nema 17 mount
			rotate([90, 0, 0])
			{
				translate([frame_width/2+0.5, height, -wall_thickness])
				{
					translate([15.5, 15.5, 0])
						cylinder(r=bolt/2, h=wall_thickness+1);
					translate([-15.5, 15.5, 0])
						cylinder(r=bolt/2, h=wall_thickness+1);
					translate([15.5, -15.5, 0])
						cylinder(r=bolt/2, h=wall_thickness+1);
					translate([-15.5, -15.5, 0])
						cylinder(r=bolt/2, h=wall_thickness+1);

					cylinder(r=11.5, h=wall_thickness+1);

					translate([-11.5, 0, 0])
						cube([23, frame_width, wall_thickness+1]);
				}
			}

			//back slant cutaway
			// translate([0, 0, frame_width+wall_thickness])
			//	rotate([45, 0, 0])
			//		translate([-frame_width, 0, -frame_width*2])
			//			cube(size=[frame_width*4, frame_width*2, frame_width*4]);

			//front anti-warp circle
			//translate([frame_width/2, wall_thickness*1.25, 0])
			//	rotate([90, 0, 0])
			//		cylinder(r=wall_thickness, h=wall_thickness*2);

			//middle anti-warp circle			
			translate([0, motor_width/2 + wall_thickness, 0])
				rotate([0, 90, 0])
					cylinder(r=wall_thickness, h=frame_width+1);

			//cutout / tidy up cubes.
			translate([wall_thickness, wall_thickness-0.1, -1])
				cube([frame_width-wall_thickness*2, frame_width-wall_thickness, motor_width*2]);
			translate([-frame_width/2,-frame_width/2, wall_thickness+motor_width])
				cube([frame_width*2, frame_width*2, frame_width]);
			translate([-frame_width/2, -frame_width/2,-frame_width])
				cube([frame_width*2, frame_width*2, frame_width]);
		}
	}
}
