/*
 Name:		main.ino
 Created:	3/21/2020 2:37:30 PM
 Authors:	Alex Gradea (3D-Brothers.SRL)
            Wiliam Toader
*/
#include <Wire.h>
#include <Stepper.h>
#include <ICUVentLibs.h>
#include <Arduino.h>
#include <EEPROM.h>
#include <EEPROMAnything.h>
#include <Button2.h>


ICUVent vent = ICUVent();

static void ButtonHandler(Button2 &btn) {
    vent.ButtonHandler(btn);
}

void setup() {

    pinMode(ENdrv, OUTPUT);
    digitalWrite(ENdrv, HIGH); // Stepper driver ENABLE !

    //Define the pins as inputs
    pinMode(clk, INPUT_PULLUP);
    pinMode(data, INPUT_PULLUP);
    pinMode(BUTTON_A_PIN, INPUT_PULLUP);
    pinMode(ZERO_POS, INPUT_PULLUP);

    vent.buttonA.setClickHandler(ButtonHandler);
    vent.buttonA.setLongClickHandler(ButtonHandler);

    Serial.begin(9600); //Start serial com so we could print the value on the serial monitor

    // Reads the initial state of the clock pin
    vent.LastState = digitalRead(clk);

    vent.lcd.init();                      // initialize the lcd

    // Print a message to the LCD.
    vent.lcd.backlight();
    vent.lcd.setCursor(1, 0);
    vent.lcd.print("DIY Ventilator v1.0");
    vent.lcd.setCursor(5, 1);
    vent.lcd.print("Starting");

    vent.loadOrwriteDefaults();
    vent.stepper.setSpeed(vent.conf.breathingSpeed * vent.breathingSpdMult);

}


void loop() {

    if (!vent.zeroed) {
        delay(1000);
        vent.zero_position();

    }
    vent.displayControl();


    unsigned long current_millis = millis();

    if (current_millis - vent.last_watchdog_update >= float(vent.conf.timeBetweenBreaths) * 100 && vent.needInhale) {
        vent.ventWatchdog(vent.conf.motionLength * (vent.conf.airVol / 100.0));
        vent.last_watchdog_update = millis();
        vent.needInhale = 0;
        vent.needExhale = 1;
    }

    current_millis = millis();

    if (current_millis - vent.last_watchdog_update >= float(vent.conf.inhaleToExhale) * 100 && vent.needExhale) {
        vent.ventWatchdog(20);
        vent.needInhale = 1;
        vent.needExhale = 0;
        vent.last_watchdog_update = millis();
    }

}



