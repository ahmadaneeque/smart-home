/*********
  Rui Santos
  Complete project details at https://randomnerdtutorials.com  
*********/
#include <FS.h>                   //this needs to be first, or it all crashes and burns...
#include <painlessMesh.h>
#include <PubSubClient.h>

//#include <ESP8266WiFi.h>
//#include <DNSServer.h>
//#include <ESP8266WebServer.h>
#include <WiFiManager.h>         // https://github.com/tzapu/WiFiManager

//#include <ESP8266mDNS.h>
#include <WiFiClient.h>

#include <ArduinoJson.h>          //https://github.com/bblanchon/ArduinoJson
#include <Wire.h>


#define   BRIDGE_NODE 1
#define HOSTNAME "MQTT_Bridge"
#define   MESH_PREFIX     "whateveryouwant"
#define   MESH_PASSWORD   "somethingSneaky"
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

bool shouldSaveConfig=false;

//char mqtt_server[40];
char mqtt_port[6] = "1883";
char dev_name[33] = "Device Name";
char mqtt_server[50] = "ahmad-HP-G62-Notebook-PC.local";
char mesh_name[10]="smarthome";
char mesh_pwd[10]="smarthome";

painlessMesh  mesh;
IPAddress getlocalIP();

IPAddress myIP(0,0,0,0);

StaticJsonDocument<100> jsonload;

WiFiClient wifiClient;

void receivedCallback( const uint32_t &from, const String &msg );
void mqttCallback(char* topic, byte* payload, unsigned int length);
IPAddress getlocalIP();

PubSubClient mqttClient(wifiClient);
//mqtt_server, 1883, mqttCallback,
void setup() {
  Serial.begin(115200);
  Serial.println();
  Serial.println("mounting FS...");

  if (SPIFFS.begin()) {
    Serial.println("mounted file system");
    if (SPIFFS.exists("/config.json")) {
      //file exists, reading and loading
      Serial.println("reading config file");
      File configFile = SPIFFS.open("/config.json", "r");
      if (configFile) {
        Serial.println("opened config file");
        size_t size = configFile.size();
        // Allocate a buffer to store contents of the file.
        std::unique_ptr<char[]> buf(new char[size]);

        configFile.readBytes(buf.get(), size);
       /* DynamicJsonDocument jsonBuffer;
        JsonObject json = jsonBuffer.parseObject(buf.get());
        json.printTo(Serial);
        if (json.success()) {
          Serial.println("\nparsed json");

          strcpy(mqtt_server, json["mqtt_server"]);
          strcpy(mqtt_port, json["mqtt_port"]);
          strcpy(dev_name, json["dev_name"]);
        } else {
          Serial.println("failed to load json config");
        }*/
      }
    }
  } else {
    Serial.println("failed to mount FS");
  }

  Serial.print("hello");
  //Serial.println(dev_name);
  //Serial.println(mqtt_server);
  
  WiFiManagerParameter custom_mqtt_server("server", "mqtt server", mqtt_server, 40);
  WiFiManagerParameter custom_mqtt_port("port", "mqtt port", mqtt_port, 5);
  WiFiManagerParameter custom_dev_name("name", "device name", dev_name, 32);
  WiFiManagerParameter custom_mesh_name("mesh_name", "mesh name", mesh_name, 12);
  WiFiManagerParameter custom_mesh_pwd("mesh_pasword", "mesh password", mesh_pwd, 6);

  // WiFiManager
  // Local intialization. Once its business is done, there is no need to keep it around
  WiFiManager wifiManager;
  
  // Uncomment and run it once, if you want to erase all the stored information
  //wifiManager.resetSettings();
  
  // set custom ip for portal
  //wifiManager.setAPConfig(IPAddress(10,0,1,1), IPAddress(10,0,1,1), IPAddress(255,255,255,0));

  //add all your parameters here
  wifiManager.addParameter(&custom_mqtt_server);
  wifiManager.addParameter(&custom_mqtt_port);
  wifiManager.addParameter(&custom_dev_name);
  wifiManager.addParameter(&custom_mesh_name);
  wifiManager.addParameter(&custom_mesh_pwd);
  
  // fetches ssid and pass from eeprom and tries to connect
  // if it does not connect it starts an access point with the specified name
  // here  "AutoConnectAP"
  // and goes into a blocking loop awaiting configuration
  
  // or use this for auto generated name ESP + ChipID
  //wifiManager.autoConnect();
  if (!wifiManager.makeAP("smart-node")) {
    Serial.println("failed to connect and hit timeout");
    delay(3000);
    //reset and try again, or maybe put it to deep sleep
    ESP.reset();
    delay(5000);
  }
  // if you get here you have connected to the WiFi
  String ssid;
  String psw;
  wifiManager.getWifiCredentials(ssid, psw);
  
  strcpy(mqtt_server, custom_mqtt_server.getValue());
  strcpy(mqtt_port, custom_mqtt_port.getValue());
  strcpy(dev_name, custom_dev_name.getValue());
  
  //mqttClient.setServer(mqtt_server, int(mqtt_port));
  //mqttClient.setCallback(mqttCallback);

  if (shouldSaveConfig) {
    Serial.println("saving config");
       
    /*DynamicJsonDocument jsonBuffer;
    JsonObject json = jsonBuffer.createObject();
    json["mqtt_server"] = mqtt_server;
    json["mqtt_port"] = mqtt_port;
    json["device name"] = dev_name;

    File configFile = SPIFFS.open("/config.json", "w");
    if (!configFile) {
      Serial.println("failed to open config file for writing");
    }

    json.printTo(Serial);
    json.printTo(configFile);
    configFile.close();
    //end save*/
  }

 // server.begin();
  mqttClient.setServer(mqtt_server, 1883);
  mqttClient.setCallback(mqttCallback);

  mesh.setDebugMsgTypes( ERROR | STARTUP | CONNECTION );  // set before init() so that you can see startup messages

  // Channel set to 6. Make sure to use the same channel for your mesh and for you other
  // network (STATION_SSID)
  mesh.init( MESH_PREFIX, MESH_PASSWORD, MESH_PORT, WIFI_AP_STA, WIFI_CHANNEL );
  //mesh.onReceive(&receivedCallback);
  mesh.onReceive(&receivedCallback);
  

  #ifdef BRIDGE_NODE
  mesh.stationManual(ssid.c_str(), psw.c_str());
  mesh.setHostname(HOSTNAME);
  #endif
  
}
void loop(){

    mesh.update();
    #ifdef BRIDGE_NODE
    mqttClient.loop();
    #endif

    /*mqttClient.loop();
    if (mqttClient.connect("painlessMeshClient")) {
      mqttClient.publish("house","Ready hello world!");
      mqttClient.subscribe("painlessMesh/to/#");
    } 
    else{
      Serial.println("connection unsecuessful");
    }
    */
    
    if(myIP != getlocalIP()){
      myIP = getlocalIP();
      Serial.println("My IP is " + myIP.toString());

  
  }
  //  #ifdef BRIDGE_NODE
    if (mqttClient.connect("painlessMeshClient")) {
      mqttClient.publish("painlessMesh/from/gateway","Ready!");
      mqttClient.subscribe("painlessMesh/to/#");
    }
    else{
       Serial.println("connection unsecuessful");
    }
//    #endif
  if (Serial.available()) {
    // read the incoming byte:
//    int incomingByte = Serial.read();

    // say what you got:
    Serial.print("I received: ");
    Serial.write(Serial.read());
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
