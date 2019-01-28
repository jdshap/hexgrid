float hexSize=50;
float midRadius=.5*hexSize*sqrt(3);

void setup(){
  size(500,500);
}

void draw(){
  background(200);
  hexCoord(-1,0);
  hexCoord(0,-1);
  hexCoord(-1,1);
  hexCoord(0,0);
  hexCoord(1,0);
  hexCoord(0,1);
  hexCoord(1,-1);
}

void hexCoord(int x,int y){
  float hexX=width/2+x*2*midRadius+y*midRadius;
  float hexY=height/2+y*1.5*hexSize;
  hexagon(hexX,hexY);
}

void hexagon(float x,float y){
  stroke(255,100,0);
  strokeWeight(10);
  
  float theta=-atan2(mouseY-y,mouseX-x);
  if(theta<0)theta+=2*PI;
  theta=(theta+PI/6)%(PI/3);
  
  if(dist(mouseX,mouseY,x,y)<=sin(PI/3)*(hexSize/sin(PI-(theta+PI/3)))){
    fill(255,100,0,50);
  }else fill(255,100,0,0);
  
  beginShape();
  for(int i=0; i<6; i++){
    vertex(x+hexSize*cos(i*PI/3+PI/6),y+hexSize*sin(i*PI/3+PI/6));
  }
  endShape(CLOSE);
}