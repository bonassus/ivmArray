
package mvc.model
{
import com.greensock.easing.*;

import flash.display.MovieClip;
import flash.events.Event;
import flash.events.EventDispatcher;
	public class Model extends EventDispatcher
	{

	    public static const SLIDER_PERC:String = 'SliderPerc';



	public var scrollPerc:Number;

   //
     
        public function Model(){
		}


        public function setPerc(perc):void {
			//trace(perc/100);
			
			
				scrollPerc = perc/100;
             dispatchEvent(new Event(SLIDER_PERC));
        }





    }
}