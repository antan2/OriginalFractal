int t = 0;
int t2 = 0;
int s = 1;
public void setup() {
  size(1000, 1000);
}
public void draw() {
  background(150, 150, 255);
  fractal(500, 900, TWO_PI-HALF_PI, t, 700-t, s);
  noStroke();
  fill(160, 255, 110);
  rect(0, 900, 1000, 100);
  
  if(t<= 650)
    t++;
  t2++;
}
public void fractal(float x, float y, float rot, float siz, int lim, int season) {
  stroke(200, 165, 120);
  strokeWeight(siz/20);
  if(siz < lim && siz < 40 && lim < 70){
    if(season != 1){
      leaf(x, y, rot, siz, season);
      leaf(x, y, (float)(rot + 0.3*PI + PI/24*Math.sin(t2/75.0)), siz, season);
      leaf(x, y, (float)(rot - 0.3*PI + PI/24*Math.sin(t2/75.0)), siz, season);
    }else{
      leaf(x, y, TWO_PI-HALF_PI, siz, season);
    }
  }else{
    line(x, y, (float)(x+siz*Math.cos(rot)/2), (float)(y+siz*Math.sin(rot)/2));
  }
  if(siz >= lim){
     fractal((float)(x+siz*Math.cos(rot)/2), (float)(y+siz*Math.sin(rot)/2), (float)(rot + 0.3*PI + PI/32*Math.sin(t2/75.0)), siz*2/3, lim, season);
     fractal((float)(x+siz*Math.cos(rot)/2), (float)(y+siz*Math.sin(rot)/2), (float)(rot - 0.3*PI + PI/32*Math.sin(t2/75.0)), siz*2/3, lim, season);
  }
}

public void leaf(float x, float y, float rot, float siz, int season){
  if(season == 2)
    fill(0, 255, 0, 175);
  if(season == 3)
    fill(255, 65, 25, 175);
  noStroke();
  if(season != 1){
    quad(x, y, (float)(x+siz*Math.cos(rot+QUARTER_PI)/3), (float)(y+siz*Math.sin(rot+QUARTER_PI)/3), (float)(x+siz*Math.cos(rot)), (float)(y+siz*Math.sin(rot)), (float)(x+siz*Math.cos(rot-QUARTER_PI)/3), (float)(y+siz*Math.sin(rot-QUARTER_PI)/3));
  }else{
    fill(250, 185, 220);
    beginShape();
    curveVertex(x, y);
    curveVertex(x, y);
    curveVertex((float)(x+siz*Math.cos(rot+PI/8)/2), (float)(y+siz*Math.sin(rot+PI/8)/2));
    curveVertex((float)(x+siz*Math.cos(rot)), (float)(y+siz*Math.sin(rot)));
    curveVertex((float)(x+siz*Math.cos(rot)), (float)(y+siz*Math.sin(rot)));
    endShape();
    beginShape();
    curveVertex(x, y);
    curveVertex(x, y);
    curveVertex((float)(x+siz*Math.cos(rot-PI/8)/2), (float)(y+siz*Math.sin(rot-PI/8)/2));
    curveVertex((float)(x+siz*Math.cos(rot)), (float)(y+siz*Math.sin(rot)));
    curveVertex((float)(x+siz*Math.cos(rot)), (float)(y+siz*Math.sin(rot)));
    endShape();
    fill(255, 255, 255);
    beginShape();
    curveVertex(x, y);
    curveVertex(x, y);
    curveVertex((float)(x+siz*Math.cos(rot+PI/8)/4), (float)(y+siz*Math.sin(rot+PI/8)/4));
    curveVertex((float)(x+siz*Math.cos(rot)/2), (float)(y+siz*Math.sin(rot)/2));
    curveVertex((float)(x+siz*Math.cos(rot)/2), (float)(y+siz*Math.sin(rot)/2));
    endShape();
    beginShape();
    curveVertex(x, y);
    curveVertex(x, y);
    curveVertex((float)(x+siz*Math.cos(rot-PI/8)/4), (float)(y+siz*Math.sin(rot-PI/8)/4));
    curveVertex((float)(x+siz*Math.cos(rot)/2), (float)(y+siz*Math.sin(rot)/2));
    curveVertex((float)(x+siz*Math.cos(rot)/2), (float)(y+siz*Math.sin(rot)/2));
    endShape();
    if(rot >= -1*HALF_PI){
      leaf(x, y, (float)(rot-TWO_PI/5.0), siz, season);
    }
  }
}
public void mouseClicked(){
  s++;
  if(s>3){
    s = 1;
  }
}
