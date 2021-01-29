class Player{
  private ArrayList<BackgroundTiles> background;
  private ArrayList<Tiles> availableTiles, displayedTiles;
  private ArrayList<TilesPositionBean> placesToMove;
  private int size = 100;
  private ArrayList<Integer> row_1, row_2, row_3, row_4;
  
  public Player(){
    background = new ArrayList<BackgroundTiles>();
    availableTiles = new ArrayList<Tiles>();
    displayedTiles = new ArrayList<Tiles>();
    placesToMove = new ArrayList<TilesPositionBean>();
    
    row_1 = new ArrayList<Integer>();
    row_2 = new ArrayList<Integer>();
    row_3 = new ArrayList<Integer>();
    row_4 = new ArrayList<Integer>();

    row_1.add(0);
    row_1.add(4);
    row_1.add(8);
    row_1.add(12);
    
    row_2.add(1);
    row_2.add(5);
    row_2.add(9);
    row_2.add(13);
    
    row_3.add(2);
    row_3.add(6);
    row_3.add(10);
    row_3.add(14);
    
    row_4.add(3);
    row_4.add(7);
    row_4.add(11);
    row_4.add(15);
    
    for(int i = 0; i < 4; i++){
      for(int j = 0; j < 4; j++){
        availableTiles.add(new Tiles(i, j, this.size));
        background.add(new BackgroundTiles(i, j, this.size));
      }
    }
    
    //initialising the bean object with position of tiles and state
    for(int i = 0; i < availableTiles.size(); i++){
      background.get(i).setIsTilePresent(false, i);
    }
        
    int getFirstTilePosition = (int)(random(0, availableTiles.size()));
    background.get(getFirstTilePosition).setIsTilePresent(true, getFirstTilePosition);
    displayedTiles.add(availableTiles.remove((int)(getFirstTilePosition)));
    
    int getSecondTilePosition = (int)(random(0, availableTiles.size()));
    background.get(getSecondTilePosition).setIsTilePresent(true, getSecondTilePosition);
    displayedTiles.add(availableTiles.remove((int)(getSecondTilePosition)));  
  }

public void createbackgroundTiles(){
    for(int i = 0; i < background.size(); i++){
        background.get(i).createTiles();
    }
}

public void showTiles(boolean tilesShown){
  if(!tilesShown){
    for(Tiles tile : displayedTiles){
      tile.createTiles();
    }
  }
} 
     
private ArrayList<TilesPositionBean> getAllAvailablePositions(){
  for(BackgroundTiles tile : background){
      placesToMove.add(tile.getTilesAvailable());    
  }
  return placesToMove;
}
  
  public void moveAllTilesDownwards(){
    int newRandomTile = (int)(random(0, availableTiles.size()));
    background.get(newRandomTile).setIsTilePresent(true, newRandomTile);
    
    if (availableTiles.size() > 0) {
      displayedTiles.add(availableTiles.remove((int)(newRandomTile)));
    } else {
      println("GAMEOVER");
    }
    ArrayList<TilesPositionBean> availablePositions = getAllAvailablePositions();

    for(TilesPositionBean tilesAvailability : availablePositions){  
      println("---->" + tilesAvailability.getIsTilePresent());
      for (int row_4_element_id : row_4){
        if (tilesAvailability.getIsTilePresent() && tilesAvailability.getPosition() == row_4_element_id){
           println(" the tile is present in last row and tile position is --> " + (int)(tilesAvailability.getPosition()));
           println("cannot move down");
        }
      }
      
      for (int row_3_element_id : row_3){
        if (tilesAvailability.getIsTilePresent() && tilesAvailability.getPosition() == row_3_element_id){
           println(" the tile is present in third row and tile position is --> " + (int)(tilesAvailability.getPosition()));
           if (!background.get(tilesAvailability.getPosition() + 1).tileState.isTilePresent){
             println("moving to last row id --> " + (int)(tilesAvailability.getPosition() + 1));
           } else {
             println("cannot move down");
           }
        }
      }
      
      for (int row_2_element_id : row_2){
        if (tilesAvailability.getIsTilePresent() && tilesAvailability.getPosition() == row_2_element_id){
           println(" the tile is present in second row and tile position is --> " + tilesAvailability.getPosition());
           if (!background.get(tilesAvailability.getPosition() + 2).tileState.isTilePresent){
             println("moving to last row id --> " + (int)(tilesAvailability.getPosition() + 2));
           } else if (!background.get(tilesAvailability.getPosition() + 1).tileState.isTilePresent){
             println("moving to last but one row id --> " + (int)(tilesAvailability.getPosition() + 1));
           } else {
             println("cannot move down");
           }
        }
      }
      
      for (int row_1_element_id : row_1){
        if (tilesAvailability.getIsTilePresent() && tilesAvailability.getPosition() == row_1_element_id){
           println(" the tile is present in first row and tile position is --> " + (int)(tilesAvailability.getPosition()));
           if (!background.get(tilesAvailability.getPosition() + 3).tileState.isTilePresent){
             println("moving to last row and row id --> " + (int)(tilesAvailability.getPosition() + 3));
             for (Tiles displayedTiles : displayedTiles){
                 if (displayedTiles.position.x == tilesCordinates.get(tilesAvailability.getPosition()).x && 
                    displayedTiles.position.y == tilesCordinates.get(tilesAvailability.getPosition()).y
                 ){
                     displayedTiles.moveTiles(tilesAvailability.getPosition() + 3);
                 }
             }
           } else if (!background.get(tilesAvailability.getPosition() + 2).tileState.isTilePresent){
             println("moving to last but one row id --> " + (int)(tilesAvailability.getPosition() + 2));
           } else if (!background.get(tilesAvailability.getPosition() + 1).tileState.isTilePresent){
             println("moving to last but two row id --> " + (int)(tilesAvailability.getPosition() + 1));
           } else {
             println("cannot move down");
           }
        }
      }
    }
    
  }
  public void moveAllTilesUpwards(){
    print("Move Upwards");
  }
  public void moveAllTilesLeft(){
    print("Move Left");
  }
  public void moveAllTilesRight(){
    print("Move Right");
  }
}
