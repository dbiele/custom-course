 package com.invision.client.movies 
{
	import com.invision.client.components.BasicButton;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Frame03a_02_CloseWindow extends MovieClip 
	{
		
		public var background_mc:MovieClip;
		private var _basicButtonClose:BasicButton;
		
		public static const CLOSE_WINDOW:String = "closewindow";
		
		public function Frame03a_02_CloseWindow() 
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage, false, 0, true);
		}
		
		private function onAddedToStage(event:Event):void {
			trace("added to stage window = " + background_mc.close_btn);
			_basicButtonClose = new BasicButton("frame03close", background_mc.close_btn);
			_basicButtonClose.addEventListener(MouseEvent.MOUSE_UP, onCloseWindow, false, 0, true);
		}
		
		private function onCloseWindow(mouseevent:MouseEvent):void {
			trace("onCloseWindow");
			gotoAndPlay("close_next");
		}
		
		public function closeWindow():void {
			trace("closeWindow");
			var currentParent:MovieClip = parent as MovieClip;
			currentParent.play();
			dispatchEvent(new Event(CLOSE_WINDOW));
		}
		
	}

}