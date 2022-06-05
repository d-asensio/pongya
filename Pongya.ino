int RIGHT_SENSOR_PIN = 9;
int CENTER_SENSOR_PIN = 10;
int LEFT_SENSOR_PIN = 11;

void setup() {
  Serial.begin(9600);
  while (!Serial); // wait for serial port to connect. Needed for native USB port only

  pinMode(LED_BUILTIN, OUTPUT);
  
  pinMode(RIGHT_SENSOR_PIN, INPUT);
  pinMode(CENTER_SENSOR_PIN, INPUT);
  pinMode(LEFT_SENSOR_PIN, INPUT);
}

void loop() {
  int right_value = digitalRead(RIGHT_SENSOR_PIN);
  int center_value = digitalRead(CENTER_SENSOR_PIN);
  int left_value = digitalRead(LEFT_SENSOR_PIN);

  if (right_value == HIGH) {
    Serial.print("H");
  } else {
    Serial.print("L");
  }

  if (center_value == HIGH) {
    Serial.print("H");
  } else {
    Serial.print("L");
  }

  if (left_value == HIGH) {
    Serial.println("H");
  } else {
    Serial.println("L");
  }
}
