//class to display message of gameover and build function

class Gameover {
  
 String startgame_message = "Start PONG game!"; 
 boolean start_message = true;
 String gameover_message = "Game over! Start again!";
 

 
 String display_gameover_message() {
            if(start_message){
            return startgame_message;
            }
            else {
              start_message = false;
            return gameover_message;
            }
 }
}