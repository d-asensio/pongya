import processing.serial.*;

Serial myPort;
final int LINE_FEED_ASCII_CHAR = 10;

final int RACKET_WIDTH = 8;
final int RACKET_HEIGHT = 40;
final int RACKET_BORDER = 4;

int initial_position, center_position, end_position, current_position;

void setup() {
  size(640, 200);
  noStroke();

  myPort = new Serial(this, "/dev/cu.usbmodem1201", 9600);
  myPort.bufferUntil(LINE_FEED_ASCII_CHAR);

  initial_position = RACKET_BORDER;
  center_position = (height / 2) - (RACKET_HEIGHT + RACKET_BORDER) / 2;
  end_position = height - RACKET_BORDER - RACKET_HEIGHT;

  current_position = initial_position;
}

void move_to_next_position () {
  if (current_position == end_position) {
    current_position = initial_position;
    return;
  }

  if (current_position == center_position) {
    current_position = end_position;
    return;
  }

  if (current_position == initial_position) {
    current_position = center_position;
    return;
  }
}

String positionMap = "HHH";

void draw_racket () {
  if (positionMap.equals("LLL")) {
      rect(RACKET_BORDER, initial_position, RACKET_WIDTH, RACKET_HEIGHT);
  }
  
  if (positionMap.charAt(2) == 'H') {
      rect(RACKET_BORDER, end_position, RACKET_WIDTH, RACKET_HEIGHT);
      return;
  }
  
  if (positionMap.charAt(1) == 'H') {
      rect(RACKET_BORDER, center_position, RACKET_WIDTH, RACKET_HEIGHT);
      return;
  }
  
  if (positionMap.charAt(0) == 'H') {
      rect(RACKET_BORDER, initial_position, RACKET_WIDTH, RACKET_HEIGHT);
      return;
  }
}

void draw() {
  background(0);  
  draw_racket();
}

void serialEvent(Serial p) {
  String receivedData = p.readString().trim();
  
  if (receivedData.length() == 3) {
    positionMap = receivedData;
  } 
} 
