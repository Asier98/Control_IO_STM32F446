with STM32.ADC; use STM32.ADC;
with Pins_STM32F446; use Pins_STM32F446;
with HAL; use HAL;
with STM32.Device;

package body Analog is

   --  From STM32F40x datasheet:
   --  Channel    ADC 
   --    #         1  
   --
   --    0        PA0    
   --    1        PA1    
   --    2        PA2    
   --    3        PA3  
   --    4        PA4    
   --    5        PA5   
   --    6        PA6    
   --    7        PA7   
   --    8        PB0    
   --    9        PB1   
   --   10        PC0   
   --   11        PC1   
   --   12        PC2    
   --   13        PC3    
   --   14        PC4   
   --   15        PC5   
   
   ADC_Sensor_0 : constant ADC_Point := (STM32.Device.ADC_1'Access,
                                         Channel => UInt5'(0));
   ADC_Sensor_1 : constant ADC_Point := (STM32.Device.ADC_1'Access,
                                         Channel => UInt5'(1));
   ADC_Sensor_2 : constant ADC_Point := (STM32.Device.ADC_1'Access,
                                         Channel => UInt5'(4));
   ADC_Sensor_3 : constant ADC_Point := (STM32.Device.ADC_1'Access,
                                         Channel => UInt5'(8));
   ADC_Sensor_4 : constant ADC_Point := (STM32.Device.ADC_1'Access,
                                         Channel => UInt5'(11));
   ADC_Sensor_5 : constant ADC_Point := (STM32.Device.ADC_1'Access,
                                         Channel => UInt5'(10));
   
   
   -------------------
   -- Configure_Pin --
   -------------------
   
   procedure Configure_Pin (Pin : GPIO_Point) is
      Configuration_Pin : GPIO_Port_Configuration(Mode_Analog);
      ADC_Channel : Analog_Input_Channel;
      ADC_Sensor : ADC_Point;

   begin
      STM32.GPIO.Configure_IO(This   => Pin,
                              Config => Configuration_Pin);
      
      if Pin = Pin_A0 then
         ADC_Sensor := ADC_Sensor_0;
      elsif Pin = Pin_A1 then
         ADC_Sensor := ADC_Sensor_1;
      elsif Pin = Pin_A2 then
         ADC_Sensor := ADC_Sensor_2;
      elsif Pin = Pin_A3 then
         ADC_Sensor := ADC_Sensor_3;
      elsif Pin = Pin_A4 then
         ADC_Sensor := ADC_Sensor_4;
      elsif Pin = Pin_A5 then
         ADC_Sensor := ADC_Sensor_5;
      end if;
      
      STM32.Device.Enable_Clock (ADC_Sensor.ADC.all);
      STM32.Device.Reset_All_ADC_Units;
      STM32.ADC.Enable (STM32.Device.ADC_1);
      
      declare 
         All_Regular_Conversions : constant 
           STM32.ADC.Regular_Channel_Conversions :=
             (1 => (ADC_Channel,Sample_144_Cycles));
      begin       
         STM32.ADC.Configure_Common_Properties
           (Mode           => Independent, 
            Prescalar      => PCLK2_Div_2,
            DMA_Mode       => Disabled,
            Sampling_Delay => Sampling_Delay_15_Cycles);

         STM32.ADC.Configure_Unit
           (ADC_Sensor.ADC.all,
            Resolution => ADC_Resolution_12_Bits,
            Alignment  => Right_Aligned);

         STM32.ADC.Configure_Regular_Conversions
           (ADC_Sensor.ADC.all,
            Trigger     => Software_Triggered,
            Continuous  => False,
            Enable_EOC  => False, 
            Conversions => All_Regular_Conversions);  
      end;	      
   end Configure_Pin;
   
   
   
   -----------------------
   -- Start_Adquisition --
   -----------------------
   
   procedure Start_Adquisition (Pin : GPIO_Point) is
      ADC_Sensor : ADC_Point;
   begin
      
      if Pin = Pin_A0 then
         ADC_Sensor := ADC_Sensor_0; 
      elsif Pin = Pin_A1 then
         ADC_Sensor := ADC_Sensor_1; 
      elsif Pin = Pin_A2 then
         ADC_Sensor := ADC_Sensor_2; 
      elsif Pin = Pin_A3 then
         ADC_Sensor := ADC_Sensor_3; 
      elsif Pin = Pin_A4 then
         ADC_Sensor := ADC_Sensor_4; 
      elsif Pin = Pin_A5 then
         ADC_Sensor := ADC_Sensor_5; 
      end if;
      
      STM32.ADC.Start_Conversion(ADC_Sensor.ADC.all);

   end Start_Adquisition;
   
      
   
   ---------------
   -- Get_Value --
   ---------------
   
   function Get_Value (Pin: GPIO_Point) return Analog_Signal_Value is
      ADC_Sensor : ADC_Point;
   begin
      
      if Pin = Pin_A0 then
         ADC_Sensor := ADC_Sensor_0; 
      elsif Pin = Pin_A1 then
         ADC_Sensor := ADC_Sensor_1; 
      elsif Pin = Pin_A2 then
         ADC_Sensor := ADC_Sensor_2; 
      elsif Pin = Pin_A3 then
         ADC_Sensor := ADC_Sensor_3; 
      elsif Pin = Pin_A4 then
         ADC_Sensor := ADC_Sensor_4; 
      elsif Pin = Pin_A5 then
         ADC_Sensor := ADC_Sensor_5; 
      end if;
      
      return Analog_Signal_Value(STM32.ADC.Conversion_Value(ADC_Sensor.ADC.all));
  
   end Get_Value;
   
end Analog;
