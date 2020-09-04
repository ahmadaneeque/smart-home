// Wire Master Reader
// by Nicholas Zambetti <http://www.zambetti.com>

// Demonstrates use of the Wire library
// Reads data from an I2C/TWI slave device
// Refer to the "Wire Slave Sender" example for use with this

// Created 29 March 2006

// This example code is in the public domain.


#include <Wire.h>
int x = 0;

void setup() {
  Wire.begin(14);        // join i2c bus (address optional for master)
  Wire.onReceive(receiveEvent); // register event
  Serial.begin(9600);  // start serial for output
}

void loop() {
 Wire.requestFrom(4, 2);    // request 6 bytes from slave device #8

  while (Wire.available()) { // slave may send less than requested
    int c = Wire.read();    // receive a byte as character
    Serial.println("getting");
    Serial.println(c);         // print the character
  }
//  Serial.print('\n');        // print the character
//  delay(500);
  delay(5000);
  Serial.print("sending 20 on address one \n");        // print the character
  Wire.beginTransmission(4);  // transmit to device #4
  Wire.write(13);        // address one
  Wire.write(x);              // sends one byte  
  Wire.endTransmission();     // stop transmitting
  x = !x;
  //x++;
  
}

void receiveEvent(int howMany)
{
  Serial.print("how many ");         // print the character 
  Serial.println(howMany);         // print the character 
  while(1< Wire.available())
  {
     char c = Wire.read(); // receive byte as a character
     Serial.print(c);         // 
  }
  Serial.print(" received \n");
}
