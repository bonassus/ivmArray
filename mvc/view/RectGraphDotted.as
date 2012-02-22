package mvc.view
{

	import flash.display.Graphics;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import mvc.view.DashedLine;
	import mvc.view.Draw;

	public class RectGraphDotted extends MovieClip
	{

		private var myRect:Sprite = new MovieClip();
		private var _w;
		private var _h;
		private var _a;
		private var _color;
		
		private var dl = new DashedLine(this,3,7);
		private var draw:Draw = new Draw;;
		
		public function RectGraphDotted(width):void
		{
			
//			width,height,color,alpha
			_w	 = width;
//			_h = height;
//			_color = color;
//			_a = alpha;
			
			init();
		
		}

		public function init():void
		{
			trace();
			
			dl.lineStyle(2,0x666666,2);	
			draw.curvedBox(dl,10,10,_w,40,20);
			

		}
		
		public function clearShape():void
		{
			myRect.graphics.clear();
			removeChild(myRect);
		}

	}
}