Library IEEE;
use IEEE.STD_Logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity vgatest is
  port(clk         : in std_logic;
       R : out std_logic_vector(0 to 3); 
		 G : out std_logic_vector(0 to 3); 
		 B : out std_logic_vector(0 to 3); 
       DecodeOutOne : in std_logic_vector(0 to 3);
       DecodeOutTwo : in std_logic_vector(0 to 3);
		 H: out std_logic;
		 V: out std_logic);
end entity;

architecture test of vgatest is

  signal clock : std_logic := '0';
  
  





  component VGADrive is
    port( clock          : in std_logic;  -- 25.175 Mhz clock
        red, green, blue : in std_logic_vector(0 to 3);  -- input values for RGB signals
        row, column      : out std_logic_vector(9 downto 0); -- for current pixel
        Rout, Gout, Bout : out std_logic_vector(0 to 3);
		  H, V : out std_logic); -- VGA drive signals
  end component;
  
  signal row, column : std_logic_vector(9 downto 0);
  signal red, green, blue : std_logic_vector(0 to 3);
  signal colortesting : std_logic_vector(0 to 18);
begin
	
	process(clk)
  variable counter: integer range 0 to 7 := 0 ;
  begin
		if(rising_edge(clk)) then
		    
			counter := counter + 1;
			if(counter = 2) then
				clock <= not clock;
				counter := 0;
			end if;
		end if;
  end process;
  -- for debugging: to view the bit order
  VGA : component VGADrive
    port map ( clock => clock, red => red, green => green, blue => blue,
               row => row, column => column,
               Rout => R, Gout => G, Bout => B, H => H, V => V);
 
  -- red square from 0,0 to 360, 350
  -- green square from 0,250 to 360, 640
  -- blue square from 120,150 to 480,500
  RGB : process(row, column)
  begin
    -- wait until clock = '1';
   
      --1
      
       
                           red <= "0000";
                           green <= "0000";
                           blue <= "0000";
      if colortesting(0) = '1' then
            if row > 270 and row < 360 and column-5 > 318 and column-5 < 322 then
                red <= "1111";
                green <= "1111";
                blue <= "0000";
            end if;
            
       else
            if row > 270 and row < 360 and column-5 > 318 and column-5 < 322 then
                      red <= "1111";
                      green <= "1111";
                      blue <= "1111";
                  end if;     
      end if;
            
           --2 
           
           if colortesting(1) = '1' then 
            if row > 150 and row < 270 and column-5 > 318 and column-5 < 322 then 
                red <= "1111";
                green <= "1111";
                blue <= "0000";
            end if;
            else
                   if row > 150 and row < 270 and column-5 > 318 and column-5 < 322 then 
                         red <= "1111";
                         green <= "1111";
                         blue <= "1111";
                     end if;
            end if;
            
            --3
            if colortesting(2) = '1' then
            if row > 90 and row < 150 and column-5 > 318 and column-5 < 322 then 
                red <= "1111";
                green <= "1111";
                blue <= "0000";
            end if;
            else
             if row > 90 and row < 150 and column-5 > 318 and column-5 < 322 then 
                           red <= "1111";
                           green <= "1111";
                           blue <= "1111";
                       end if;
            
            end if;
            
               --4   
               if colortesting(3) = '1' then
            if row > 60 and row < 90 and column-5 > 318 and column-5 < 322 then 
                red <= "1111";
                green <= "1111";
                blue <= "0000";
            end if;
            else
                   if row > 60 and row < 90 and column-5 > 318 and column-5 < 322 then 
                         red <= "1111";
                         green <= "1111";
                         blue <= "1111";
                     end if;
            end if;
            
            --17
                if colortesting(16) = '1' then
            if column-5 > 260 and column-5 < 320 and row > 358 and row < 362 then 
                red <= "1111";
                green <= "0000";
                blue <= "1111";
            end if;
            else 
            if column-5 > 260 and column-5 < 320 and row > 358 and row < 362 then 
                            red <= "1111";
                            green <= "1111";
                            blue <= "1111";
                        end if;
            end if;
            
            --16
            
            if colortesting(15) = '1' then
            if column-5 > 110 and column-5 < 320 and row > 268 and row < 272 then 
                red <= "1111";
                green <= "1100";
                blue <= "1101";
            end if;
            else
                if column-5 > 110 and column-5 < 320 and row > 268 and row < 272 then 
                         red <= "1111";
                         green <= "1111";
                         blue <= "1111";
                     end if;
            end if;
            --8
            
            if colortesting(7) ='1' then
            if column-5 > 100 and column-5 < 260 and row > 358 and row < 362 then
                red <= "1111";
                green <= "0000";
                blue <= "1111";
            end if;
            
            for i in 320 to 360 loop
                if row = i and column-5 > row - 262  and column-5 < row - 258 then 
                    red <= "1111";
                    green <= "0000";
                    blue <= "1111";
                end if;
            end loop;
            else
             if column-5 > 100 and column-5 < 260 and row > 358 and row < 362 then
                           red <= "1111";
                           green <= "1111";
                           blue <= "1111";
                       end if;
                       
                       for i in 320 to 360 loop
                           if row = i and column-5 > row - 262  and column-5 < row - 258 then 
                               red <= "1111";
                               green <= "1111";
                               blue <= "1111";
                           end if;
                       end loop;
            end if;
            --9
            
            if colortesting(8) = '1' then 
            for i in 262 to 320 loop
                if row = i and column-5 > row - 262  and column-5 < row - 258 then 
                    red <= "1111";
                    green <= "0000";
                    blue <= "1111";
                end if;
            end loop;
            
            
            
            else
                  for i in 262 to 320 loop
                      if row = i and column-5 > row - 262  and column-5 < row - 258 then 
                          red <= "1111";
                          green <= "1111";
                          blue <= "1111";
                      end if;
                  end loop;
                  
                  
            end if;
            --7
            
            
            if colortesting(6) = '1' then
            for i in 320 to 376 loop
                 if row = i and column-5 > 378 - row  and column-5 < 382 - row then 
                    red <= "1111";
                    green <= "1010";
                    blue <= "0000";
                 end if;
            end loop;
            
            
            else 
             for i in 320 to 376 loop
                            if row = i and column-5 > 378 - row  and column-5 < 382 - row then 
                               red <= "1111";
                               green <= "1111";
                               blue <= "1111";
                            end if;
                       end loop;
             end if;                                                                               
            --19
            
            if colortesting(18) ='1' then 
            for i in 184 to 262 loop
                 if row = i and column-5 > 262 - row  and column-5 < 266 - row then 
                    red <= "0000";
                    green <= "0000";
                    blue <= "1111";
                 end if;
            end loop;
            
            
            else
            
               for i in 184 to 262 loop
                          if row = i and column-5 > 262 - row  and column-5 < 266 - row then 
                             red <= "1111";
                             green <= "1111";
                             blue <= "1111";
                          end if;
                     end loop;
                     
                     
            end if;
            --11
            if colortesting(10) = '1' then
            
            for i in 60 to 184 loop
                 if row = i and column-5 > 262 - row and column-5 < 266 - row then 
                    red <= "0000";
                    green <= "0000";
                    blue <= "1111";
                 end if;
            end loop;
            
               
                     
                     for i in 60 to 75 loop
                         if row = i and column-5 > 142 + row  and column-5 < 146 + row then 
                             red <= "0000";
                             green <= "0000";
                             blue <= "1111";
                         end if;
                     end loop;
                     
                     
                     if column-5 > 219 and column-5 < 305 and row > 73 and row < 77 then
                            red <= "0000";
                            green <= "0000";
                            blue <= "1111";
                     
                     end if;
                     
                        for i in 75 to 90 loop
                                 if row = i and column-5 > 228 + row and column-5 < 232 + row then 
                                    red <= "0000";
                                    green <= "0000";
                                    blue <= "1111";
                                 end if;
                            end loop;
                            
                            
                      else
                      
                      for i in 60 to 184 loop
                                       if row = i and column-5 > 262 - row and column-5 < 266 - row then 
                                          red <= "1111";
                                          green <= "1111";
                                          blue <= "1111";
                                       end if;
                                  end loop;
                                  
                                     
                                           
                                           for i in 60 to 75 loop
                                               if row = i and column-5 > 142 + row  and column-5 < 146 + row then 
                                                   red <= "1111";
                                                   green <= "1111";
                                                   blue <= "1111";
                                               end if;
                                           end loop;
                                           
                                           
                                           if column-5 > 219 and column-5 < 305 and row > 73 and row < 77 then
                                                  red <= "1111";
                                                  green <= "1111";
                                                  blue <= "1111";
                                           
                                           end if;
                                           
                                              for i in 75 to 90 loop
                                                       if row = i and column-5 > 228 + row and column-5 < 232 + row then 
                                                          red <= "1111";
                                                          green <= "1111";
                                                          blue <= "1111";
                                                       end if;
                                                  end loop;
                                                  
                                                  
                      
                      
                      end if;         
                                       
                     
            
            --6
            if colortesting(5) = '1' then 
            
            for i in 270 to 320 loop
                 if row = i and column-5 > 378 - row  and column-5 < 382 - row then 
                    red <= "1111";
                    green <= "1010";
                    blue <= "0000";
                 end if;
            end loop;
            
            else
            
             for i in 270 to 320 loop
                            if row = i and column-5 > 378 - row  and column-5 < 382 - row then 
                               red <= "1111";
                               green <= "1111";
                               blue <= "1111";
                            end if;
                       end loop;
            
            end if;
            
            --5
            if colortesting(4) = '1' then
            
            for i in 60 to 270 loop
                 if row = i and column-5 > 378 - row  and column-5 < 382 - row then 
                    red <= "1111";
                    green <= "1010";
                    blue <= "0000";
                 end if;
            end loop;
            
            else
             for i in 60 to 270 loop
                            if row = i and column-5 > 378 - row  and column-5 < 382 - row then 
                               red <= "1111";
                               green <= "1111";
                               blue <= "1111";
                            end if;
                       end loop;
            
           end if;
            --15
            if colortesting(14) = '1' then 
              for i in 90 to 110 loop
                  if row = i and column-5 > 228 + row and column-5 < 232 + row then 
                          red <= "0000";
                          green <= "0000";
                          blue <= "1111";
                     end if;
                     end loop;
                   
              if column-5 > 340 and column-5 < 380 and row > 108 and row < 112 then
              red<= "0000";
              green <= "0000";
              blue <= "1111";
              end if;
      for i in 110 to 180 loop
                             if row = i and column-5 > 268 + row and column-5 < 272 + row then 
                                     red <= "0000";
                                     green <= "0000";
                                     blue <= "1111";
                                end if;
                                end loop;           
              else 
                
                
                 for i in 90 to 110 loop
                               if row = i and column-5 > 228 + row and column-5 < 232 + row then 
                                       red <= "1111";
                                       green <= "1111";
                                       blue <= "1111";
                                  end if;
                                  end loop;
                                
                           if column-5 > 340 and column-5 < 380 and row > 108 and row < 112 then
                           red<= "1111";
                           green <= "1111";
                           blue <= "1111";
                           end if;
                   for i in 110 to 180 loop
                                          if row = i and column-5 > 268 + row and column-5 < 272 + row then 
                                                  red <= "1111";
                                                  green <= "1111";
                                                  blue <= "1111";
                                             end if;
                                             end loop;     
                   end if;        
     --18
     
     if colortesting(17) = '1' then
     
     if column-5 > 320 and column-5 < 360 and row > 268 and row < 272 then
                   red<= "1111";
                   green <= "1100";
                   blue <= "1101";
                   end if;
       for i in 180 to 270 loop
                    if row = i and column-5 > 628 - row  and column-5 < 632 - row then 
                          red <= "1111";
                          green <= "1100";
                          blue <= "1101";
                     end if;
                    end loop;    
                    
                  else
                  if column-5 > 320 and column-5 < 360 and row > 268 and row < 272 then
                                     red<= "1111";
                                     green <= "1111";
                                     blue <= "1111";
                                     end if;
                         for i in 180 to 270 loop
                                      if row = i and column-5 > 628 - row  and column-5 < 632 - row then 
                                            red <= "1111";
                                            green <= "1111";
                                            blue <= "1111";
                                       end if;
                                      end loop;    
                                      
                  
              end if;        
                 
              --13
              
              if colortesting(12) = '1' then
              
              for i in 180 to 285 loop
                            if row = i and column-5 > 268 + row and column-5 < 272 + row then 
                                    red <= "0000";
                                    green <= "0000";
                                    blue <= "1111";
                               end if;
                               end loop;
                               
                      else
                      
                      
                        for i in 180 to 285 loop
                                                if row = i and column-5 > 268 + row and column-5 < 272 + row then 
                                                        red <= "1111";
                                                        green <= "1111";
                                                        blue <= "1111";
                                                   end if;
                                                   end loop;
                      
                      end if;
                                              
                                              
              --14
              
              
              if colortesting(13) = '1' then
            
                  if column-5 > 555 and column-5 < 600 and row > 283 and row < 287 then
                                red<= "0000";
                                green <= "0000";
                                blue <= "1111";
                                end if;   
                if column-5 > 598 and column-5 < 602 and row > 240 and row < 285 then
                           red<= "0000";
                           green <= "0000";
                           blue <= "1111";
                  end if;   
              
              else
              
                     if column-5 > 555 and column-5 < 600 and row > 283 and row < 287 then
                                       red<= "1111";
                                       green <= "1111";
                                       blue <= "1111";
                                       end if;   
                       if column-5 > 598 and column-5 < 602 and row > 240 and row < 285 then
                                  red<= "1111";
                                  green <= "1111";
                                  blue <= "1111";
                         end if;   
                     
              
              end if;    
                  
            --12
            
            
            if colortesting(11) = '1' then
            
                if column-5 > 78 and column - 5 < 82 and row > 184 and row < 240 then
                      red <= "1111";
                             green <= "1100";
                             blue <= "1101"; 
                
                
                end if;
            
            for i in 240 to 270 loop
            
            if row = i and column - 5  > row - 162 and column - 5< row - 158  then
            red <= "1111";
                                         green <= "1100";
                                         blue <= "1101"; 
            
            end if;
            end loop;
            else 
            
            
               if column-5 > 78 and column - 5 < 82 and row > 184 and row < 240 then
                               red <= "1111";
                                      green <= "1111";
                                      blue <= "1111"; 
                         
                         
                         end if;
                     
                     for i in 240 to 270 loop
                     
                     if row = i and column - 5  > row - 162 and column - 5< row - 158  then
                     red <= "1111";
                                                  green <= "1111";
                                                  blue <= "1111"; 
                     
                     end if;
                     end loop;
            
            end if;
                  
               --10
               
               if colortesting(9) = '1' then
               
               if column-5 > 320 and column-5 < 400 and row > 358 and row < 362 then
                  red<= "1111";
                  green <= "0000";
                  blue <= "1111";
              end if;   
              
                 for i in 310 to 360 loop
                                       if row = i and column-5 > 758 - row and column-5 < 762 - row then 
                                               red <= "1111";
                                               green <= "0000";
                                               blue <= "1111";
                                          end if;
                                          end loop;
           
     for i in 310 to 350 loop
             if row = i and column-5 > 138 + row and column-5 < 142 + row then 
                        red <= "1111";
                        green <= "0000";
                        blue <= "1111";
             end if;
             end loop;
       for i in 285 to 350 loop
              if row = i and column-5 > 838 - row and column-5 < 842 - row then 
                             red <= "1111";
                             green <= "0000";
                             blue <= "1111";
               end if;
      end loop;
                  else    
                  
             
                                
                                if column-5 > 320 and column-5 < 400 and row > 358 and row < 362 then
                                   red<= "1111";
                                   green <= "1111";
                                   blue <= "1111";
                               end if;   
                               
                                  for i in 310 to 360 loop
                                                        if row = i and column-5 > 758 - row and column-5 < 762 - row then 
                                                                red <= "1111";
                                                                green <= "1111";
                                                                blue <= "1111";
                                                           end if;
                                                           end loop;
                            
                      for i in 310 to 350 loop
                              if row = i and column-5 > 138 + row and column-5 < 142 + row then 
                                         red <= "1111";
                                         green <= "1111";
                                         blue <= "1111";
                              end if;
                              end loop;
                        for i in 285 to 350 loop
                               if row = i and column-5 > 838 - row and column-5 < 842 - row then 
                                              red <= "1111";
                                              green <= "1111";
                                              blue <= "1111";
                                end if;
                       end loop;
                  
                  
                  
                                                                           
                 end if;                                                                                   
     --g
                    if  row > 268 and row < 272 and column-5  > 318 and column-5 < 322  then
                      red <= "1111";
                      green <= "1111";
                      blue <= "1111";
                   
                    end if;
                    --a
                    
                    if  row < 362 and row > 358 and column-5  < 322 and column-5 > 318  then
                       red <= "1111";
                         green <= "1111";
                          blue <= "1111";
                        end if;
                        
                       --h 
                            if  row > 148 and row < 152 and column-5  > 318 and column-5 < 322  then
                              red <= "1111";
                              green <= "1111";
                              blue <= "1111";
                            end if;
                            
                          --i  
                                if  row > 88 and row < 92 and column-5  < 322 and column-5 > 318  then
                                  red <= "1111";
                                  green <= "1111";
                                  blue <= "1111";
                                end if;
                                
                            --j    
                                    if  row > 58 and row < 62 and column-5  > 318 and column-5 < 322  then
                                      red <= "1111";
                                      green <= "1111";
                                      blue <= "1111";
                                    end if;
                                 --n
                                        if  row > 358 and row < 362 and column-5  > 258 and  column-5 < 262  then
                                          red <= "1111";
                                          green <= "1111";
                                          blue <= "1111";
                                        end if;
                                  --b
                                            if  row < 322 and row > 318 and column-5  < 62 and column-5 > 58  then
                                              red <= "1111";
                                              green <= "1111";
                                              blue <= "1111";
                                            end if;
                                  
                                                              --c
                                                                        if  row < 378 and row > 374 and column-5 < 6 and column-5 > 2   then
                                                                          red <= "1111";
                                                                          green <= "1111";
                                                                          blue <= "1111";
                                                                       
                                                                         end if;
                  --d
                                                   if  row > 260 and row < 264 and column-5  > 0 and column-5 < 4  then
                                                     red <= "1111";
                                                     green <= "1111";
                                                     blue <= "1111";
                                                   end if;
                                                   
                                                   --e
                                                   if  row < 186 and row > 182 and column-5  < 82 and column-5 > 78  then
                                                      red <= "1111";
                                                        green <= "1111";
                                                         blue <= "1111";
                                                       
                                                       end if;
                                                       
                                                       --f
                                                           if  row > 268 and row < 272 and column-5  > 108 and column-5 < 112  then
                                                             red <= "1111";
                                                             green <= "1111";
                                                             blue <= "1111";
                                                           end if;
                                                           --k
                                                           
                                                               if  row > 178 and row < 182 and column-5  < 452 and column-5 > 448  then
                                                                 red <= "1111";
                                                                 green <= "1111";
                                                                 blue <= "1111";
                                                               
                                                               end if;
                                                               --l
                                                               
                                                                   if  row > 283 and row < 287 and column-5  > 553 and column-5 < 557  then
                                                                     red <= "1111";
                                                                     green <= "1111";
                                                                     blue <= "1111";
                                                                   
                                                                   end if;
                                                                --m
                                                                       if  row  > 238 and row < 242 and column-5 > 598 and column-5 < 602  then
                                                                         red <= "1111";
                                                                         green <= "1111";
                                                                         blue <= "1111";
                                                                       end if;
                                                                                                                
                                         
   -- if  row < 360 and column-5 > 250 and column-5 < 640  then
    --  green <= "1111";
   -- else
     -- green <= "0000";
    --end if;
    
   -- if  row > 120 and row < 480 and column-5 > 150 and column-5 < 500  then
     -- blue <= "1111";
    --else
     -- blue <= "0000";
    --end if;
   
   --M
    
   --if row > 19  and row < 30  and column > 539 and column < 542 then
   --  red <= "1111";
  --   green <= "1111";
  --   blue <= "1111";
   
   -- end if;
    
    
    
  if DecodeOutOne = "0000" and DecodeOutTwo = "0001" then
        colortesting <= "0000000100000000100";
    end if;
    if DecodeOutOne = "0000" and DecodeOutTwo = "0010" then
        colortesting <= "0000001100000000100";
    end if;
    if DecodeOutOne = "0000" and DecodeOutTwo = "0011" then
        colortesting <= "0000000110000000100";
    end if;
    if DecodeOutOne = "0000" and DecodeOutTwo = "0100" then
        colortesting <= "1000000000010001000";
    end if;
    if DecodeOutOne = "0000" and DecodeOutTwo = "0101" then
        colortesting <= "1000000000000001000";
    end if;
    if DecodeOutOne = "0000" and DecodeOutTwo = "0110" then
        colortesting <= "1000000000000000000";
    end if;
    if DecodeOutOne = "0000" and DecodeOutTwo = "0111" then
        colortesting <= "1100000000000000000";
    end if;
    if DecodeOutOne = "0000" and DecodeOutTwo = "1000" then
        colortesting <= "1110000000000000000";
    end if;
    if DecodeOutOne = "0000" and DecodeOutTwo = "1001" then
        colortesting <= "1111000000000000000";
    end if;
    if DecodeOutOne = "0000" and DecodeOutTwo = "1010" then
        colortesting <= "1000000000000000010";
    end if;
    if DecodeOutOne = "0000" and DecodeOutTwo = "1011" then
        colortesting <= "0000000001000000000";
    end if;
    if DecodeOutOne = "0000" and DecodeOutTwo = "1100" then
        colortesting <= "0000000001000100000";
    end if;
    if DecodeOutOne = "0000" and DecodeOutTwo = "1101" then
        colortesting <= "0000000000000000100";
    end if;
    if DecodeOutOne = "0001" and DecodeOutTwo = "0000" then
        colortesting <= "0000000100000000100";
    end if;
    if DecodeOutOne = "0001" and DecodeOutTwo = "0010" then
        colortesting <= "0000001000000000000";
    end if;
    if DecodeOutOne = "0001" and DecodeOutTwo = "0011" then
        colortesting <= "0000000010000000000";
    end if;
    if DecodeOutOne = "0001" and DecodeOutTwo = "0100" then
        colortesting <= "0000010000010000000";
    end if;
    if DecodeOutOne = "0001" and DecodeOutTwo = "0101" then
        colortesting <= "0000010000000000000";
    end if;
    if DecodeOutOne = "0001" and DecodeOutTwo = "0110" then
        colortesting <= "0000010000000001000";
    end if;
    if DecodeOutOne = "0001" and DecodeOutTwo = "0111" then
        colortesting <= "0100010000000001000";
    end if;
    if DecodeOutOne = "0001" and DecodeOutTwo = "1000" then
        colortesting <= "0001110000000000000";
    end if;
    if DecodeOutOne = "0001" and DecodeOutTwo = "1001" then
        colortesting <= "0000110000000000000";
    end if;
    if DecodeOutOne = "0001" and DecodeOutTwo = "1010" then
        colortesting <= "0000010000000001010";
    end if;
    if DecodeOutOne = "0001" and DecodeOutTwo = "1011" then
        colortesting <= "0000010000001001010";
    end if;
    if DecodeOutOne = "0001" and DecodeOutTwo = "1100" then
        colortesting <= "0000010000001101010";
    end if;
    if DecodeOutOne = "0001" and DecodeOutTwo = "1101" then
        colortesting <= "0000000100000000000";
    end if;
    if DecodeOutOne = "0010" and DecodeOutTwo = "0000" then
        colortesting <= "0000001100000000100";
    end if;
    if DecodeOutOne = "0010" and DecodeOutTwo = "0001" then
        colortesting <= "0000001000000000000";
    end if;
    if DecodeOutOne = "0010" and DecodeOutTwo = "0011" then
        colortesting <= "0000001010000000000";
    end if;
    if DecodeOutOne = "0010" and DecodeOutTwo = "0100" then
        colortesting <= "0000011000010000000";
    end if;
    if DecodeOutOne = "0010" and DecodeOutTwo = "0101" then
        colortesting <= "0000011000000000000";
    end if;
    if DecodeOutOne = "0010" and DecodeOutTwo = "0110" then
        colortesting <= "0000011000000001000";
    end if;
    if DecodeOutOne = "0010" and DecodeOutTwo = "0111" then
        colortesting <= "0100011000000001000";
    end if;
    if DecodeOutOne = "0010" and DecodeOutTwo = "1000" then
        colortesting <= "0001111000000000000";
    end if;
    if DecodeOutOne = "0010" and DecodeOutTwo = "1001" then
        colortesting <= "0000111000000000000";
    end if;
    if DecodeOutOne = "0010" and DecodeOutTwo = "1010" then
        colortesting <= "0000011000000001010";
    end if;
    if DecodeOutOne = "0010" and DecodeOutTwo = "1011" then
        colortesting <= "0000011000001001010";
    end if;
    if DecodeOutOne = "0010" and DecodeOutTwo = "1100" then
        colortesting <= "0000011000001101010";
    end if;
    if DecodeOutOne = "0010" and DecodeOutTwo = "1101" then
        colortesting <= "0000001100000000000";
    end if;
    if DecodeOutOne = "0011" and DecodeOutTwo = "0000" then
        colortesting <= "0000000110000000100";
    end if;
    if DecodeOutOne = "0011" and DecodeOutTwo = "0001" then
        colortesting <= "0000000010000000000";
    end if;
    if DecodeOutOne = "0011" and DecodeOutTwo = "0010" then
        colortesting <= "0000001010000000000";
    end if;
    if DecodeOutOne = "0011" and DecodeOutTwo = "0100" then
        colortesting <= "0000000000000000001";
    end if;
    if DecodeOutOne = "0011" and DecodeOutTwo = "0101" then
        colortesting <= "0000000000010000001";
    end if;
    if DecodeOutOne = "0011" and DecodeOutTwo = "0110" then
        colortesting <= "0000000000010001001";
    end if;
    if DecodeOutOne = "0011" and DecodeOutTwo = "0111" then
        colortesting <= "0010000000100000001";
    end if;
    if DecodeOutOne = "0011" and DecodeOutTwo = "1000" then
        colortesting <= "0000000000100000001";
    end if;
    if DecodeOutOne = "0011" and DecodeOutTwo = "1001" then
        colortesting <= "0001000000100000001";
    end if;
    if DecodeOutOne = "0011" and DecodeOutTwo = "1010" then
        colortesting <= "0000000000010001011";
    end if;
    if DecodeOutOne = "0011" and DecodeOutTwo = "1011" then
        colortesting <= "0000000000011001011";
    end if;
    if DecodeOutOne = "0011" and DecodeOutTwo = "1100" then
        colortesting <= "0000000000011101011";
    end if;
    if DecodeOutOne = "0011" and DecodeOutTwo = "1101" then
        colortesting <= "0000000110000000000";
    end if;
    if DecodeOutOne = "0100" and DecodeOutTwo = "0000" then
        colortesting <= "1000000000010001000";
    end if;
    if DecodeOutOne = "0100" and DecodeOutTwo = "0001" then
        colortesting <= "0000000010000000001";
    end if;
    if DecodeOutOne = "0100" and DecodeOutTwo = "0010" then
        colortesting <= "0000001010000000001";
    end if;
    if DecodeOutOne = "0100" and DecodeOutTwo = "0011" then
        colortesting <= "0000000000000000001";
    end if;
    if DecodeOutOne = "0100" and DecodeOutTwo = "0101" then
        colortesting <= "0000000000010000000";
    end if;
    if DecodeOutOne = "0100" and DecodeOutTwo = "0110" then
        colortesting <= "0000000000010001000";
    end if;
    if DecodeOutOne = "0100" and DecodeOutTwo = "0111" then
        colortesting <= "0010000000100000000";
    end if;
    if DecodeOutOne = "0100" and DecodeOutTwo = "1000" then
        colortesting <= "0000000000100000000";
    end if;
    if DecodeOutOne = "0100" and DecodeOutTwo = "1001" then
        colortesting <= "0001000000100000000";
    end if;
    if DecodeOutOne = "0100" and DecodeOutTwo = "1010" then
        colortesting <= "0000000000010001010";
    end if;
    if DecodeOutOne = "0100" and DecodeOutTwo = "1011" then
        colortesting <= "0000000000011001010";
    end if;
    if DecodeOutOne = "0100" and DecodeOutTwo = "1100" then
        colortesting <= "0000000000011101010";
    end if;
    if DecodeOutOne = "0100" and DecodeOutTwo = "1101" then
        colortesting <= "0000000110000000001";
    end if;
    if DecodeOutOne = "0101" and DecodeOutTwo = "0000" then
        colortesting <= "1000000000000001000";
    end if;
    if DecodeOutOne = "0101" and DecodeOutTwo = "0001" then
        colortesting <= "0000010000000000000";
    end if;
    if DecodeOutOne = "0101" and DecodeOutTwo = "0010" then
        colortesting <= "0000011000000000000";
    end if;
    if DecodeOutOne = "0101" and DecodeOutTwo = "0011" then
        colortesting <= "0000000000010000001";
    end if;
    if DecodeOutOne = "0101" and DecodeOutTwo = "0100" then
        colortesting <= "0000000000010000000";
    end if;
    if DecodeOutOne = "0101" and DecodeOutTwo = "0110" then
        colortesting <= "0000000000000001000";
    end if;
    if DecodeOutOne = "0101" and DecodeOutTwo = "0111" then
        colortesting <= "0100000000000001000";
    end if;
    if DecodeOutOne = "0101" and DecodeOutTwo = "1000" then
        colortesting <= "0001100000000000000";
    end if;
    if DecodeOutOne = "0101" and DecodeOutTwo = "1001" then
        colortesting <= "0000100000000000000";
    end if;
    if DecodeOutOne = "0101" and DecodeOutTwo = "1010" then
        colortesting <= "0000000000000001010";
    end if;
    if DecodeOutOne = "0101" and DecodeOutTwo = "1011" then
        colortesting <= "0000000000001001010";
    end if;
    if DecodeOutOne = "0101" and DecodeOutTwo = "1100" then
        colortesting <= "0000000000001101010";
    end if;
    if DecodeOutOne = "0101" and DecodeOutTwo = "1101" then
        colortesting <= "0000010100000000000";
    end if;
    if DecodeOutOne = "0110" and DecodeOutTwo = "0000" then
        colortesting <= "1000000000000000000";
    end if;
    if DecodeOutOne = "0110" and DecodeOutTwo = "0001" then
        colortesting <= "0000010000000001000";
    end if;
    if DecodeOutOne = "0110" and DecodeOutTwo = "0010" then
        colortesting <= "0000011000000001000";
    end if;
    if DecodeOutOne = "0110" and DecodeOutTwo = "0011" then
        colortesting <= "0000000000010001001";
    end if;
    if DecodeOutOne = "0110" and DecodeOutTwo = "0100" then
        colortesting <= "0000000000010001000";
    end if;
    if DecodeOutOne = "0110" and DecodeOutTwo = "0101" then
        colortesting <= "0000000000000001000";
    end if;
    if DecodeOutOne = "0110" and DecodeOutTwo = "0111" then
        colortesting <= "0100000000000000000";
    end if;
    if DecodeOutOne = "0110" and DecodeOutTwo = "1000" then
        colortesting <= "0110000000000000000";
    end if;
    if DecodeOutOne = "0110" and DecodeOutTwo = "1001" then
        colortesting <= "0111000000000000000";
    end if;
    if DecodeOutOne = "0110" and DecodeOutTwo = "1010" then
        colortesting <= "0000000000000000010";
    end if;
    if DecodeOutOne = "0110" and DecodeOutTwo = "1011" then
        colortesting <= "0000000000001000010";
    end if;
    if DecodeOutOne = "0110" and DecodeOutTwo = "1100" then
        colortesting <= "0000000000001100010";
    end if;
    if DecodeOutOne = "0110" and DecodeOutTwo = "1101" then
        colortesting <= "1000000000000000100";
    end if;
    if DecodeOutOne = "0111" and DecodeOutTwo = "0000" then
        colortesting <= "1100000000000000000";
    end if;
    if DecodeOutOne = "0111" and DecodeOutTwo = "0001" then
        colortesting <= "0100010000000001000";
    end if;
    if DecodeOutOne = "0111" and DecodeOutTwo = "0010" then
        colortesting <= "0100011000000001000";
    end if;
    if DecodeOutOne = "0111" and DecodeOutTwo = "0011" then
        colortesting <= "0010000000100000001";
    end if;
    if DecodeOutOne = "0111" and DecodeOutTwo = "0100" then
        colortesting <= "0010000000100000000";
    end if;
    if DecodeOutOne = "0111" and DecodeOutTwo = "0101" then
        colortesting <= "0100000000000001000";
    end if;
    if DecodeOutOne = "0111" and DecodeOutTwo = "0110" then
        colortesting <= "0100000000000000000";
    end if;
    if DecodeOutOne = "0111" and DecodeOutTwo = "1000" then
        colortesting <= "0010000000000000000";
    end if;
    if DecodeOutOne = "0111" and DecodeOutTwo = "1001" then
        colortesting <= "0011000000000000000";
    end if;
    if DecodeOutOne = "0111" and DecodeOutTwo = "1010" then
        colortesting <= "0100000000000000010";
    end if;
    if DecodeOutOne = "0111" and DecodeOutTwo = "1011" then
        colortesting <= "0100000000001000010";
    end if;
    if DecodeOutOne = "0111" and DecodeOutTwo = "1100" then
        colortesting <= "0100000000001100010";
    end if;
    if DecodeOutOne = "0111" and DecodeOutTwo = "1101" then
        colortesting <= "1100000000000000100";
    end if;
    if DecodeOutOne = "1000" and DecodeOutTwo = "0000" then
        colortesting <= "1110000000000000000";
    end if;
    if DecodeOutOne = "1000" and DecodeOutTwo = "0001" then
        colortesting <= "0001110000000000000";
    end if;
    if DecodeOutOne = "1000" and DecodeOutTwo = "0010" then
        colortesting <= "0001111000000000000";
    end if;
    if DecodeOutOne = "1000" and DecodeOutTwo = "0011" then
        colortesting <= "0000000000100000001";
    end if;
    if DecodeOutOne = "1000" and DecodeOutTwo = "0100" then
        colortesting <= "0000000000100000000";
    end if;
    if DecodeOutOne = "1000" and DecodeOutTwo = "0101" then
        colortesting <= "0001100000000000000";
    end if;
    if DecodeOutOne = "1000" and DecodeOutTwo = "0110" then
        colortesting <= "0110000000000000000";
    end if;
    if DecodeOutOne = "1000" and DecodeOutTwo = "0111" then
        colortesting <= "0010000000000000000";
    end if;
    if DecodeOutOne = "1000" and DecodeOutTwo = "1001" then
        colortesting <= "0001000000000000000";
    end if;
    if DecodeOutOne = "1000" and DecodeOutTwo = "1010" then
        colortesting <= "0000000000000010000";
    end if;
    if DecodeOutOne = "1000" and DecodeOutTwo = "1011" then
        colortesting <= "0000000000001010000";
    end if;
    if DecodeOutOne = "1000" and DecodeOutTwo = "1100" then
        colortesting <= "0000000000001110000";
    end if;
    if DecodeOutOne = "1000" and DecodeOutTwo = "1101" then
        colortesting <= "1110000000000000100";
    end if;
    if DecodeOutOne = "1001" and DecodeOutTwo = "0000" then
        colortesting <= "1111000000000000000";
    end if;
    if DecodeOutOne = "1001" and DecodeOutTwo = "0001" then
        colortesting <= "0000110000000000000";
    end if;
    if DecodeOutOne = "1001" and DecodeOutTwo = "0010" then
        colortesting <= "0000111000000000000";
    end if;
    if DecodeOutOne = "1001" and DecodeOutTwo = "0011" then
        colortesting <= "0001000000100000001";
    end if;
    if DecodeOutOne = "1001" and DecodeOutTwo = "0100" then
        colortesting <= "0001000000100000000";
    end if;
    if DecodeOutOne = "1001" and DecodeOutTwo = "0101" then
        colortesting <= "0000100000000000000";
    end if;
    if DecodeOutOne = "1001" and DecodeOutTwo = "0110" then
        colortesting <= "0111000000000000000";
    end if;
    if DecodeOutOne = "1001" and DecodeOutTwo = "0111" then
        colortesting <= "0011000000000000000";
    end if;
    if DecodeOutOne = "1001" and DecodeOutTwo = "1000" then
        colortesting <= "0001000000000000000";
    end if;
    if DecodeOutOne = "1001" and DecodeOutTwo = "1010" then
        colortesting <= "0001000000000010000";
    end if;
    if DecodeOutOne = "1001" and DecodeOutTwo = "1011" then
        colortesting <= "0001000000001010000";
    end if;
    if DecodeOutOne = "1001" and DecodeOutTwo = "1100" then
        colortesting <= "0001000000001110000";
    end if;
    if DecodeOutOne = "1001" and DecodeOutTwo = "1101" then
        colortesting <= "1111000000000000100";
    end if;
    if DecodeOutOne = "1010" and DecodeOutTwo = "0000" then
        colortesting <= "1000000000000000010";
    end if;
    if DecodeOutOne = "1010" and DecodeOutTwo = "0001" then
        colortesting <= "0000010000000001010";
    end if;
    if DecodeOutOne = "1010" and DecodeOutTwo = "0010" then
        colortesting <= "0000011000000001010";
    end if;
    if DecodeOutOne = "1010" and DecodeOutTwo = "0011" then
        colortesting <= "0000000000010001011";
    end if;
    if DecodeOutOne = "1010" and DecodeOutTwo = "0100" then
        colortesting <= "0000000000010001010";
    end if;
    if DecodeOutOne = "1010" and DecodeOutTwo = "0101" then
        colortesting <= "0000000000000001010";
    end if;
    if DecodeOutOne = "1010" and DecodeOutTwo = "0110" then
        colortesting <= "0000000000000000010";
    end if;
    if DecodeOutOne = "1010" and DecodeOutTwo = "0111" then
        colortesting <= "0100000000000000010";
    end if;
    if DecodeOutOne = "1010" and DecodeOutTwo = "1000" then
        colortesting <= "0000000000000010000";
    end if;
    if DecodeOutOne = "1010" and DecodeOutTwo = "1001" then
        colortesting <= "0001000000000010000";
    end if;
    if DecodeOutOne = "1010" and DecodeOutTwo = "1011" then
        colortesting <= "0000000000001000000";
    end if;
    if DecodeOutOne = "1010" and DecodeOutTwo = "1100" then
        colortesting <= "0000000000001100000";
    end if;
    if DecodeOutOne = "1010" and DecodeOutTwo = "1101" then
        colortesting <= "1000000000000000110";
    end if;
    if DecodeOutOne = "1011" and DecodeOutTwo = "0000" then
        colortesting <= "0000000001000000000";
    end if;
    if DecodeOutOne = "1011" and DecodeOutTwo = "0001" then
        colortesting <= "0000010000001001010";
    end if;
    if DecodeOutOne = "1011" and DecodeOutTwo = "0010" then
        colortesting <= "0000011000001001010";
    end if;
    if DecodeOutOne = "1011" and DecodeOutTwo = "0011" then
        colortesting <= "0000000000011001011";
    end if;
    if DecodeOutOne = "1011" and DecodeOutTwo = "0100" then
        colortesting <= "0000000000011001010";
    end if;
    if DecodeOutOne = "1011" and DecodeOutTwo = "0101" then
        colortesting <= "0000000000001001010";
    end if;
    if DecodeOutOne = "1011" and DecodeOutTwo = "0110" then
        colortesting <= "0000000000001000010";
    end if;
    if DecodeOutOne = "1011" and DecodeOutTwo = "0111" then
        colortesting <= "0100000000001000010";
    end if;
    if DecodeOutOne = "1011" and DecodeOutTwo = "1000" then
        colortesting <= "0000000000001010000";
    end if;
    if DecodeOutOne = "1011" and DecodeOutTwo = "1001" then
        colortesting <= "0001000000001010000";
    end if;
    if DecodeOutOne = "1011" and DecodeOutTwo = "1010" then
        colortesting <= "0000000000001000000";
    end if;
    if DecodeOutOne = "1011" and DecodeOutTwo = "1100" then
        colortesting <= "0000000000000100000";
    end if;
    if DecodeOutOne = "1011" and DecodeOutTwo = "1101" then
        colortesting <= "0000000001000000100";
    end if;
    if DecodeOutOne = "1100" and DecodeOutTwo = "0000" then
        colortesting <= "0000000001000100000";
    end if;
    if DecodeOutOne = "1100" and DecodeOutTwo = "0001" then
        colortesting <= "0000010000001101010";
    end if;
    if DecodeOutOne = "1100" and DecodeOutTwo = "0010" then
        colortesting <= "0000011000001101010";
    end if;
    if DecodeOutOne = "1100" and DecodeOutTwo = "0011" then
        colortesting <= "0000000000011101011";
    end if;
    if DecodeOutOne = "1100" and DecodeOutTwo = "0100" then
        colortesting <= "0000000000011101010";
    end if;
    if DecodeOutOne = "1100" and DecodeOutTwo = "0101" then
        colortesting <= "0000000000001101010";
    end if;
    if DecodeOutOne = "1100" and DecodeOutTwo = "0110" then
        colortesting <= "0000000000001100010";
    end if;
    if DecodeOutOne = "1100" and DecodeOutTwo = "0111" then
        colortesting <= "0100000000001100010";
    end if;
    if DecodeOutOne = "1100" and DecodeOutTwo = "1000" then
        colortesting <= "0000000000001110000";
    end if;
    if DecodeOutOne = "1100" and DecodeOutTwo = "1001" then
        colortesting <= "0001000000001110000";
    end if;
    if DecodeOutOne = "1100" and DecodeOutTwo = "1010" then
        colortesting <= "0000000000001100000";
    end if;
    if DecodeOutOne = "1100" and DecodeOutTwo = "1011" then
        colortesting <= "0000000000000100000";
    end if;
    if DecodeOutOne = "1100" and DecodeOutTwo = "1101" then
        colortesting <= "0000000001000100100";
    end if;
    if DecodeOutOne = "1101" and DecodeOutTwo = "0000" then
        colortesting <= "0000000000000000100";
    end if;
    if DecodeOutOne = "1101" and DecodeOutTwo = "0001" then
        colortesting <= "0000000100000000000";
    end if;
    if DecodeOutOne = "1101" and DecodeOutTwo = "0010" then
        colortesting <= "0000001100000000000";
    end if;
    if DecodeOutOne = "1101" and DecodeOutTwo = "0011" then
        colortesting <= "0000000110000000000";
    end if;
    if DecodeOutOne = "1101" and DecodeOutTwo = "0100" then
        colortesting <= "0000010100010000000";
    end if;
    if DecodeOutOne = "1101" and DecodeOutTwo = "0101" then
        colortesting <= "0000010100000000000";
    end if;
    if DecodeOutOne = "1101" and DecodeOutTwo = "0110" then
        colortesting <= "1000000000000000100";
    end if;
    if DecodeOutOne = "1101" and DecodeOutTwo = "0111" then
        colortesting <= "1100000000000000100";
    end if;
    if DecodeOutOne = "1101" and DecodeOutTwo = "1000" then
        colortesting <= "1110000000000000100";
    end if;
    if DecodeOutOne = "1101" and DecodeOutTwo = "1001" then
        colortesting <= "1111000000000000100";
    end if;
    if DecodeOutOne = "1101" and DecodeOutTwo = "1010" then
        colortesting <= "1000000000000000110";
    end if;
    if DecodeOutOne = "1101" and DecodeOutTwo = "1011" then
        colortesting <= "0000000001000000100";
    end if;
    if DecodeOutOne = "1101" and DecodeOutTwo = "1100" then
        colortesting <= "0000000001000100100";
    end if;
    if DecodeOutOne = DecodeOutTwo then
    
     colortesting <= "0000000000000000000";
    end if;

    
    
    
  end process;

end architecture;
