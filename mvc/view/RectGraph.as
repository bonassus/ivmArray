package mvc.view
{

	import flash.display.Sprite;
	import flash.display.Graphics;
	

	public class RectGraph extends Sprite
	{

		private var myRect:Sprite = new Sprite();
		private var _w;
		private var _h;
		private var _a;
		private var _color;
		
		
		public function RectGraph(width,height,color,alpha):void
		{
			_w	 = width;
			_h = height;
			_color = color;
			_a = alpha;
			
			draw();
		
		}

		public function draw():void
		{
		//var	curve = Math.min(_w, _h, curve);
			
			myRect.graphics.lineStyle(1, 0x000000, .5, false);
			myRect.graphics.beginFill(_color, _a);
			myRect.graphics.drawRoundRect(0, 0, _w, _h,0);
			myRect.graphics.endFill();
			addChild(myRect);
		}
		
		public function clearShape():void
		{
			myRect.graphics.clear();
			removeChild(myRect);
		}

	}
}