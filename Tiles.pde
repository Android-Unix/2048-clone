class Tiles{
  public PVector position;
  private PVector pixelPosition;
  private int size;
  private int value;
  
  public Tiles(float x, float y, int size){
    this.position = new PVector();
    this.pixelPosition = new PVector();    

    if(random(0, 1) < 0.2){
      this.value = 4;
    }
    else {
      this.value = 2;
    }
    
    this.position.x = x;
    this.position.y = y;
    this.size = size;
    
    this.pixelPosition.x = this.position.x * this.size;
    this.pixelPosition.y = this.position.y * this.size;
  }
  
  void createTiles(){  
    noStroke();
    showValues();
    fill(256, 0, 0, 100);
    rect(this.pixelPosition.x+10, this.pixelPosition.y+10, this.size-10, this.size-10);
  }
  
  void moveTiles(int tileposition){
    PVector newPosition = tilesCordinates.get(tileposition);
    this.position.x = newPosition.x;
    this.position.y = newPosition.y;
    
    this.pixelPosition.x = this.position.x * this.size;
    this.pixelPosition.y = this.position.y * this.size;
    
    noStroke();
    showValues();
    fill(256, 0, 100, 30);
    rect(this.pixelPosition.x+10, this.pixelPosition.y+10, this.size-10, this.size-10);
  }
   
  private void showValues(){
    fill(255);
    textSize(32);
    textAlign(CENTER);
    text(this.value, this.pixelPosition.x + this.size / 2 + (this.size * 0.05), this.pixelPosition.y + this.size / 2 + (0.15 * this.size));
  }
}
