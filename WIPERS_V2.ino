#include <Servo.h>

Servo myservoR;
Servo myservoL;
const int tempPin = A0;
const int button = 2;
const int redLed1 = 4;
const int redLed2 = 7;
const int blueLed1 = 8;
const int blueLed2 = 12;
int wiper = 0;

int buttonState;           // the current reading from the input pin

int pos = 0;
int tempVal;
int servoVal;

void setup() {
  pinMode(button, INPUT);
  pinMode(redLed1, OUTPUT);
  pinMode(redLed2, OUTPUT);
  pinMode(blueLed1, OUTPUT);
  pinMode(blueLed2, OUTPUT);
  myservoR.attach(9);
  myservoL.attach(10);
  Serial.begin(9600);
}

void loop() {
  
  buttonState = digitalRead(button);

  if (buttonState == LOW){
   
    for (pos = 0; pos <= 180; pos += 1) { // goes from 0 degrees to 180 degrees
    // in steps of 1 degree
      myservoR.write(pos);              // tell servo to go to position in variable 'pos'
      myservoL.write(pos); 
      delay(15);                       // waits 15ms for the servo to reach the position
      digitalWrite(redLed1, LOW);
      digitalWrite(redLed2, LOW);
      digitalWrite(blueLed1, HIGH);
      digitalWrite(blueLed2, HIGH);
    }
    for (pos = 180; pos >= 0; pos -= 1) { // goes from 180 degrees to 0 degrees
      myservoR.write(pos);              // tell servo to go to position in variable 'pos'
      myservoL.write(pos); 
      delay(15);                       // waits 15ms for the servo to reach the position
      digitalWrite(redLed1, LOW);
      digitalWrite(redLed2, LOW);
      digitalWrite(blueLed1, HIGH);
      digitalWrite(blueLed2, HIGH);
    }
  } else if (buttonState == HIGH){
    digitalWrite(redLed1, HIGH);
    digitalWrite(redLed2, HIGH);
    digitalWrite(blueLed1, LOW);
    digitalWrite(blueLed2, LOW);
    myservoR.write(0);
    myservoL.write(0);
  }
}
