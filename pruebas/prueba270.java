class prueba270 {
	public static void main(String[] args) {
		 int x=0;
      int y=2;
        for(int i = 0; i < 3; i++){
          y= (y==-1) ? 2: y;   
         for(int j = 0; j < 3; j++){
                           
         //System.out.printf("%d %d %n" , i, j );
         System.out.println("rot 270:");
         System.out.printf("%d %d %n" , x, y );
        
          x++; 
          x = (x ==3) ? 0 : x;
        }
         y--;
      }
	}
}