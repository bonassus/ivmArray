package com.doitflash.utils.scroll
{
////////////////////////////////////// import classes
	import flash.display.Sprite;
	import flash.display.Graphics;
	
	/**
	 * @private
	 * @author Ali Tavakoli
	 */
	public class ThumbV extends Buttons
	{
////////////////////////////////////// properties
		private var _myBtn:DragerV = new DragerV;
////////////////////////////////////// constructor function
		public function ThumbV():void
		{
			// I'm ready
		}
////////////////////////////////////// methods
		public function draw():void
		{
	
			addChild(_myBtn);
		}
		
		public function clearShape():void
		{
			removeChild(_myBtn);
		}
//////////////////////////////////////
	}
}