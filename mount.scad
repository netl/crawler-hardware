servo_width = 40.5;
servo_depth = 20;
servo_height = 26.8;
servo_overhang = 18.5;
servo_post_offset = 16.7;

//sw = [-16.7,23.3];
//sd = [-10,10];
//sh = [-26.8,16.5];

module servo(){union(){
    //servo body
    translate([-servo_post_offset,-servo_depth/2,-servo_height])
        cube([servo_width,servo_depth,servo_height+servo_overhang]);
    
    //lip
    translate([-servo_post_offset-6,-servo_depth/2,0])
        cube([servo_width+12,servo_depth,servo_overhang]);
    
    //holes
    for(x = [-4.5, 45])
        for(y = [-5,5])
            translate([x-servo_post_offset,y,-20])
                cylinder(d=4, h=20);
}}

camera_width = 42;
camera_height = 42;

height_offset = 80;
width_offset = 16.5 + camera_width/2;


difference(){
    //frame
    union(){
        //horizontal post
        translate([-servo_width+servo_post_offset-12,-servo_depth/2-5,0])
            cube([width_offset+servo_width+servo_post_offset,servo_depth+10,5]);
        //vertical post
        translate([width_offset+servo_overhang,-servo_depth/2-5,0])
            cube([5,servo_depth+10,height_offset+servo_width+5]);
    }
    //yaw
    rotate([0,180,0])
        servo();

    //pitch
    translate([width_offset+servo_post_offset,0,height_offset])
        rotate([0,-90,0])
            servo();
}
