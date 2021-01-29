class BackgroundTiles{
  private PVector position;
  private PVector pixelPosition;
  private int size;
  TilesPositionBean tileState;
  
  public BackgroundTiles(float x, float y, int size){
    this.position = new PVector();
    this.pixelPosition = new PVector();
    this.tileState = new TilesPositionBean();
    
    this.position.x = x;
    this.position.y = y;
    this.size = size;
    
    this.pixelPosition.x = this.position.x * this.size;
    this.pixelPosition.y = this.position.y * this.size;
  }
  
  public void setIsTilePresent(boolean value, int tilePosition){
    this.tileState.setTilesPositionBeanValues(tilePosition, value);
  }
  
  public TilesPositionBean getTilesAvailable(){
    return this.tileState;
  }
  
  void createTiles(){  
    noStroke();
    fill(170, 84, 14, 90);
    rect(this.pixelPosition.x+10, this.pixelPosition.y+10, this.size-10, this.size-10);
  }
}    
