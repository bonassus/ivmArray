﻿package mvc.view{import com.doitflash.consts.Easing;import com.doitflash.consts.Orientation;import com.doitflash.events.ScrollEvent;import com.doitflash.utils.scroll.EffectConst;import com.doitflash.utils.scroll.RegSimpleConst;import com.doitflash.utils.scroll.RegSimpleScroll;import com.greensock.*;import com.greensock.easing.*;import flash.display.*;import flash.display.Sprite;import flash.events.*;import mvc.controller.Controller;import mvc.model.Model;	public class Scroll extends MovieClip{						private var _model:Model;		private var _controller:Controller;						private var _regSimpleScroll:RegSimpleScroll;				private var _myContent;		private var _myOrientation;		private var _height:Number;		private var _width:Number;				public function Scroll(content,orientation:String,width,height,model:Model, controller:Controller){			_regSimpleScroll = new RegSimpleScroll();						switch(orientation)
			{
				case "HOR":
				{					_regSimpleScroll.addEventListener(ScrollEvent.ENTER_FRAME, onScrollEnterFrameX);							_myOrientation = Orientation.HORIZONTAL	;					
					
					break;
				}									case "VERT":				{					_regSimpleScroll.addEventListener(ScrollEvent.ENTER_FRAME, onScrollEnterFrameY);					_myOrientation = Orientation.VERTICAL;										break;				}									case "AUTO":				{					trace("au");					_myOrientation = Orientation.AUTO;										break;				}
					
				default:
				{										_myOrientation = Orientation.AUTO;
					break;
				}
			}									_myContent = content;			_width = width;			_height = height;						_model = model;			_controller = controller;						init();					//	_regSimpleScroll.addEventListener(ScrollEvent.MASK_WIDTH, onMaskWidth); // listens when ever the mask width changes by calling maskWidth setter		//	_regSimpleScroll.addEventListener(ScrollEvent.MASK_HEIGHT, onMaskHeight); // listens when ever the mask height changes by calling maskHeight setter						          		}				private function initModelEventListeners():void{			//_model.addEventListener(Model.TEST_EVENT, testEventHandler);					}			    private function init():void {			initModelEventListeners();						// initialize the scrollbar						this.addChild(_regSimpleScroll);			_regSimpleScroll.x = 0;			_regSimpleScroll.y =0;						// set inputs			_regSimpleScroll.maskContent = _myContent;						_regSimpleScroll.maskWidth = _width;			_regSimpleScroll.maskHeight = _height;						_regSimpleScroll.orientation = _myOrientation; // accepted values: Orientation.AUTO, Orientation.VERTICAL, Orientation.HORIZONTAL			_regSimpleScroll.scrollSpace = 5; // max value is RegSimpleConst.SCROLL_MAX_SPACE			_regSimpleScroll.drawDisabledScroll = true;			_regSimpleScroll.scrollEaseType = Easing.Linear_easeNone;		//	_regSimpleScroll.scrollAniInterval = 3;			_regSimpleScroll.scrollBlurEffect = false;			_regSimpleScroll.scrollManualY = 50; // min value is 0, max value is 100			_regSimpleScroll.scrollManualX = 50; // min value is 0, max value is 100			//_regSimpleScroll.mouseWheelSpeed = 2;						// bg			_regSimpleScroll.bgEffectType = EffectConst.COLOR; // accepted values: EffectConst.COLOR, EffectConst.GLOW, EffectConst.COLOR_GLOW			_regSimpleScroll.bgEffectColor = 0xAD2C2C;			_regSimpleScroll.bgEffectAlpha = 1;			_regSimpleScroll.bgEffectAniInterval = .5;			_regSimpleScroll.bgGlowBlur = 0; // no glow blur			_regSimpleScroll.bgGlowStrength = 0; // no glow strength						_regSimpleScroll.bgCurve = 10; // max value is bg width			_regSimpleScroll.bgW = 2; // max value is RegSimpleConst.BG_MAX_WIDTH			_regSimpleScroll.bgColor = 0x333333;			_regSimpleScroll.bgAlpha = 0;						//			// slider					//	_regSimpleScroll.sliderEffectType = EffectConst.COLOR_GLOW; // accepted values: EffectConst.COLOR, EffectConst.GLOW, EffectConst.COLOR_GLOW			//			_regSimpleScroll.sliderEffectColor = 0xAD2C2C;					_regSimpleScroll.sliderEffectAlpha = 0;			//			_regSimpleScroll.sliderEffectAniInterval = .5;						_regSimpleScroll.sliderGlowBlur = 0;						_regSimpleScroll.sliderGlowStrength = 0;						_regSimpleScroll.sliderSpace = 0; // max value is (bg width/2) or (bg height/2)			_regSimpleScroll.sliderCurve = 10; // max value is slider width			_regSimpleScroll.sliderW = 10; // max value is RegSimpleConst.SLIDER_MAX_WIDTH			_regSimpleScroll.sliderH = 50; // 0 means auto height, min value is RegSimpleConst.SLIDER_MIN_HEIGHT, max value is bg height			_regSimpleScroll.sliderColor = 0x333333;			_regSimpleScroll.sliderAlpha = 1;		//	_regSimpleScroll.sliderAniInterval = 1;						// btn//			_regSimpleScroll.btnEffectType = EffectConst.COLOR_GLOW; // accepted values: EffectConst.COLOR, EffectConst.GLOW, EffectConst.COLOR_GLOW//			_regSimpleScroll.btnEffectColor = 0xAD2C2C;//			_regSimpleScroll.btnEffectAlpha = 1;//			_regSimpleScroll.btnEffectAniInterval = 1;//			_regSimpleScroll.btnGlowBlur = 5;//			_regSimpleScroll.btnGlowStrength = 1;//			//			_regSimpleScroll.btnSpace = 5; // max value is RegSimpleConst.BTN_MAX_SPACE//			_regSimpleScroll.btnLayout = RegSimpleConst.TRIANGLE; // accepted values: RegSimpleConst.TRIANGLE, RegSimpleConst.CIRCLE		_regSimpleScroll.btnSize = 0; // 0 means no buttons, max value is RegSimpleConst.BTN_MAX_SIZE, min value is RegSimpleConst.BTN_MIN_SIZE//			_regSimpleScroll.btnColor = 0x333333;//			_regSimpleScroll.btnAlpha = 1;//			_regSimpleScroll.btnScrollSpeed = 2;                  																																}										function onScrollEnterFrameX(e:ScrollEvent):void{			_controller.setPerc(_regSimpleScroll.scrollManualX);		}				function onScrollEnterFrameY(e:ScrollEvent):void{			_controller.setPerc(_regSimpleScroll.scrollManualY);		}				function onMaskWidth(e:ScrollEvent):void		{		//	trace(_regSimpleScroll.maskWidth);		}				function onMaskHeight(e:ScrollEvent):void		{			//	trace(_regSimpleScroll.maskHeight);		}//       function testEventHandler(e:Event){//       trace("test")////       }	}}