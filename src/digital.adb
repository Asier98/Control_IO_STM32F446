with STM32.Device;

package body Digital is

   -------------------
   -- Configure_Pin --
   -------------------
   
   procedure Configure_Pin(Pin : GPIO_Point; Mode : Digital_Mode) is 
      IO_Mode : STM32.GPIO.Pin_IO_Modes;      
   begin
      case Mode is
         when Input =>
            IO_Mode := Mode_In;
         when Output =>
            IO_Mode := Mode_Out;
      end case;
      
      declare
         Configuration_Pin : GPIO_Port_Configuration(IO_Mode);
      begin
         STM32.Device.Enable_Clock(Pin);
         STM32.GPIO.Configure_IO(This   => Pin,
                                 Config => Configuration_Pin);
      end; 
   end Configure_Pin;
   
   
   ----------------
   -- Set_Signal --
   ----------------
   
   procedure Set_Signal(Pin : GPIO_Point; Mode : Signal_Mode) is
      Actual_Pin: GPIO_Point:= Pin;
   begin      
      STM32.GPIO.Set(Actual_Pin);
      case Mode is
         when HIGH =>
            STM32.GPIO.Set(Actual_Pin);
         when LOW =>
            STM32.GPIO.Clear(Actual_Pin);
      end case;
   end Set_Signal;
   
      
   -----------------
   -- Read_Signal --
   -----------------
   
   function Read_Signal(Pin : GPIO_Point) return Signal_Mode is
      Value : constant Boolean := Set(Pin);
   begin
      case Value is
         when False =>
            return LOW;
         when True =>
            return HIGH;
      end case;   
   end Read_Signal;
   
   
end Digital;
