Player player;
int size;
boolean tilesShown = false;
ArrayList<PVector> tilesCordinates;

void setup(){
  size(411, 411);
  background(243, 166, 104, 30);
  
  player = new Player();
  size = 100;
  
  this.tilesCordinates = new ArrayList<PVector>();

  for (int i =0; i < 4; i++){
    for (int j = 0; j < 4; j++){
      tilesCordinates.add(new PVector(i, j));
    }
  }
}


void draw(){ 
  background(243, 166, 104, 30);
  player.createbackgroundTiles();
  player.showTiles(tilesShown);
}

void keyPressed(){
  if(keyCode == DOWN){
    player.moveAllTilesDownwards();
    player.showTiles(tilesShown);
  } else if(keyCode == UP){
    player.moveAllTilesUpwards();
  } else if(keyCode == LEFT){
    player.moveAllTilesLeft();
  } else if(keyCode == RIGHT){
    player.moveAllTilesRight();
  }
}
