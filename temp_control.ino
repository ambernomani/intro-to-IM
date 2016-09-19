const int tempPin = A0;
const int redLED = 7;
const int blueLED = 8;
const int redLED2 = 2;
const int blueLED2 = 4;

int sensorVal;

void setup() {
  pinMode(redLED, OUTPUT);
  pinMode(blueLED, OUTPUT);
  pinMode(redLED2, OUTPUT);
  pinMode(blueLED2, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  int delayTime;

  int dim;
  int bright;
  
  sensorVal = analogRead(tempPin);
  delayTime = sensorVal;
  Serial.println(sensorVal);

  if (sensorVal < 150){
    digitalWrite(redLED2, LOW);
    digitalWrite(blueLED2, HIGH);
    digitalWrite(redLED, LOW); //flashing lights are turned off
    digitalWrite(blueLED, LOW);  
  }else{
    digitalWrite(blueLED2, LOW);
    digitalWrite(redLED2, HIGH);
    
    //flashing lights are on
    digitalWrite(redLED, HIGH);
    digitalWrite(blueLED, LOW);
    delay(delayTime);
    digitalWrite(redLED, LOW); 
    digitalWrite(blueLED, HIGH);
    delay(delayTime);
  }

  
}
