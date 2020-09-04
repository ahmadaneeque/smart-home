// Wire Slave Sender
// by Nicholas Zambetti <http://www.zambetti.com>

// Demonstrates use of the Wire library
// Sends data as an I2C/TWI slave device
// Refer to the "Wire Master Reader" example for use with this

// Created 29 March 2006

// This example code is in the public domain.


#include <Wire.h>

static int port;
static bool update_flag = false;

void setup() {
  pinMode(LED_BUILTIN, OUTPUT);
  Wire.begin(4);                // join i2c bus with address #8
  Wire.onRequest(requestEvent); // register event
  Wire.onReceive(receiveEvent); // register event
  
  //Wire.begin(4);                // join i2c bus with address #4
  //Wire.onReceive(receiveEvent); // register event
  Serial.begin(9600);           // start serial for output
}

void loop() {
  delay(1000);
//  Wire.beginTransmission(10);  // transmit to device #4
//  Wire.write("brother");        // address one
//  Wire.endTransmission();     // stop transmitting
}

// function that executes whenever data is requested by master
// this function is registered as an event, see setup()
void requestEvent() {
  if (update_flag)
  {
    Wire.write(port); // respond with message of 6 bytes
    Wire.write(digitalRead(port)); // respond with message of 6 bytes
  }
  else{
     Wire.write(0); // respond with message of 6 bytes
     Wire.write(0); // respond with message of 6 bytes
  }
  // as expected by master
}

void receiveEvent(int howMany)
{
  Serial.print("how many ");         // print the character 
  Serial.println(howMany);         // print the character 
  port = Wire.read(); // receive byte as a character
  if (howMany>1)
  {
    int logic = Wire.read();    
    digitalWrite(port, logic);   // turn the LED on (HIGH is the voltage level)
//    update_flag++;
  }
 
}
