

#include <FS.h>                   //this needs to be first, or it all crashes and burns...

#include <ESP8266WiFi.h>          //https://github.com/esp8266/Arduino

//needed for library
#include <DNSServer.h>
#include <ESP8266WebServer.h>
#include <WiFiManager.h>          //https://github.com/tzapu/WiFiManager

#include <ArduinoJson.h>     

char mqtt_server[40];
char mqtt_port[6] = "8080";
char blynk_token[34] = "YOUR_BLYNK_TOKEN";
char * ssid;
char * passwod;


void setup() {
  // put your setup code here, to run once:
//WiFi.softAP(_apName);
 Serial.begin(115200);
  Serial.println();
  WiFiManagerParameter custom_mqtt_server("server", "mqtt server", mqtt_server, 40);
  WiFiManagerParameter custom_mqtt_port("port", "mqtt port", mqtt_port, 6);
  WiFiManagerParameter custom_blynk_token("blynk", "blynk token", blynk_token, 32);
  WiFiManager wifiManager;

  wifiManager.addParameter(&custom_mqtt_server);
  wifiManager.addParameter(&custom_mqtt_port);
  wifiManager.addParameter(&custom_blynk_token);

  if (!wifiManager.makeAP("AutoConnectAP")) {
    Serial.println("failed to connect and hit timeout");
    delay(3000);
    //reset and try again, or maybe put it to deep sleep
    ESP.reset();
    delay(5000);
  }
  String ssid;
  String psw;
  wifiManager.getWifiCredentials(ssid, psw);
  Serial.println(ssid);
  Serial.println(psw);

  WiFi.disconnect(); //  this alone is not enough to stop the autoconnecter
  WiFi.mode(WIFI_AP);
  
  

}

void loop() {
  // put your main code here, to run repeatedly:

}
