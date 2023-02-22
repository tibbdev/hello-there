/*
 * main.c
 *
 */
 
 #include <stdio.h>
 #include <stdbool.h>
 #include <stdint.h>
 
 int main()
{
   volatile uint32_t count; // Making voltaile so it doesnt get optimised out!
   while(true)
   {
      printf("\r\n"Hello There!");
      count = 0;
      while(3141593 > count++) // Waste some time! 
      {
         // Do Nothing!
      }
   }
   return 0;
}
