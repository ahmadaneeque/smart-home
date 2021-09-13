
#include <FS.h>
#include <ArduinoJson.h>          //https://github.com/bblanchon/ArduinoJson


struct Config {
  char ssid[33];   // = "Device Name";
  char ssid_pwd[33];   // = "Device Name";
  
  char room_location[33];   // = "Device Name";
  char mesh_name[10];  //="smarthome";
  char mesh_pwd[10];   //="smarthome";
  
  char mqtt_server[50];// = "ahmad-HP-G62-Notebook-PC.local";
  char mqtt_port[6] = "1883";

};

//bool get_credentials(void){
bool loadConfiguration(const char *filename, Config &config) {
  
  Serial.println("mounting FS...");
  if (SPIFFS.begin()) {
    Serial.println("mounted file system");
    
    if (SPIFFS.exists(filename)) { //file exists, reading and loading
      Serial.println("reading config file");
      
      File file = SPIFFS.open(filename, "r");
      StaticJsonDocument<512> doc;

      DeserializationError error = deserializeJson(doc, file);
      if (error){Serial.println(F("Failed to read file, using default configuration"));}
      
      strlcpy(config.ssid, doc["ssid"], sizeof(config.ssid));         
      strlcpy(config.ssid_pwd, doc["ssid_pwd"], sizeof(config.ssid_pwd));         
      strlcpy(config.room_location,  doc["room_location"], sizeof(config.room_location));         
      strlcpy(config.mesh_name,  doc["mesh_name"], sizeof(config.mesh_name));         
      strlcpy(config.mesh_pwd,  doc["mesh_pwd"], sizeof(config.mesh_pwd));         
      strlcpy(config.mqtt_server,  doc["mqtt_server"], sizeof(config.mqtt_server));         
      strlcpy(config.mqtt_port,  doc["mqtt_port"], sizeof(config.mqtt_port));         
      
      file.close();
      return true;
    }
  } else {
    Serial.println("failed to mount FS");
  }
  return false;
};

bool saveConfiguration(const char *filename, const Config &config) {

    DynamicJsonDocument jsondoc(200);
    
    jsondoc["ssid"] = config.ssid;
    jsondoc["ssid_pwd"]   = config.ssid_pwd;
    
    jsondoc["room_location"] = config.room_location;
    
    jsondoc["mesh_name"] = config.mesh_name;
    jsondoc["mesh_pwd"] = config.mesh_name;
    
    jsondoc["mqtt_server"] = config.mqtt_server;
    jsondoc["mqtt_port"] = config.mqtt_port;
  
    File configFile = SPIFFS.open(filename, "w");
    
    if (!configFile) {
      Serial.println("failed to create file for writing");
      return false;}
      
    if (serializeJson(jsondoc, configFile) == 0) {
      Serial.println(F("Failed to write to file"));}
      
    configFile.close();
}
