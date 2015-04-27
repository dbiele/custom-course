 package com.invision.client.movies 
{
	import com.invision.Core;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Dean Biele
	 */
	public class Frame11_08_Content extends MovieClip 
	{
		
		public function Frame11_08_Content() 
		{
			Core.Renderer.registerClip(this);
			Core.Renderer.onStop(this);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage, false, 0, true);
			if (stage) {
				initialize();
			}else{
				addEventListener(Event.ADDED_TO_STAGE, initialize, false, 0, true);
			}
		}
		
		private function initialize(event:Event = null):void {
			
		}
		
		public function onComplete():void {
			trace("onComplete in frame11_06");
			Core.Renderer.completeClip(this);
			Core.Renderer.setSceneComplete();
			stop();
		}
		
		private function onRemoveFromStage(event:Event):void {
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
			gotoAndStop(1);
			delete(this);
		}
		
	}

}