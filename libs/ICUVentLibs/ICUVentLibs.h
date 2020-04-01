//
// Created by Wiliam on 01-Apr-20.
//
#include <Arduino.h>
#include <Wire.h>
#include <Stepper.h>
#include <LiquidCrystal_I2C.h>
#include <Button2.h>
#include <EEPROMAnything.h>


#ifndef PARAMS_H
#define PARAMS_H

#define STEPS 12800 // Number of steps per revolution

#define ENdrv 8
#define clk 3
#define data 4

#define ZERO_POS 2 // Endstop
#define step_pin 6 // Pin 3 connected to Steps pin
#define dir_pin 7  // Pin 2 connected to Direction pin

#define BUTTON_A_PIN  5

#endif //PARAMS_H*/
class ICUVent{
public:
    LiquidCrystal_I2C lcd = LiquidCrystal_I2C(0x27, 16, 2);
    Stepper stepper = Stepper(STEPS, 6, 7);

    Button2 buttonA = Button2(BUTTON_A_PIN);

    long counter = 0;
    int State;
    int LastState;

    int menu_page = 0;

    int maxBreathsPM = 40;
    int minBreathsPM = 3;

    int maxAirVol = 100;
    int minAirVol = 10;

    int maxTimeBB = 100;
    int minTimeBB = 0;

    long minMotionLength = 10;
    long maxMotionLength = 2000;
    int zeroed = 0;
    int ventPos = 0;
    int breathingSpdMult = 1500;

    unsigned long last_watchdog_update = 0;
    unsigned long last_display_update = 0;

    String firstLine = "DIY Ventilator v1.0";
    String secondLine = "Starting";

    String firstLcdText = "";
    String secondLcdText = "";
    int needInhale = 1;
    int needExhale = 0;

    struct config {
        int breathingSpeed;
        int airVol;
        int timeBetweenBreaths;
        int inhaleToExhale;
        long motionLength;
    };

    typedef struct config Config;
    Config conf;


    void loadOrwriteDefaults() {

        int canWriteDefaults;
        EEPROM_readAnything(80, canWriteDefaults);
        //canWriteDefaults = -1;

        if (canWriteDefaults == -1) {

            conf.breathingSpeed = 12;
            conf.airVol = 80;
            conf.timeBetweenBreaths = 0;
            conf.inhaleToExhale = 0;
            conf.motionLength = 5000;
            EEPROM_writeAnything(0, conf);
            EEPROM_writeAnything(80, 1);
        }

        if (canWriteDefaults == 1) {

            EEPROM_readAnything(0, conf);

        }
    }

    void displayControl();
    void ButtonHandler(Button2& btn);


    static long hardLimiter(long min, long max, long value);
    void zero_position();
    void zeroSwitchCheck();
    void ventWatchdog(int targetPosition);


    //Menu
    void menu_handler();
    void menu_select();
    void save_handler();
    void lcdUpdate(String fLine, String sLine);

    void menu_0();
    void menu_1();
    void menu_2();
    void menu_3();
    void menu_4();
    void menu_5();
    void menu_6();

    int millisbetweenSteps = 1;

    ICUVent() {
        //Constructor
    }
};
