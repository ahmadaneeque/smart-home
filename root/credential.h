
#include <FS.h>
#include <ArduinoJson.h>          //https://github.com/bblanchon/ArduinoJson




void get_credentials(void){
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
};
