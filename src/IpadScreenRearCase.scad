$fn=25;

/*
This is an experimental model for a case for recycling a first generation ipad screen.
Please see video on youtube.com/spidermaf for more details
https://www.youtube.com/watch?v=E-tcDI7Qrt4

Original easy box scad taken from:
https://www.openscad.info/index.php/2020/07/07/the-easiest-project-box/

-Spidermaf

*/

$fn=25;
BOX_W = 186; // Box Width (changed not printed
BOX_L = 239;// Box Length
BOX_H = 25; // Box Height
STANDOFF_DROP = 5;

SCREW_SIZE = 1.5; // Screw size radius.

CORNER_RADIUS = 3; // Radius of corners (was 3)
WALL_THICKNESS = 2;// Wall Thickness

POST_OFFSET=10;

module croplcdWidth()  {    


translate ([-100,-135,-3]) 
cube( [200,100,30]);

translate ([-100,-9,-3]) 
cube( [200,170,30]);    
    
translate ([-100,-70,-3]) 
cube( [125,170,30]);   

}

module cropPorts(){
translate ([-100,-135,-3]) 
cube( [200,70,30]);

translate ([-100,53,-3]) 
cube( [200,70,30]);

translate ([-100,-70,-3]) 
cube( [170,170,30]);  
 
}

module cropButtons(){
translate ([10,-135,-3]) 
cube( [200,300,30]);

translate ([-100,-150,-3]) 
cube( [200,255,30]); 
 
}

module lowerStandoffs(){
translate ([-92,-119,25-STANDOFF_DROP]) 
cube( [184,236,30]);
 
}
    
module buttons(){
    /* buttons */
    
    translate([88,-90,0]){
    
    translate([20.5,50,0]){
    cylinder(h=5,r=1.25);
    cylinder(h=1,r=3);}
    
    translate([20.5,57,0]){
    cylinder(h=5,r=1.25);
    cylinder(h=1,r=3);}
    
    translate([20.5,64,0]){
    cylinder(h=5,r=1.25);
    cylinder(h=1,r=3);}
    
    translate([20.5,71,0]){
    cylinder(h=5,r=1.25);
    cylinder(h=1,r=3);}
    
    translate([20.5,78,0]){
    cylinder(h=5,r=1.25);
    cylinder(h=1,r=3);} }
    
    }
    
 module bracket(){
     rotate([180,0,0]) {
     translate([88,50,0]) {
    /*card backstop bracket*/
    difference(){    
            union(){
    translate([14.5,-53,0]) 
    cube( [12,90,3]);
        
    translate([14.5,-24,0])
        cube( [20,8,3]); 
                
    translate([14.5,20,0])
        cube( [20,8,3]);  
     
    translate([26.5,-24,-4])
        cube( [8,8,6]); 
                
    translate([26.5,20,-4])
        cube( [8,8,6]);            
            }           
    translate([20.5,-21,0])           
    cylinder(h=20,r=2);
               
    translate([20.5,24,0])           
    cylinder(h=20,r=2);  } 
    
}
}
     }   

module buttonHoles(){
    
    translate([0,125,8]) {
rotate([90,0,0]) {
              
cylinder(h=50,r=1.75);
    
translate([1.5,7,0]) 
cylinder(h=50,r=1);    

translate([-18,0,0]) 
    cylinder(h=50,r=1.75);

translate([-30,0,0]) 
    cylinder(h=50,r=1.75);

translate([-46,0,0]) 
    cylinder(h=50,r=1.75);

translate([-64,0,0]) 
    cylinder(h=50,r=1.75);

translate([-74,7,0]) 
    cylinder(h=50,r=2);
    
}}
    
    }

module caseBack(){
difference() {
union() {
/* box start */
linear_extrude( BOX_H )
    difference(){
        offset(r=CORNER_RADIUS) 
            square( [BOX_W, BOX_L], center=true );
        
        offset( r= CORNER_RADIUS - WALL_THICKNESS )
            square( [BOX_W-WALL_THICKNESS, BOX_L-WALL_THICKNESS], center=true );
    }


coordinates = [ [0,0],[0,BOX_L],[BOX_W,BOX_L],[BOX_W,0] ];

translate ( [-BOX_W/2, -BOX_L/2] )
    hull()
    for (i = coordinates)
        translate(i) sphere(CORNER_RADIUS);

p_w = BOX_W - POST_OFFSET;
p_l = BOX_L - POST_OFFSET;

resize([p_w,p_l,0]) // Move the posts in from the edge
    translate([-BOX_W/2,-BOX_L/2,0])
       for (i = coordinates)
           translate(i)
           scale([BOX_W/p_w,BOX_L/p_l])
               difference(){
                 cylinder(h=BOX_H,r=CORNER_RADIUS);
                 cylinder(h=BOX_H,r=SCREW_SIZE/2);
               }
  
      
               
    /*card backstop*/
    difference(){           
    translate([14.5,-53,0]) 
    cube( [12,90,10]);
               
    translate([20.5,-21,5])           
    cylinder(h=20,r=1.9);
               
    translate([20.5,24,5])           
    cylinder(h=20,r=1.9);  }         

               
              }      /* end of box */       

               

/* port holes  */
translate([70,-50,20])  
rotate([0,90,0]) {

    translate([1,3,0])               
        cube( [12,10,50]);
                   
    translate([5,20,0])               
        cube( [8,18,50]);
                   
    translate([0,41,0])               
        cube( [13,31,50]);
        
    translate([5.5+1,72+2.5+5.5,0])   {            
        cylinder(h=50,r=5.5);}
        
    translate([ 5.5+2,80-5.5,0])   {     
        cube( [5.5,11,50]);}

    
}
buttonHoles();
/*  if you are sizing the ports and holes, these crops
    give you sections to print out and test

croplcdWidth();
cropPorts();
cropButtons();*/
lowerStandoffs();

/*Screen tab groove*/    
translate([-94.5,-60,21.75]){ 
    cube( [1.5,120,1.25]);   } 

}



/*bushes for button card*/
translate([0,125,8]) {
rotate([90,0,0]) {   

difference() {
translate([-9,0,5])
    cylinder(h=5.3,r=4.5);
translate([-9,0,5])
    cylinder(h=5.3,r=1.8);
     }

difference() {
translate([-54,0,5])
    cylinder(h=5.3,r=4.5);
translate([-54,0,5])
    cylinder(h=5.3,r=1.8);
     }
 }
 }
}


caseBack();

buttons();
bracket();


 
