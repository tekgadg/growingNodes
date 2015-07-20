ArrayList<PVector> particles = new ArrayList();
ArrayList<Float> strokeVal = new ArrayList();

float angleX, angleY, angleZ;

float frameCountDivNum = (float)1;

float spinRate = (float)0.05;

void setup()
{
  size(1280, 720, OPENGL);
    
  PVector start = new PVector(3, 5, 2);
  particles.add(start);
  
  float startStroke = 255;
  strokeVal.add(startStroke);
  
  frameRate(30);
  
}

void draw()
{
  background(0);
  
  //angleX += 0.3;
  angleY += spinRate;
  //angleZ += 0.2;
  
  pushMatrix();
    translate(width/2, height/2);
    
    
    for (int i = 0; i < particles.size(); i++)
    {   
        PVector temp = particles.get(i);
      
        pushMatrix();
          //rotateX(angleX);
          rotateY(angleY);
          //rotateZ(angleZ);
          
          translate(temp.x * sin(millis()/(500 * 100)), temp.y * sin(millis()/(500 * 100)), temp.z * sin(millis()/(500 * 100)));
          
          stroke(255);
          fill( 255 );
          sphere(1);
          
          for (int h = 0; h < particles.size() - 1; h++)
          {
              PVector lineTemp = particles.get(h);
              stroke( random(200, 255) );
              strokeWeight(random((float)0.05));
              line(lineTemp.x, lineTemp.y, lineTemp.z, temp.x, temp.y, temp.z);
            
          }
          
        popMatrix();
    }
  
  popMatrix();
  
  
  if (frameCount % 1 == 0 && spinRate > 0)
  {
      for (int a = 0; a < 1; a++)
      {
        //PVector start = new PVector(random(-frameCount/frameCountDivNum,frameCount/frameCountDivNum), random(-frameCount/frameCountDivNum,frameCount/frameCountDivNum), random(-frameCount/frameCountDivNum,frameCount/frameCountDivNum));
        
        float x = noise(frameCount) * random(-frameCount/frameCountDivNum,frameCount/frameCountDivNum);
        float y = noise(frameCount * 2) * random(-frameCount/frameCountDivNum,frameCount/frameCountDivNum);
        float z = noise(frameCount * 4) * random(-frameCount/frameCountDivNum,frameCount/frameCountDivNum);
        
        PVector start = new PVector( x, y, z  );
        
        particles.add(start);
        
//        float tempStrokeVal = random(200, 255);
//        strokeVal.add(tempStrokeVal);
      }
      frameCountDivNum += (float) 0.001;
    
      
  }
  
  spinRate -= (float) 0.0001;
    
  if (spinRate < 0)
  {
      particles.remove(particles.size()-1);
      //strokeVal.remove(strokeVal.size());
  }
  
  //saveFrame("frames2/hello-######.png");
  
}
