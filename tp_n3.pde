//Fiorella Jazmin Furnel
//legajo: 125577/0
//comision 3 
//trabajo practico n°3
//link a la exposicion 
//https://youtu.be/IZDzv05TBD8


PImage foto;
int columnas=7;
int filas=7;
int espacio=15;
boolean modoColor=false;
boolean modoOscuro=false;
boolean colorFinal=false;
int inicioAnimacion;



void setup() {
  size(800, 400);
  foto=loadImage("obra original.png");
  inicioAnimacion= frameCount;
}


  void draw() {
  background(255);
  image(foto, 0, 0, width/2, height);
  
  //color de fondo
if(modoOscuro){
  fill(0);
}else{
  fill(#DE1616);
  }
  noStroke();
  rect(width/2, 0, width/2, height); 


  //circulos
  for (int x=0; x<7; x++) {
    for (int y=0; y<7; y++) {

      float posX=420+x*42+x*espacio;
      float posY=35+y*42+y*espacio;
   
  //coloress de los circulos
       
      if ((x+y)%2==0) {
        strokeWeight(3);
        stroke(130,125,120);
       
      } 
      else {
      stroke(190,190,190);
      }
 
     
      
      // al hacer click con el mouse los circulos empiezan a titilar con diferentes colores
      // tercera animacion
      
      if(frameCount>160){
        float distancia=dist(mouseX,mouseY,posX,posY);
        if(distancia<20){
          fill(random(255),random(255),random(255));    
      }else{
          noFill();
        }
      }else{
        noFill();
      }
     // colores de la funcion de arriba
       
     if(modoColor){
       fill(0,120,255);
     }else{
       fill(#DE1616);
     }
        if(modoColor){
       fill(random(255),random(255),random(255));
     }else{
       noFill();
     }
 
   if(modoOscuro){
     fill(0);
   }else{
     fill(#DE1616);
   }
   // al pasar el mouse los circulos se rellenan de colore(fondo negro)
      
     if (modoOscuro){
       stroke(255);
       float distancia=dist(mouseX,mouseY,posX,posY);
       if(distancia<40){
         fill(random(255),random(255),random(255));
       }else{
         noFill();
   }
     }
  else if(modoColor){
    stroke(random(255),random(255),random(255));
  }else{
    if((x+y)%2==0){
      stroke(130,125,120);
    }else{
      stroke(190,190,190);
    }
  }
    float distancia=dist(mouseX,mouseY,posX,posY);
    float tam=calcularTam(distancia);
       strokeWeight(2);
       if(frameCount-inicioAnimacion>y*20){ // los circulos aparecen de a filas (primera animacion)
       
  dibujarCirculo(posX,posY,tam);
       }
      }
    }
  }
  void mousePressed(){
    if(frameCount>600){
      if(!modoColor){
      modoColor=true;
      }else{
        modoColor=false;
        modoOscuro=true;
     
    }
  }
  }
   void keyPressed(){
     if(key=='r' ||key=='R'){
       modoColor=false;
       modoOscuro=false;
       inicioAnimacion=frameCount;
     }
   }
   // cuando pasa el mouse se hacen momentaneamente mas grandes ( segunda animacion)
    
       float calcularTam(float distancia){
       float tam=32;
       if(frameCount>160&&!modoOscuro){
         if(distancia<100){
           tam=map(distancia,0,100,50,32);
         }
       }
           return tam;
       }
       void dibujarCirculo(float x,float y,float tam){
         pushMatrix();
         translate(x,y);
         rotate(radians(10));
         ellipse(0,0,tam,tam);
           popMatrix();
       }
