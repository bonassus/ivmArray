

package mvc.view
{
    import com.greensock.loading.*;
    import com.greensock.events.*;
    import flash.display.MovieClip;
    import flash.text.Font;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.text.AntiAliasType
    import flash.text.TextFieldAutoSize;
import flash.text.TextFormatAlign;


public class TextDisplay extends MovieClip{
	private var textFormat:TextFormat = new TextFormat();
    private var theTextField:TextField = new TextField();
    private var _theText:String = "";
    private var loader:SWFLoader;
    private var fontClass:Class;
    private var _theColor:String;
    private var _fontName;
    private var _ifBold:Boolean;
    private var _textSize:uint;

		public function TextDisplay(theColor,textSize,fontName){
            _theColor = theColor;
            _textSize = textSize;
            _fontName = fontName;
            loader = new SWFLoader("mvc/view/font/fonts.swf", {onComplete:completeHandler});
		    loader.load();
		}

        function completeHandler(event:LoaderEvent):void {
		 fontClass = loader.getClass(_fontName);
		Font.registerFont(fontClass);
                 setText(_theText);

        }

         private function setText(_theText){
             textFormat.font = _fontName;
			textFormat.size = _textSize;
			textFormat.bold = _ifBold;
            textFormat.color =_theColor;

            textFormat.align = TextFormatAlign.RIGHT;

			theTextField.text = _theText;
			theTextField.setTextFormat(textFormat);
			theTextField.selectable = false;
			theTextField.mouseEnabled = false;
            theTextField.antiAliasType = AntiAliasType.ADVANCED;
            theTextField.autoSize = TextFieldAutoSize.RIGHT;
			addChild(theTextField);
    }

        public function set theText(value:String):void {
            _theText = value;
           setText(_theText);
        }
    }
}





