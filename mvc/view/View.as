
package mvc.view
{
import com.greensock.*;
import com.greensock.easing.*;

import flash.display.*;
import flash.events.*;
import flash.net.URLRequest;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.utils.Timer;

import mvc.controller.Controller;
import mvc.model.Model;
import mvc.view.DrawGrid;
import mvc.view.RectGraph;
import mvc.view.Scroll;
	
	public class View extends MovieClip
	{
		private var _model:Model;
		private var _controller:Controller;
	 private var _scroll:Scroll;
	 
	 
	 private var _line1:RectGraph;
	 private var _rectGraph:RectGraph;
	 private var sampleContent:SampleContent;
	 private var areaBarV:AreaBarV = new AreaBarV;
	 
	 private var width1:Number;
	 private var width2:Number;
	// private var dottedH1:DottedH = new DottedH;
	// private var dottedH2:DottedH2 = new DottedH2;
	 private var numberBox1:NumberBox1 = new NumberBox1;
	 private var numberBox2:NumberBox1 = new NumberBox1;
	 private var numberBox3:NumberBox2 = new NumberBox2;
	 
	 private var arrowL:ArrowL = new ArrowL;
	 private var arrowHead1:ArrowHead = new ArrowHead;
	 private var arrowHead3:ArrowHead = new ArrowHead;
	 private var arrowHead4:ArrowHead = new ArrowHead;
	 private var arrowHead2:ArrowHead = new ArrowHead;
	 private var _mask:Mask = new Mask;
	 private var inPut:InPutNumbers = new InPutNumbers;
	 private var line:Line = new Line;
	 
	 private var totalH:Number ;
	 private var totalV:Number ;
	 
	private var grid:DrawGrid;
	
	 

		public function View(model:Model, controller:Controller){
          _model = model;
		  _controller = controller;
			init();
		}
		
		
		
	    private function init():void {
			initModelEventListeners();
            creation();
			
			addEventListener(Event.ENTER_FRAME,loop);
		//addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		
		inPut.numTxt1.restrict = "0-9";
		inPut.numTxt2.restrict = "0-9";
		}
		
		
		
//		function onKeyDown(event:KeyboardEvent):void{
//			
//			trace(event.target);
//			
//			if (event is Number) {
//				
//				trace("num");
//				
//			} else {
//				
//				trace("not");
//			}
//			
//		}

		private function initModelEventListeners():void{
            _model.addEventListener(Model.SLIDER_PERC, scrollPercHandler);
		}

        private function creation (){
			sampleContent = new SampleContent;
			addChild(sampleContent);
			_scroll =  new Scroll(sampleContent,"HOR",600,300,_model,_controller);
			
	
			_line1 = new RectGraph(1,300,0x000000,.1)
			_rectGraph = new RectGraph(580,300,0xFFFFFF,1);
			
			
			 _scroll.x = 300;
			 _rectGraph.x = _scroll.x + 10;
			 _rectGraph.y = _scroll.y = 200;
			 
			 
			 grid = new DrawGrid(580, 300, 580, 300);
			 grid.x = _rectGraph.x;
			 grid.y = _rectGraph.y;
		  	 grid.setlineColor = 0x666666;
			 
			 
			 _line1.x = 300;
			 _line1.y = _rectGraph.y
				 
			 arrowHead2.x = areaBarV.x - 20;
			 arrowHead2.y = 184;
			 arrowHead2.rotation = 175;
			 addChild(arrowHead2);
			 
			 
			 arrowHead4.x = _rectGraph.width + _rectGraph.x;
			 arrowHead4.y = 184;
			 arrowHead4.rotation = 175;
			 addChild(arrowHead4);
			
			 arrowHead1.x = _rectGraph.x;
			 arrowHead1.y = 175;
			 addChild(arrowHead1);
			 
			 arrowHead3.x = areaBarV.x +10;
			 arrowHead3.y = 175;
			 addChild(arrowHead3);

			 
			 arrowL.x = _rectGraph.x;
			 arrowL.y = 175;
			 arrowL.width = 700;
			 addChild(arrowL);
			 
			 
			 inPut.x = 430;
			 inPut.y = 80;
			 addChild(inPut);
			 
			 _mask.x = areaBarV.x - 10;
			 _mask.y = 175;
			 addChild(_mask);
			 
			 
			 numberBox3.x = _rectGraph.x - 40;
			 numberBox3.y = 340;
			 addChild(numberBox3);

			 
			 numberBox1.x = width1/2;
			 numberBox1.y = 160;
			 addChild(numberBox1);
			 
			 
			 numberBox2.x = width2/2;
			 numberBox2.y = 160;
			 addChild(numberBox2);
			 
			
			addChild(_rectGraph);
			addChild(grid);
			addChild(_scroll);
			addChild(areaBarV);
			
			
//			addChild(dottedH1);	
//			dottedH1.y =  _rectGraph.y - dottedH1.height;
//			dottedH1.x =  _rectGraph.x;
//			
//			addChild(dottedH2);
//			dottedH2.y =  _rectGraph.y - dottedH2.height;
//			dottedH2.x = _rectGraph.width + _rectGraph.x ; 

             }
		
		
		function loop(e:Event){
			
			
			totalH = Number(inPut.numTxt2.text);
			totalV = Number(inPut.numTxt1.text);
			
			numberBox3.numTxt.text = String(totalV);
			
			grid.vGap = 300 /totalV;
			grid.hGap = 580 /totalH ; 
		}
		
       private function scrollPercHandler(e:Event){
		   
		    
		    width1 = (areaBarV.x - _rectGraph.x) ;
				
			var lineToEnd = _rectGraph.width + _rectGraph.x  - areaBarV.x	
			width2 = _rectGraph.width + _rectGraph.x - (numberBox2.width);
			
		 
		   areaBarV.x = _rectGraph.x  + ((_rectGraph.width - 2) * _model.scrollPerc);
		   areaBarV.y = _scroll.y;
		   
		   
		   arrowHead3.x = areaBarV.x + 10;
		   _mask.x = areaBarV.x -10;
		   
		   numberBox1.x = ((width1/2 ) + _rectGraph.x) -  (numberBox1.width/2);
		   numberBox2.x = ((width2 - lineToEnd *.5) + numberBox2.width) -10;
		  
		   
		   arrowHead2.x = areaBarV.x - 20;
		   
		   //(Math.floor(totalH * _model.scrollPerc));

		   
		   var number2 = Math.floor(totalH * _model.scrollPerc);
		   numberBox1.numTxt.text = String(number2);
		   numberBox2.numTxt.text = String(totalH - number2);

		  // grid.setSize(300,200);

       }

	}

}