

#include <FS.h>                   //this needs to be first, or it all crashes and burns...
#include <painlessMesh.h>
#include <PubSubClient.h>

#include <WiFiManager.h>        
#include <WiFiClient.h>
#include <ArduinoJson.h> 
#include <Wire.h>
#include "credential.h"

#define   TRIGGER_PIN 0
//todo:replace with i/o
#define   BRIDGE_NODE 1      

#define   MESH_PORT     5555
#define   WIFI_CHANNEL   6 
#define   MQTT_PORT     1883  

// Auxiliar variables to store the current output state
String output5State = "off";
String output4State = "off";

// Assign output variables to GPIO pins
const int output5 = 2;
const int output4 = 1;

bool shouldSaveConfig = true;

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
      delay(3000); //reset and try again, or maybe put it to deep sleep
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
    
    if (shouldSaveConfig) {
      if(!saveConfiguration(config_filename, confi)) 
        Serial.println("failed to save configuration");
      Serial.println("conf saved");
    }
    
  }
  
  
  delay(5000);
  
  mqttClient.setServer(confi.mqtt_server, MQTT_PORT);
  mqttClient.setCallback(mqttCallback);

  mesh.setDebugMsgTypes( ERROR | STARTUP | CONNECTION );  // set before init() so that you can see startup messages
  // network (STATION_SSID)
  // Channel set to 6. Make sure to use the same channel for your mesh and for you other
  mesh.init(confi.mesh_name, confi.mesh_pwd, MESH_PORT, WIFI_AP_STA, WIFI_CHANNEL );
  mesh.onReceive(&receivedCallback);
  
  if(BRIDGE_NODE)
    mesh.stationManual(confi.ssid, confi.ssid_pwd);

  mesh.setHostname(confi.room_location);
  
}
void loop(){
  mesh.update();
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
  if (Serial.available()) {
    Serial.print("I received: ");
    Serial.write(Serial.read());
  } 
  if ( digitalRead(TRIGGER_PIN) == LOW ) {
  //delay(5000);
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
//  if (isNumber(value)){
//    mqttClient.publish(topic.c_str(), String(value).toInt());
//  }
//  mqttClient.publish(topic.c_str(), value.c_str());
  mqttClient.publish(topic.c_str(), msg.c_str());
  
  jsonload.clear();
}


IPAddress getlocalIP() {
  return IPAddress(mesh.getStationIP());
}
