#include <Servo.h>

Servo myservo;

const int motor1Pin = 9;    
const int motor2Pin = 8;    

int pos = 0;
 
void setup() {
    // set pins you're using as outputs:
    pinMode(motor1Pin, OUTPUT);
    pinMode(motor2Pin, OUTPUT);
     myservo.attach(10);
  }
 
void loop() {
      // turn the motor in one direction:
      digitalWrite(motor1Pin, LOW);   // set leg 1 of the H-bridge low
      digitalWrite(motor2Pin, HIGH);  // set leg 2 of the H-bridge high
      delay(1500); // wait for a second
   
      // stop the motor spinning :
      digitalWrite(motor1Pin, LOW);   // set leg 1 of the H-bridge low
      digitalWrite(motor2Pin, LOW);  // set leg 2 of the H-bridge high
      for (pos = 0; pos <= 180; pos += 5) { // goes from 0 degrees to 180 degrees
        myservo.write(pos);              // tell servo to go to position in variable 'pos'
      }
      delay(1000); // wait for a second
 
      // turn the motor in the other direction :
      digitalWrite(motor1Pin, HIGH);   // set leg 1 of the H-bridge low
      digitalWrite(motor2Pin, LOW);  // set leg 2 of the H-bridge high
      delay(1000); // wait for a second
 
      // stop the motor spinning :
      digitalWrite(motor1Pin, LOW);   // set leg 1 of the H-bridge low
      digitalWrite(motor2Pin, LOW);  // set leg 2 of the H-bridge high
      for (pos = 180; pos >= 0; pos -= 5) { // goes from 180 degrees to 0 degrees
        myservo.write(pos);              // tell servo to go to position in variable 'pos'
      }
      delay(1500); // wait for a second
  }
