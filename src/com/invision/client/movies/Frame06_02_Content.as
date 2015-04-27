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
	public class Frame06_02_Content extends MovieClip 
	{
		
		public var edi_mc:MovieClip;
		public var b2b_mc:MovieClip;
		public var ecom_mc:MovieClip;
		public var jba_mc:MovieClip;
		
		public var status1_mc:MovieClip;
		public var status2_mc:MovieClip;
		public var status3_mc:MovieClip;
		public var status4_mc:MovieClip;
		
		private var _selectionDictionary:Dictionary;
		private var _currentMC:String;
		private var _currentPop:MovieClip;
		
		public function Frame06_02_Content() 
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
			this.addEventListener(Frame06_02_CloseWindow.CLOSE_WINDOW, onCloseWindow, false, 0, true);
			initData();
			addMainMenuHandlers();
			stop();
		}
		
		private function initData():void {
			_selectionDictionary = new Dictionary();
		}
		
		private function addMainMenuHandlers():void {
			status1_mc = edi_mc.title.status_mc;
			status2_mc = b2b_mc.title.status_mc;
			status3_mc = ecom_mc.title.status_mc;
			status4_mc = jba_mc.title.status_mc;
			
			status1_mc.buttonMode = true;
			status1_mc.useHandCursor = true;
			status1_mc.addEventListener(MouseEvent.MOUSE_UP, onStatusHandler1, false, 0, true);			
			
			status2_mc.buttonMode = true;
			status2_mc.useHandCursor = true;
			status2_mc.addEventListener(MouseEvent.MOUSE_UP, onStatusHandler2, false, 0, true);
			
			status3_mc.buttonMode = true;
			status3_mc.useHandCursor = true;
			status3_mc.addEventListener(MouseEvent.MOUSE_UP, onStatusHandler3, false, 0, true);
			
			status4_mc.buttonMode = true;
			status4_mc.useHandCursor = true;
			status4_mc.addEventListener(MouseEvent.MOUSE_UP, onStatusHandler4, false, 0, true);
		}
		
		private function onStatusHandler1(mouseevent:MouseEvent):void {
			
			//swapChildrenAt(getChildIndex(edi_mc), this.numChildren-1);
			//setChildIndex(edi_mc, numChildren - 1);
			disableButtons();

			Core.AudioObject.stop();
			Core.CourseObject.manualCaption("captionsID1");
			Core.AudioObject.play("media/f6_s2a.mp3", true);
			Core.AudioObject.addEventListener(AudioEvent.ON_AUDIO_PLAY_COMPLETE_ASYNC, onAudioComplete, false, 0, true);
			_currentMC = "status1_mc";
			if(_selectionDictionary[_currentMC] != 1){
				status1_mc.gotoAndPlay("half");
			}
			gotoAndPlay("begin_edi");
		}
		
		private function onStatusHandler2(mouseevent:MouseEvent):void {
			disableButtons();
			
			Core.AudioObject.stop();
			Core.CourseObject.manualCaption("captionsID2");
			Core.AudioObject.play("media/f6_s3.mp3", true);
			Core.AudioObject.addEventListener(AudioEvent.ON_AUDIO_PLAY_COMPLETE_ASYNC, onAudioComplete, false, 0, true);
			_currentMC = "status2_mc";
			if(_selectionDictionary[_currentMC] != 1){
				status2_mc.gotoAndPlay("half");
			}
			gotoAndPlay("begin_b2b");
		}
		
		private function onStatusHandler3(mouseevent:MouseEvent):void {
			disableButtons();
			
			Core.AudioObject.stop();
			Core.CourseObject.manualCaption("captionsID3");
			Core.AudioObject.play("media/f6_s4.mp3", true);
			Core.AudioObject.addEventListener(AudioEvent.ON_AUDIO_PLAY_COMPLETE_ASYNC, onAudioComplete, false, 0, true);
			_currentMC = "status3_mc";
			if(_selectionDictionary[_currentMC] != 1){
				status3_mc.gotoAndPlay("half");
			}
			gotoAndPlay("begin_ecom");
		}
		
		private function onStatusHandler4(mouseevent:MouseEvent):void {
			disableButtons();
			
			Core.AudioObject.stop();
			Core.CourseObject.manualCaption("captionsID4");
			Core.AudioObject.play("media/f6_s6.mp3", true);
			Core.AudioObject.addEventListener(AudioEvent.ON_AUDIO_PLAY_COMPLETE_ASYNC, onAudioComplete, false, 0, true);
			_currentMC = "status4_mc";
			if(_selectionDictionary[_currentMC] != 1){
				status4_mc.gotoAndPlay("half");
			}
			gotoAndPlay("begin_jba");
		}
		
		public function initializeWindow1():void {
			_currentPop = edi_mc;
			edi_mc.gotoAndPlay(1);
			stop();
		}
		
		public function initializeWindow2():void {
			_currentPop = b2b_mc;
			b2b_mc.gotoAndPlay(1);
			stop();
		}
		
		public function initializeWindow3():void {
			_currentPop = ecom_mc;
			ecom_mc.gotoAndPlay(1);
			stop();
		}
		
		public function initializeWindow4():void {
			_currentPop = jba_mc;
			jba_mc.gotoAndPlay(1);
			stop();
		}
		
		private function onCloseWindow(event:Event):void {
			trace("onCloseWindow***");
			
			Core.AudioObject.stop();
			play();
			_currentPop.play();
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
				case "status4_mc":
					status4_mc.gotoAndPlay("full");
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