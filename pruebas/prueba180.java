class prueba180 {
	public static void main(String[] args) {
		 int x=2;
        int y=2;
        for(int i = 0; i < 3; i++){
          y= (y==-1) ? 0: y;   
         for(int j = 0; j < 3; j++){
                           
         //System.out.printf("%d %d %n" , i, j );
         System.out.println("rot 180:");
         System.out.printf("%d %d %n" , y, x );
        
          x--; 
          x = (x ==-1) ? 2 : x;
        }
         y--;
      }
	}
}