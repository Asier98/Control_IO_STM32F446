with STM32.GPIO;
use STM32.GPIO;
with HAL.GPIO;

package Digital is

   type Digital_Mode is (Input, Output);
   -- Input or Output

   type Signal_Mode is (HIGH,LOW);
   -- HIGH or LOW

   procedure Configure_Pin(Pin : GPIO_Point; Mode : Digital_Mode);
   -- Configure a channel as Output or Input

   procedure Set_Signal(Pin : GPIO_Point; Mode : Signal_Mode);
   -- Set a HIGH or LOW signal for a given channel

   function Read_Signal(Pin : GPIO_Point) return Signal_Mode;
   -- Read the given channel signal

end Digital;

