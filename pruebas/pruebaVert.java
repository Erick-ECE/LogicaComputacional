class pruebaVert {
	public static void main(String[] args) {
		 int x=2;
        int y=0;
        for(int i = 0; i < 3; i++){
          y= (y==3) ? 0: y;   
         for(int j = 0; j < 3; j++){
                           
         System.out.println("normal :");
         System.out.printf("%d %d %n" , i, j );
         System.out.println("giro :");
         System.out.printf("%d %d %n" , i, x );
        
          x--; 
          x = (x ==-1) ? 2 : x;
        }
         y++;
      }
	}
}