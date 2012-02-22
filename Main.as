package 
{
	import com.greensock.*;
	import com.greensock.easing.*;
	import com.greensock.events.*;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;

	

	import mvc.model.Model;
	import mvc.view.View;
	import mvc.controller.Controller;
	
	
	public class Main extends MovieClip{
		private var _model:Model;
		private var _view:View;
		private var _controller:Controller;
		
		public function Main()
		{
			init();
		}
		
		
		private function init():void{
			_model = new Model();
			_controller = new Controller(_model);
			_view = new View(_model, _controller);
			this.addChild(_view);	
			
			
			_view.y = 80;
			_view.x = -1500;
		
			TweenMax.to(_view,2, {x:-60});
		
		}	
	}
}