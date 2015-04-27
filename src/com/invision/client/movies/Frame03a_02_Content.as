 package com.invision.client.movies 
{
	import com.invision.Core;
	import com.invision.events.AudioEvent;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Frame03a_02_Content extends MovieClip 
	{
		
		public var asr_mc:MovieClip;
		public var nas_mc:MovieClip;
		public var srep_mc:MovieClip;
		
		public var status1_mc:MovieClip;
		public var status2_mc:MovieClip;
		public var status3_mc:MovieClip;
		
		public var pop_window1:Frame03a_02_CloseWindow;
		public var pop_window2:Frame03a_02_CloseWindow;
		public var pop_window3:Frame03a_02_CloseWindow;
		
		private static var _selectionDictionary:Dictionary;
		private var _currentMC:String;
		
		public function Frame03a_02_Content() 
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
		
		private function onRemoveFromStage(event:Event):void {
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
			status1_mc.removeEventListener(MouseEvent.MOUSE_UP, onStatusHandler1);
			status2_mc.removeEventListener(MouseEvent.MOUSE_UP, onStatusHandler2);
			status3_mc.removeEventListener(MouseEvent.MOUSE_UP, onStatusHandler3);
			Core.AudioObject.removeEventListener(AudioEvent.ON_AUDIO_PLAY_COMPLETE_ASYNC, onAudioComplete);
			gotoAndStop(1);
			delete(this);
		}
		
		private function enableButtons():void {
			status1_mc.mouseEnabled = true;
			status2_mc.mouseEnabled = true;
			status3_mc.mouseEnabled = true;
		}
		
		private function disableButtons():void {
			status1_mc.mouseEnabled = false;
			status1_mc.mouseChildren = false;
			status2_mc.mouseEnabled = false;
			status2_mc.mouseChildren = false;
			status3_mc.mouseEnabled = false;
			status3_mc.mouseChildren = false;
		}		
		
		private function initialize(event:Event = null):void {
			onStartInteraction();
		}	
		
		public function onStartInteraction(event:Event = null):void {
			initData();
			addMainMenuHandlers();
			checkVisited();
			stop();
		}
		
		private function checkVisited():void 
		{
			if (Core.getInstance().getScene().isVisited()) {
				_selectionDictionary["status1_mc"] = 2;
				_selectionDictionary["status2_mc"] = 2;
				_selectionDictionary["status3_mc"] = 2;
			}
			for (var item in _selectionDictionary) {
				if (_selectionDictionary[item] == 1) {
					this[item].gotoAndPlay("half");
				}else if (_selectionDictionary[item] == 2) {
					this[item].gotoAndPlay("full");
				}
			}

		}
		
		private function initData():void {
			trace("_selectionDictionary = " + _selectionDictionary);
			if(_selectionDictionary == null){
				_selectionDictionary = new Dictionary();
			}
		}
		
		private function addMainMenuHandlers():void {
			status1_mc = asr_mc.status_mc;
			status2_mc = nas_mc.status_mc;
			status3_mc = srep_mc.status_mc;
			
			status1_mc.buttonMode = true;
			status1_mc.useHandCursor = true;
			status1_mc.addEventListener(MouseEvent.MOUSE_UP, onStatusHandler1, false, 0, true);			
			
			status2_mc.buttonMode = true;
			status2_mc.useHandCursor = true;
			status2_mc.addEventListener(MouseEvent.MOUSE_UP, onStatusHandler2, false, 0, true);
			
			status3_mc.buttonMode = true;
			status3_mc.useHandCursor = true;
			status3_mc.addEventListener(MouseEvent.MOUSE_UP, onStatusHandler3, false, 0, true);
		}
		
		override public function stop() : void { 
			// your code here 
			trace("stop called");
			super.stop();
		} 
		
		private function onStatusHandler1(mouseevent:MouseEvent):void {
			Core.Renderer.onStop(this);
			disableButtons();

			Core.AudioObject.stop();
			Core.CourseObject.manualCaption("captionsID1");
			Core.AudioObject.play("media/f3a_s2.mp3", true);
			Core.AudioObject.addEventListener(AudioEvent.ON_AUDIO_PLAY_COMPLETE_ASYNC, onAudioComplete, false, 0, true);
			_currentMC = "status1_mc";
			if (_selectionDictionary[_currentMC] != 2) {
				_selectionDictionary[_currentMC] = 1;
				status1_mc.gotoAndPlay("half");
			}
			gotoAndPlay("begin_asr");
		}
		
		private function onStatusHandler2(mouseevent:MouseEvent):void {
			disableButtons();
			
			Core.AudioObject.stop();
			Core.CourseObject.manualCaption("captionsID2");
			Core.AudioObject.play("media/f3a_s3.mp3", true);
			Core.AudioObject.addEventListener(AudioEvent.ON_AUDIO_PLAY_COMPLETE_ASYNC, onAudioComplete, false, 0, true);
			_currentMC = "status2_mc";
			if (_selectionDictionary[_currentMC] != 2) {
				_selectionDictionary[_currentMC] = 1;
				status2_mc.gotoAndPlay("half");
			}
			gotoAndPlay("begin_nas");
		}
		
		private function onStatusHandler3(mouseevent:MouseEvent):void {
			disableButtons();
			
			Core.AudioObject.stop();
			Core.CourseObject.manualCaption("captionsID3");
			Core.AudioObject.play("media/f3a_s4.mp3", true);
			Core.AudioObject.addEventListener(AudioEvent.ON_AUDIO_PLAY_COMPLETE_ASYNC, onAudioComplete, false, 0, true);
			_currentMC = "status3_mc";
			if (_selectionDictionary[_currentMC] != 2) {
				_selectionDictionary[_currentMC] = 1;
				status3_mc.gotoAndPlay("half");
			}
			gotoAndPlay("begin_srep");
		}
		
		public function initializeWindow1():void {
			asr_mc.gotoAndPlay(1);
			pop_window1.addEventListener(Frame03a_02_CloseWindow.CLOSE_WINDOW, onCloseWindow, false, 0, true);
			stop();
			
			//responseWindow1.addEventListener(Frame06_02_CloseWindow.CLOSE_WINDOW, onCloseWindow, false, 0, true);
		}
		
		public function initializeWindow2():void {
			nas_mc.gotoAndPlay(1);
			pop_window2.addEventListener(Frame03a_02_CloseWindow.CLOSE_WINDOW, onCloseWindow, false, 0, true);
			stop();
			//responseWindow2.addEventListener(Frame06_02_CloseWindow.CLOSE_WINDOW, onCloseWindow, false, 0, true);
		}
		
		public function initializeWindow3():void {
			srep_mc.gotoAndPlay(1);
			pop_window3.addEventListener(Frame03a_02_CloseWindow.CLOSE_WINDOW, onCloseWindow, false, 0, true);
			stop();
			//responseWindow3.addEventListener(Frame06_02_CloseWindow.CLOSE_WINDOW, onCloseWindow, false, 0, true);
		}	
		
		private function onCloseWindow(event:Event):void {
			trace("onCloseWindow***");
			srep_mc.removeEventListener(Frame03a_02_CloseWindow.CLOSE_WINDOW, onCloseWindow);
			asr_mc.removeEventListener(Frame03a_02_CloseWindow.CLOSE_WINDOW, onCloseWindow);
			nas_mc.removeEventListener(Frame03a_02_CloseWindow.CLOSE_WINDOW, onCloseWindow);
			Core.AudioObject.stop();
			play();
			enableButtons();
		}
		
		private function onAudioComplete(event:Event):void {
			Core.AudioObject.removeEventListener(AudioEvent.ON_AUDIO_PLAY_COMPLETE_ASYNC, onAudioComplete);
			trace("_currentMC.name = " + _currentMC);
			switch(_currentMC) {
				case "status1_mc":
					status1_mc.gotoAndPlay("full");
					break;
				case "status2_mc":
					status2_mc.gotoAndPlay("full");
					break;
				case "status3_mc":
					status3_mc.gotoAndPlay("full");
					break;
				default:
					break;
			}
			_selectionDictionary[_currentMC] = 2;
			
			var ii:int = 0;
			for each(var item:Object in _selectionDictionary) {
				if(item == 2){
					ii++;
				}
				trace("item = " + item);
			}
			trace("ii = " + ii);
			if (ii == 3) {
				
				Core.getInstance().getScene().setVisited();
				Core.Modules.updateCompletionBookmark();
			}			
		}
		
		public function onSceneComplete():void {
			Core.Renderer.completeClip(this);
			stop();
		}
		
	}

}