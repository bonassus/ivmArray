

package mvc.controller
{
	import flash.events.Event;
	import mvc.model.Model;

	public class Controller
	{
		private var _model:Model;
	//	private var _sliderAmout:Number = 5;


		public function Controller(model:Model){
			_model = model;
		}

        public function setPerc(perc){
            _model.setPerc(perc);
        }
	




    }
}