 package com.invision.client.movies 
{
	import com.invision.client.components.BasicButton;
	import com.invision.Core;
	import com.invision.interfaces.ISequence;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Dean Biele
	 */
	public class Frame11_01_ASR_Content extends MovieClip 
	{
		
		public var learnmore_btn:MovieClip;
		
		private var _learnMore_BasicButton:BasicButton;
		
		public function Frame11_01_ASR_Content() 
		{
			addEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage, false, 0, true);
			if (stage) {
				initialize();
			}else{
				addEventListener(Event.ADDED_TO_STAGE, initialize, false, 0, true);
			}	
		}
		
		private function initialize(event:Event = null):void {
			onStartInteraction();
		}		
		
		private function onStartInteraction():void 
		{
			_learnMore_BasicButton = new BasicButton("learnmore", learnmore_btn);
			_learnMore_BasicButton.addEventListener(MouseEvent.MOUSE_UP, onMouseUpHandler, false, 0, true);
		}
		
		private function onMouseUpHandler(mouseevent:MouseEvent):void 
		{
			
			Core.getInstance().setScene("scene11_1");
		}
		
		private function onRemoveFromStage(event:Event):void {
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
			gotoAndStop(1);
			delete(this);
		}
		
	}

}