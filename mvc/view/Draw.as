package mvc.view
{
	public class Draw
	{
		public var _target;
		
		
		public function curvedBox(target:Object, x:Number, y:Number, w:Number,h:Number,radius:Number)
		{
			
			_target = target;
			
			var circ:Number = 0.707107
			var off:Number = 0.6
			_target.moveTo(x+0,y+radius);
			_target.lineTo(x+0,y+h-radius);
			_target.curveTo(x+0,y+(h-radius)+radius*(1-off),x+0+(1-circ)*radius,y+h-(1-circ)*radius);
			_target.curveTo(x+(0+radius)-radius*(1-off),y+h,x+radius,y+h);
			_target.lineTo(x+w-radius,y+h);
			_target.curveTo(x+(w-radius)+radius*(1-off),y+h,x+w-(1-circ)*radius,y+h-(1-circ)*radius);
			_target.curveTo(x+w,y+(h-radius)+radius*(1-off),x+w,y+h-radius);
			_target.lineTo(x+w,y+0+radius);
//			target.curveTo(x+w, y+radius-radius*(1-off),x+w-(1-circ)*radius,y+0+(1-circ)*radius);
//			target.curveTo(x+(w-radius)+radius*(1-off),y+0,x+w-radius,y+0);
//			target.lineTo(x+radius,y+0);
//			target.curveTo(x+radius-radius*(1-off),y+0,x+(1-circ)*radius,y+(1-circ)*radius);
//			target.curveTo(x+0, y+radius-radius*(1-off),x+0,y+radius);
			
		}
		
		public function clearDraw(){
			
		
			//_target.isLine = true;
		//	_target.overflow = 0;
			//_target.pen = {x:0, y:0};
			_target.clear();
		
		}
		
		
	}
}
