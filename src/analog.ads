with STM32.GPIO;
use STM32.GPIO;
with HAL.GPIO;

package Analog is

   type Analog_Signal_Value is new Integer;
   
   procedure Configure_Pin (Pin : GPIO_Point);
   -- Configure a given pin as a analog and establishes his properties
   
   procedure Start_Adquisition (Pin : GPIO_Point); 
   -- Start the adquisition of the analag pin value
   
   function Get_Value (Pin: GPIO_Point) return Analog_Signal_Value;
   -- Obtain the value of the analog pin. A minimum time of 10 microseconds 
   -- must be given between the procedure Start_Adquisition and this function.
   
end Analog;
