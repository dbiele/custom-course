package com.invision.client.movies 
{
	import com.invision.Core;
	import com.invision.interfaces.ISequence;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Dean Biele 
	 */
	public class Frame11_Content extends MovieClip
	{
		
		public var radiobutton1_mc:MovieClip;
		public var radiobutton2_mc:MovieClip;
		public var radiobutton3_mc:MovieClip;
		
		private var _selectionDictionary:Dictionary;
		private var _selectedJobRole:int;
		
		public function Frame11_Content() 
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
			radiobutton1_mc.removeEventListener(MouseEvent.MOUSE_UP, onStatusHandler1);
			radiobutton2_mc.removeEventListener(MouseEvent.MOUSE_UP, onStatusHandler2);
			radiobutton3_mc.removeEventListener(MouseEvent.MOUSE_UP, onStatusHandler3);
			gotoAndStop(1);
			delete(this);
		}
		
		private function enableButtons():void {
			radiobutton1_mc.mouseEnabled = true;
			radiobutton2_mc.mouseEnabled = true;
			radiobutton3_mc.mouseEnabled = true;
		}
		
		private function disableButtons():void {
			radiobutton1_mc.mouseEnabled = false;
			radiobutton1_mc.mouseChildren = false;
			radiobutton2_mc.mouseEnabled = false;
			radiobutton2_mc.mouseChildren = false;
			radiobutton3_mc.mouseEnabled = false;
			radiobutton3_mc.mouseChildren = false;
		}	
		
		private function initialize(event:Event = null):void {
			onStartInteraction();
		}	
		
		public function onStartInteraction(event:Event = null):void {
			initData();
			addMainMenuHandlers();
			stop();
		}
		
		private function initData():void {
			_selectionDictionary = new Dictionary();
		}
		
		private function addMainMenuHandlers():void {
			
			radiobutton1_mc.buttonMode = true;
			radiobutton1_mc.useHandCursor = true;
			radiobutton1_mc.addEventListener(MouseEvent.MOUSE_UP, onStatusHandler1, false, 0, true);			
			
			radiobutton2_mc.buttonMode = true;
			radiobutton2_mc.useHandCursor = true;
			radiobutton2_mc.addEventListener(MouseEvent.MOUSE_UP, onStatusHandler2, false, 0, true);
			
			radiobutton3_mc.buttonMode = true;
			radiobutton3_mc.useHandCursor = true;
			radiobutton3_mc.addEventListener(MouseEvent.MOUSE_UP, onStatusHandler3, false, 0, true);
		}
		
		private function resetButtons():void {
			radiobutton1_mc.gotoAndStop(1);
			radiobutton2_mc.gotoAndStop(1);
			radiobutton3_mc.gotoAndStop(1);
		}
		
		private function reconfigureScene(id:int):void {
			//sequence6
			//subsequence5
			var baseSequence:ISequence = Core.Modules.getSequence("sequence6");
			baseSequence.remove("scene11_ASR_1");
			baseSequence.remove("scene11_ASR_2");
			baseSequence.remove("scene11_ASR_3");
			baseSequence.remove("scene11_ASR_4");
			baseSequence.remove("scene11_ASR_5");
			baseSequence.remove("scene11_ASR_6");
			baseSequence.remove("scene11_ASR_7");
			
			baseSequence.remove("scene11_NAS_1");
			baseSequence.remove("scene11_NAS_2");
			baseSequence.remove("scene11_NAS_3");
			baseSequence.remove("scene11_NAS_4");
			baseSequence.remove("scene11_NAS_5");
			baseSequence.remove("scene11_NAS_6");
			baseSequence.remove("scene11_NAS_7");
			
			baseSequence.remove("scene11_SR_1");
			baseSequence.remove("scene11_SR_2");
			baseSequence.remove("scene11_SR_3");
			baseSequence.remove("scene11_SR_4");
			baseSequence.remove("scene11_SR_5");
			baseSequence.remove("scene11_SR_6");
			baseSequence.remove("scene11_SR_7");
			baseSequence.remove("scene11_SR_8");
			baseSequence.remove("scene11_SR_9");
			baseSequence.remove("scene11_SR_10");
			
			baseSequence.getSequence("subsequence5").remove("scene11_ASR_1");
			baseSequence.getSequence("subsequence5").remove("scene11_ASR_2");
			baseSequence.getSequence("subsequence5").remove("scene11_ASR_3");
			baseSequence.getSequence("subsequence5").remove("scene11_ASR_4");
			baseSequence.getSequence("subsequence5").remove("scene11_ASR_5");			
			baseSequence.getSequence("subsequence5").remove("scene11_ASR_6");
			baseSequence.getSequence("subsequence5").remove("scene11_ASR_7");
			
			baseSequence.getSequence("subsequence5").remove("scene11_NAS_1");
			baseSequence.getSequence("subsequence5").remove("scene11_NAS_2");
			baseSequence.getSequence("subsequence5").remove("scene11_NAS_3");
			baseSequence.getSequence("subsequence5").remove("scene11_NAS_4");
			baseSequence.getSequence("subsequence5").remove("scene11_NAS_5");
			baseSequence.getSequence("subsequence5").remove("scene11_NAS_6");
			baseSequence.getSequence("subsequence5").remove("scene11_NAS_7");
			
			baseSequence.getSequence("subsequence5").remove("scene11_SR_1");
			baseSequence.getSequence("subsequence5").remove("scene11_SR_2");
			baseSequence.getSequence("subsequence5").remove("scene11_SR_3");
			baseSequence.getSequence("subsequence5").remove("scene11_SR_4");
			baseSequence.getSequence("subsequence5").remove("scene11_SR_5");
			baseSequence.getSequence("subsequence5").remove("scene11_SR_6");
			baseSequence.getSequence("subsequence5").remove("scene11_SR_7");
			baseSequence.getSequence("subsequence5").remove("scene11_SR_8");
			baseSequence.getSequence("subsequence5").remove("scene11_SR_9");
			baseSequence.getSequence("subsequence5").remove("scene11_SR_10");
			
			switch(id) {
				case 1:
					baseSequence.getSequence("subsequence5").add("scene11_ASR_1");
					baseSequence.getSequence("subsequence5").add("scene11_ASR_2");
					baseSequence.getSequence("subsequence5").add("scene11_ASR_3");
					baseSequence.getSequence("subsequence5").add("scene11_ASR_4");
					baseSequence.getSequence("subsequence5").add("scene11_ASR_5");
					baseSequence.getSequence("subsequence5").add("scene11_ASR_6");
					baseSequence.getSequence("subsequence5").add("scene11_ASR_7");
					baseSequence.add("scene11_ASR_1");
					baseSequence.add("scene11_ASR_2");
					baseSequence.add("scene11_ASR_3");
					baseSequence.add("scene11_ASR_4");
					baseSequence.add("scene11_ASR_5");
					baseSequence.add("scene11_ASR_6");
					baseSequence.add("scene11_ASR_7");
					break;
				case 2:
					trace("reconfigure 2");
					
					baseSequence.getSequence("subsequence5").add("scene11_NAS_1");
					baseSequence.getSequence("subsequence5").add("scene11_NAS_2");
					baseSequence.getSequence("subsequence5").add("scene11_NAS_3");
					baseSequence.getSequence("subsequence5").add("scene11_NAS_4");
					baseSequence.getSequence("subsequence5").add("scene11_NAS_5");
					baseSequence.getSequence("subsequence5").add("scene11_NAS_6");
					baseSequence.getSequence("subsequence5").add("scene11_NAS_7");
					baseSequence.add("scene11_NAS_1");
					baseSequence.add("scene11_NAS_2");
					baseSequence.add("scene11_NAS_3");
					baseSequence.add("scene11_NAS_4");
					baseSequence.add("scene11_NAS_5");
					baseSequence.add("scene11_NAS_6");
					baseSequence.add("scene11_NAS_7");
					break;
				case 3:
					baseSequence.getSequence("subsequence5").add("scene11_SR_1");
					baseSequence.getSequence("subsequence5").add("scene11_SR_2");
					baseSequence.getSequence("subsequence5").add("scene11_SR_3");
					baseSequence.getSequence("subsequence5").add("scene11_SR_4");
					baseSequence.getSequence("subsequence5").add("scene11_SR_5");
					baseSequence.getSequence("subsequence5").add("scene11_SR_6");
					baseSequence.getSequence("subsequence5").add("scene11_SR_7");
					baseSequence.getSequence("subsequence5").add("scene11_SR_8");
					baseSequence.getSequence("subsequence5").add("scene11_SR_9");
					baseSequence.getSequence("subsequence5").add("scene11_SR_10");
					baseSequence.add("scene11_SR_1");
					baseSequence.add("scene11_SR_2");
					baseSequence.add("scene11_SR_3");
					baseSequence.add("scene11_SR_4");
					baseSequence.add("scene11_SR_5");
					baseSequence.add("scene11_SR_6");
					baseSequence.add("scene11_SR_7");
					baseSequence.add("scene11_SR_8");
					baseSequence.add("scene11_SR_9");
					baseSequence.add("scene11_SR_10");
					break;
			}
		}
		
		private function enableNextButton():void {
			Core.getInstance().getScene().setVisited();
			Core.Modules.updateCompletionBookmark();
		}
		
		private function onStatusHandler1(mouseevent:MouseEvent):void {
			_selectedJobRole = 1;
			resetButtons();
			radiobutton1_mc.gotoAndStop(2);
			reconfigureScene(1);
			enableNextButton();
		}
		
		private function onStatusHandler2(mouseevent:MouseEvent):void {
			_selectedJobRole = 2;
			resetButtons();
			radiobutton2_mc.gotoAndStop(2);
			reconfigureScene(2);
			enableNextButton();
		}
		
		private function onStatusHandler3(mouseevent:MouseEvent):void {
			_selectedJobRole = 3;
			resetButtons();
			radiobutton3_mc.gotoAndStop(2);
			reconfigureScene(3);
			enableNextButton();
		}		
	}

}