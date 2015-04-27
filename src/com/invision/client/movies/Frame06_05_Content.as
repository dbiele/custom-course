 package com.invision.client.movies 
{
	import com.invision.Core;
	import com.invision.events.AudioEvent;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;
	
	/**
	 * ...
	 * @author Dean Biele
	 */
	public class Frame06_05_Content extends MovieClip 
	{
		
		private var _selectionDictionary:Dictionary;
		private var _currentMC:String;
		
		public var checkmark_1:MovieClip;
		public var checkmark_2:MovieClip;
		public var checkmark_3:MovieClip;
		public var checkmark_4:MovieClip;
		public var checkmark_5:MovieClip;
		public var checkmark_6:MovieClip;
		
		private var _status1_mc:MovieClip;
		private var _status2_mc:MovieClip;
		private var _status3_mc:MovieClip;
		private var _status4_mc:MovieClip;
		private var _status5_mc:MovieClip;
		private var _status6_mc:MovieClip;
		
		public function Frame06_05_Content() 
		{
			addEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage, false, 0, true);
			if (stage) {
				initialize();
			}else{
				addEventListener(Event.ADDED_TO_STAGE, initialize, false, 0, true);
			}	
		}
		
		private function onRemoveFromStage(event:Event):void {
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
			Core.AudioObject.removeEventListener(AudioEvent.ON_AUDIO_PLAY_COMPLETE_ASYNC, onAudioComplete);
			gotoAndStop(1);
			delete(this);
		}
		
		private function initData():void {
			
			_selectionDictionary = new Dictionary();
		}
		
		private function initialize(event:Event = null):void {
			onStartInteraction();
		}
		
		public function onStartInteraction(event:Event = null):void {
			initData();
			addMainMenuHandlers();
			stop();
		}
		
		private function addMainMenuHandlers():void {
			_status1_mc = checkmark_1.radiobutton1_mc;
			_status2_mc = checkmark_2.radiobutton1_mc;
			_status3_mc = checkmark_3.radiobutton1_mc;
			_status4_mc = checkmark_4.radiobutton1_mc;
			_status5_mc = checkmark_5.radiobutton1_mc;
			_status6_mc = checkmark_6.radiobutton1_mc;
			
			_status1_mc.buttonMode = true;
			_status1_mc.useHandCursor = true;
			_status1_mc.addEventListener(MouseEvent.MOUSE_UP, onStatusHandler1, false, 0, true);			
			
			_status2_mc.buttonMode = true;
			_status2_mc.useHandCursor = true;
			_status2_mc.addEventListener(MouseEvent.MOUSE_UP, onStatusHandler1, false, 0, true);
			
			_status3_mc.buttonMode = true;
			_status3_mc.useHandCursor = true;
			_status3_mc.addEventListener(MouseEvent.MOUSE_UP, onStatusHandler1, false, 0, true);
			
			_status4_mc.buttonMode = true;
			_status4_mc.useHandCursor = true;
			_status4_mc.addEventListener(MouseEvent.MOUSE_UP, onStatusHandler1, false, 0, true);
			
			_status5_mc.buttonMode = true;
			_status5_mc.useHandCursor = true;
			_status5_mc.addEventListener(MouseEvent.MOUSE_UP, onStatusHandler1, false, 0, true);
			
			_status6_mc.buttonMode = true;
			_status6_mc.useHandCursor = true;
			_status6_mc.addEventListener(MouseEvent.MOUSE_UP, onStatusHandler1, false, 0, true);
		}
		
		private function onStatusHandler6(mouseevent:MouseEvent):void 
		{
			
		}
		
		private function onStatusHandler5(mouseevent:MouseEvent):void 
		{
			
		}
		
		private function onStatusHandler4(mouseevent:MouseEvent):void 
		{
			
		}
		
		private function onStatusHandler3(mouseevent:MouseEvent):void 
		{
			
		}
		
		private function onStatusHandler2(mouseevent:MouseEvent):void 
		{
			
		}
		
		private function onStatusHandler1(mouseevent:MouseEvent):void {
			var currentTarget:MovieClip = mouseevent.currentTarget as MovieClip;
			var currentButton:MovieClip = currentTarget.parent as MovieClip;
			currentButton.radiobutton1_mc.gotoAndStop(2);
			currentButton.gotoAndStop(2);
		}
		
		private function onAudioComplete(event:Event):void {
			Core.AudioObject.removeEventListener(AudioEvent.ON_AUDIO_PLAY_COMPLETE_ASYNC, onAudioComplete);
			trace("_currentMC.name = " + _currentMC);
			switch(_currentMC) {
				case "status1_mc":
					//status1_mc.gotoAndPlay("full");
					break;
				case "status2_mc":
					//status2_mc.gotoAndPlay("full");
					break;
				case "status3_mc":
					//status3_mc.gotoAndPlay("full");
					break;
				default:
					break;
			}
			_selectionDictionary[_currentMC] = 1;
			
			var ii:int = 0;
			for each(var item:Object in _selectionDictionary) {
				ii++;
				trace("item = " + item);
			}
			trace("ii = " + ii);
			if (ii == 3) {
				
				Core.getInstance().getScene().setVisited();
				Core.Modules.updateCompletionBookmark();
			}			
		}		
		
	}

}