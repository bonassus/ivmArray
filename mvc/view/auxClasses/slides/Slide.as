﻿package slides {	import com.greensock.*;	import com.greensock.easing.*;		import flash.display.DisplayObject;	import flash.display.MovieClip;		public class Slide extends MovieClip {				public function Slide() {			super();			init();		}				protected function init():void {			this.visible = false;			this.alpha = 0;					}								public function animateIn():TimelineLite {			var tl:TimelineLite = new TimelineLite();			tl.insert(new TweenLite(this, .5, {autoAlpha:1}));			tl.insert(TweenLite.from(this, 1, {x:"400", blurFilter:{blurX:50}}));			return tl;		}				public function animateOut():TimelineLite {			var tl:TimelineLite = new TimelineLite();			tl.append(new TweenLite(this, .5, {autoAlpha:0}));			tl.insert(TweenLite.to(this, 1, {x:"-600", blurFilter:{blurX:80}}));			return tl;		}					}}