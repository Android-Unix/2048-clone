class TilesPositionBean{
   private int position;
   private boolean isTilePresent;
      
   public void setTilesPositionBeanValues(int position, boolean isTilePresent){
     this.position = position;
     this.isTilePresent = isTilePresent;
   }
   
   public int getPosition(){
     return this.position;
   }
   
   public boolean getIsTilePresent(){
     return this.isTilePresent;
   }
}
