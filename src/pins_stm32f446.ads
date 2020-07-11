with STM32.GPIO;
use STM32.GPIO;
with HAL.GPIO;
with STM32.Device;

package Pins_STM32F446 is
   
   ----------------------
   -- ARDUINO UNO PINS --
   ----------------------
   
   --   The following pins have been tested
   
   -- Digital
   Pin_D2  : GPIO_Point renames STM32.Device.PA10;
   Pin_D3  : GPIO_Point renames STM32.Device.PB3;
   Pin_D4  : GPIO_Point renames STM32.Device.PB5;
   Pin_D5  : GPIO_Point renames STM32.Device.PB4;
   Pin_D6  : GPIO_Point renames STM32.Device.PB10;
   Pin_D7  : GPIO_Point renames STM32.Device.PA8;
   Pin_D8  : GPIO_Point renames STM32.Device.PA9;
   Pin_D9  : GPIO_Point renames STM32.Device.PC7;
   Pin_D10 : GPIO_Point renames STM32.Device.PB6;
   Pin_D11 : GPIO_Point renames STM32.Device.PA7;
   Pin_D12 : GPIO_Point renames STM32.Device.PA6;
   Pin_D13 : GPIO_Point renames STM32.Device.PA5;
   
   -- Analog
   Pin_A0 : GPIO_Point renames STM32.Device.PA0;
   Pin_A1 : GPIO_Point renames STM32.Device.PA1;
   Pin_A2 : GPIO_Point renames STM32.Device.PA4;
   
   
   Pin_A3 : GPIO_Point renames STM32.Device.PB0; --It doesn't work
   Pin_A4 : GPIO_Point renames STM32.Device.PC1; --It doesn't work
   Pin_A5 : GPIO_Point renames STM32.Device.PC0; --It doesn't work

 
   
   
   ---------------
   -- MORE PINS --
   ---------------
   
   -- The following pins haven't been tested yet
   
   Pin_C2  : GPIO_Point renames STM32.Device.PC2;
   Pin_C4  : GPIO_Point renames STM32.Device.PC4;
   Pin_C5  : GPIO_Point renames STM32.Device.PC5;
   Pin_C6  : GPIO_Point renames STM32.Device.PC6;
   Pin_C8  : GPIO_Point renames STM32.Device.PC8;
   Pin_C9  : GPIO_Point renames STM32.Device.PC9;
   Pin_C10 : GPIO_Point renames STM32.Device.PC10;
   Pin_C11 : GPIO_Point renames STM32.Device.PC11;
   Pin_C12 : GPIO_Point renames STM32.Device.PC12;
   Pin_C13 : GPIO_Point renames STM32.Device.PC13;
   Pin_C14 : GPIO_Point renames STM32.Device.PC14;
   Pin_C15 : GPIO_Point renames STM32.Device.PC15;
   
   Pin_B1  : GPIO_Point renames STM32.Device.PB1;
   Pin_B2  : GPIO_Point renames STM32.Device.PB2;
   Pin_B3  : GPIO_Point renames STM32.Device.PB3;
   Pin_B4  : GPIO_Point renames STM32.Device.PB4;
   Pin_B5  : GPIO_Point renames STM32.Device.PB5;
   Pin_B7  : GPIO_Point renames STM32.Device.PB7;
   Pin_B8  : GPIO_Point renames STM32.Device.PB8;
   Pin_B9  : GPIO_Point renames STM32.Device.PB9;
   Pin_B10 : GPIO_Point renames STM32.Device.PB10;
   Pin_B12 : GPIO_Point renames STM32.Device.PB12;
   Pin_B13 : GPIO_Point renames STM32.Device.PB13;
   Pin_B14 : GPIO_Point renames STM32.Device.PB14;
   Pin_B15 : GPIO_Point renames STM32.Device.PB15;
   
   Pin_A10 : GPIO_Point renames STM32.Device.PA10;
   Pin_A8  : GPIO_Point renames STM32.Device.PA8;
   Pin_A11 : GPIO_Point renames STM32.Device.PA11;
   Pin_A12 : GPIO_Point renames STM32.Device.PA12;
   Pin_A13 : GPIO_Point renames STM32.Device.PA13;
   Pin_A14 : GPIO_Point renames STM32.Device.PA14;
   Pin_A15 : GPIO_Point renames STM32.Device.PA15;

   Pin_H1  : GPIO_Point renames STM32.Device.PH1;
   
   
   
end Pins_STM32F446;
