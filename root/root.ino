

#include <FS.h>                   //this needs to be first, or it all crashes and burns...
#include <painlessMesh.h>
#include <PubSubClient.h>

//#include <ESP8266WiFi.h>
//#include <DNSServer.h>
//#include <ESP8266WebServer.h>
//#include <ESP8266mDNS.h>

#include <WiFiManager.h>         // https://github.com/tzapu/WiFiManager
#include <WiFiClient.h>
#include <ArduinoJson.h>          //https://github.com/bblanchon/ArduinoJson
#include <Wire.h>
#include "credential.h"

#define   TRIGGER_PIN 0
#define   BRIDGE_NODE 1
#define   HOSTNAME        "MQTT_Bridge"
//#define   MESH_PREFIX     "whateveryouwant"  //remove it
//#define   MESH_PASSWORD   "somethingSneaky"  //remove it
#define   MESH_PORT       5555
#define   WIFI_CHANNEL    6 

// Set web server port number to 80
WiFiServer server(80);

// Variable to store the HTTP request
String header;

// Auxiliar variables to store the current output state
String output5State = "off";
String output4State = "off";

// Assign output variables to GPIO pins
const int output5 = 2;
const int output4 = 1;

bool shouldSaveConfig = true;

//char mqtt_server[40];

Config confi;
const char *config_filename = "/config.json";

painlessMesh  mesh;
IPAddress getlocalIP();
IPAddress myIP(0,0,0,0);

WiFiClient wifiClient;
PubSubClient mqttClient(wifiClient);

StaticJsonDocument<100> jsonload;

void receivedCallback( const uint32_t &from, const String &msg );
void mqttCallback(char* topic, byte* payload, unsigned int length);
//mqtt_server, 1883, mqttCallback,

void setup() {
  
  pinMode(TRIGGER_PIN, INPUT);
  Serial.begin(115200);
  Serial.println();
  Serial.print("hello");
  
  bool is_config = loadConfiguration(config_filename, confi);
  if(!is_config | (digitalRead(TRIGGER_PIN) == LOW)){
    
    WiFiManager wifiManager;
    
    WiFiManagerParameter custom_room_location("name", "Room Location", confi.room_location, 32);
    wifiManager.addParameter(&custom_room_location);
    
    WiFiManagerParameter custom_mesh_name("mesh_name", "mesh name", confi.mesh_name, 12);
    wifiManager.addParameter(&custom_mesh_name);
    
    WiFiManagerParameter custom_mesh_pwd("mesh_pasword", "mesh password", confi.mesh_pwd, 6);
    wifiManager.addParameter(&custom_mesh_pwd);
    
    WiFiManagerParameter custom_mqtt_server("server", "mqtt server", confi.mqtt_server, 40);
    wifiManager.addParameter(&custom_mqtt_server);
    
    WiFiManagerParameter custom_mqtt_port("port", "mqtt port", confi.mqtt_port, 5);
    wifiManager.addParameter(&custom_mqtt_port);
    
    
    if (!wifiManager.startConfigPortal()) {
      Serial.println("failed to connect and hit timeout");
      delay(3000);
      //reset and try again, or maybe put it to deep sleep
      ESP.reset();
      delay(5000);
    }     
    strcpy(confi.ssid,  wifiManager.getWiFiSSID().c_str());         
    strcpy(confi.ssid_pwd, wifiManager.getWiFiPass().c_str());         
    strcpy(confi.room_location, custom_room_location.getValue());         
    strcpy(confi.mesh_name, custom_mesh_name.getValue());         
    strcpy(confi.mesh_pwd, custom_mesh_pwd.getValue());         
    strcpy(confi.mqtt_server, custom_mqtt_server.getValue());         
    strcpy(confi.mqtt_port, custom_mqtt_port.getValue());        
    }
  //wifiManager.disconnect();
  if (shouldSaveConfig) {
    if(!saveConfiguration(config_filename, confi)) 
      Serial.println("failed to save configuration");
    Serial.println("conf saved");
  }
  delay(5000);
  //mqttClient.setServer(mqtt_server, int(mqtt_port));
  //mqttClient.setCallback(mqttCallback);
 
 // server.begin();
  mqttClient.setServer(confi.mqtt_server, 1883);
  mqttClient.setCallback(mqttCallback);

  mesh.setDebugMsgTypes( ERROR | STARTUP | CONNECTION );  // set before init() so that you can see startup messages
  // network (STATION_SSID)
  // Channel set to 6. Make sure to use the same channel for your mesh and for you other
  mesh.init(confi.mesh_name, confi.mesh_pwd, MESH_PORT, WIFI_AP_STA, WIFI_CHANNEL );
  mesh.onReceive(&receivedCallback);
  

  //#ifdef BRIDGE_NODE
  if(BRIDGE_NODE)
    mesh.stationManual(confi.ssid, confi.ssid_pwd);
//    mesh.stationManual(ssid.c_str(), psw.c_str());
  mesh.setHostname(HOSTNAME);
  
}
void loop(){
  mesh.update();
  // #ifdef BRIDGE_NODE
   if(BRIDGE_NODE)
      mqttClient.loop();
       
    if(myIP != getlocalIP()){
      myIP = getlocalIP();
      Serial.println("My IP is " + myIP.toString());
    
    //  #ifdef BRIDGE_NODE
      if (mqttClient.connect("painlessMeshClient")) {
        mqttClient.publish("painlessMesh/from/gateway","Ready!");
        mqttClient.subscribe("painlessMesh/to/#");
      }
      else{
         Serial.println("connection unsecuessful");
      }
    }
//    #endif

  if (Serial.available()) {
    // read the incoming byte:
    // int incomingByte = Serial.read();
    // say what you got:
    Serial.print("I received: ");
    Serial.write(Serial.read());
  } 
    if ( digitalRead(TRIGGER_PIN) == LOW ) {
    //delay(5000);
//    if ( digitalRead(TRIGGER_PIN) == LOW )
        ESP.reset();
  }
}


void mqttCallback(char* topic, uint8_t* payload, unsigned int length) {
  char* cleanPayload = (char*)malloc(length+1);
  payload[length] = '\0';
  memcpy(cleanPayload, payload, length+1);
  String msg = String(cleanPayload);
  free(cleanPayload);

  String targetStr = String(topic).substring(16);
  Serial.print(msg);
}


void receivedCallback( const uint32_t &from, const String &msg ) {
//  StaticJsonDocument<100> jsonload;
  Serial.printf("bridge: Received from %u msg=%s\n", from, msg.c_str());
//  DeserializationError error = deserializeJson(jsonload, msg);

//  String value = jsonload["value"].as<String>();
//  String item = jsonload["item"].as<String>();
  
  String topic = "painlessMesh/from/" + String(from);
//  +"/" + String(item);
//  mqttClient.publish(topic.c_str(), msg.c_str());
//  if (isNumber(value))
//  {
//    mqttClient.publish(topic.c_str(), String(value).toInt());
//  }
//  mqttClient.publish(topic.c_str(), value.c_str());
  mqttClient.publish(topic.c_str(), msg.c_str());
  
  jsonload.clear();
}


/*void loop(){
  WiFiClient client = server.available();   // Listen for incoming clients

  if (client) {                             // If a new client connects,
    Serial.println("New Client.");          // print a message out in the serial port
    String currentLine = "";                // make a String to hold incoming data from the client
    while (client.connected()) {            // loop while the client's connected
      if (client.available()) {             // if there's bytes to read from the client,
        char c = client.read();             // read a byte, then
        Serial.write(c);                    // print it out the serial monitor
        header += c;
        if (c == '\n') {                    // if the byte is a newline character
          // if the current line is blank, you got two newline characters in a row.
          // that's the end of the client HTTP request, so send a response:
          if (currentLine.length() == 0) {
            // HTTP headers always start with a response code (e.g. HTTP/1.1 200 OK)
            // and a content-type so the client knows what's coming, then a blank line:
            client.println("HTTP/1.1 200 OK");
            client.println("Content-type:text/html");
            client.println("Connection: close");
            client.println();
            
            // turns the GPIOs on and off
            if (header.indexOf("GET /5/on") >= 0) {
              Serial.println("GPIO 5 on");
              output5State = "on";
              digitalWrite(output5, HIGH);
            } else if (header.indexOf("GET /5/off") >= 0) {
              Serial.println("GPIO 5 off");
              output5State = "off";
              digitalWrite(output5, LOW);
            } else if (header.indexOf("GET /4/on") >= 0) {
              Serial.println("GPIO 4 on");
              output4State = "on";
              digitalWrite(output4, HIGH);
            } else if (header.indexOf("GET /4/off") >= 0) {
              Serial.println("GPIO 4 off");
              output4State = "off";
              digitalWrite(output4, LOW);
            }
            
            // Display the HTML web page
            client.println("<!DOCTYPE html><html>");
            client.println("<head><meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">");
            client.println("<link rel=\"icon\" href=\"data:,\">");
            // CSS to style the on/off buttons 
            // Feel free to change the background-color and font-size attributes to fit your preferences
            client.println("<style>html { font-family: Helvetica; display: inline-block; margin: 0px auto; text-align: center;}");
            client.println(".button { background-color: #195B6A; border: none; color: white; padding: 16px 40px;");
            client.println("text-decoration: none; font-size: 30px; margin: 2px; cursor: pointer;}");
            client.println(".button2 {background-color: #77878A;}</style></head>");
            
            // Web Page Heading
            client.println("<body><h1>ESP8266 Web Server</h1>");
            
            // Display current state, and ON/OFF buttons for GPIO 5  
            client.println("<p>GPIO 5 - State " + output5State + "</p>");
            // If the output5State is off, it displays the ON button       
            if (output5State=="off") {
              client.println("<p><a href=\"/5/on\"><button class=\"button\">ON</button></a></p>");
            } else {
              client.println("<p><a href=\"/5/off\"><button class=\"button button2\">OFF</button></a></p>");
            } 
               
            // Display current state, and ON/OFF buttons for GPIO 4  
            client.println("<p>GPIO 4 - State " + output4State + "</p>");
            // If the output4State is off, it displays the ON button       
            if (output4State=="off") {
              client.println("<p><a href=\"/4/on\"><button class=\"button\">ON</button></a></p>");
            } else {
              client.println("<p><a href=\"/4/off\"><button class=\"button button2\">OFF</button></a></p>");
            }
            client.println("</body></html>");
            
            // The HTTP response ends with another blank line
            client.println();
            // Break out of the while loop
            break;
          } else { // if you got a newline, then clear currentLine
            currentLine = "";
          }
        } else if (c != '\r') {  // if you got anything else but a carriage return character,
          currentLine += c;      // add it to the end of the currentLine
        }
      }
    }
    // Clear the header variable
    header = "";
    // Close the connection
    client.stop();
    Serial.println("Client disconnected.");
    Serial.println("");
  }
}*/
IPAddress getlocalIP() {
  return IPAddress(mesh.getStationIP());
}
