 package com.invision.client.movies 
{
	import com.greensock.TweenLite;
	import com.invision.Core;
	import com.invision.events.AudioEvent;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.getDefinitionByName;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Frame04_03_Content extends MovieClip 
	{
		
		public var infoButton1:Sprite;
		public var infoButton2:Sprite;
		public var infoButton3:Sprite;
		public var infoButton4:Sprite;
		public var infoButton5:Sprite;
		public var infoButton6:Sprite;
		public var infoButton7:Sprite;
		public var infoButton8:Sprite;
		public var infoButton9:Sprite;
		
		public var currentPopUp:Frame04_03_CloseWindow;
		
		private static var _selectionArray:Array;
		private var _currentSelection:int;
		
		public function Frame04_03_Content() {
			Core.Renderer.registerClip(this);
			
			addEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage, false, 0, true);
			if (stage) {
				initialize();
			}else{
				addEventListener(Event.ADDED_TO_STAGE, initialize, false, 0, true);
			}	
		}
		
		private function onRemoveFromStage(event:Event):void {
			trace("on removed from stage special packs intro frame7_mc");
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
			gotoAndStop(1);
			delete(this);
		}
		
		private function initialize(event:Event = null):void {
			trace("_selectionArray = " + _selectionArray);
			if(_selectionArray == null){
				_selectionArray = [0, 0, 0, 0, 0, 0, 0, 0, 0];
			}
			
		}
		
		private function checkVisited():void 
		{
			if (Core.getInstance().getScene().isVisited()) {
				_selectionArray = [2, 2, 2, 2, 2, 2, 2, 2, 2];
			}
			for (var i:int = 1; i <= _selectionArray.length; i++) {
				var currentMC:MovieClip = getChildByName("status_mc_" + (i)) as MovieClip;
				if (_selectionArray[i-1] == 1) {
					currentMC.gotoAndPlay("half");
				}else if (_selectionArray[i-1] == 2) {
					currentMC.gotoAndPlay("full");
				}
			}
			
		}
		
		public function startInteraction():void {
			// called from timeline
			Core.Renderer.onStop(this);
			addHandlers();
			checkVisited();
			stop();
		}
		
		private function addHandlers():void {
			trace("addArchHandler");
		

			infoButton1.buttonMode = true;
			infoButton1.useHandCursor = true;
			infoButton1.addEventListener(MouseEvent.MOUSE_UP, onMouseUpHandler1, false, 0, true);
			
			infoButton2.buttonMode = true;
			infoButton2.useHandCursor = true;
			infoButton2.addEventListener(MouseEvent.MOUSE_UP, onMouseUpHandler2, false, 0, true);
			
			infoButton3.buttonMode = true;
			infoButton3.useHandCursor = true;
			infoButton3.addEventListener(MouseEvent.MOUSE_UP, onMouseUpHandler3, false, 0, true);

			infoButton4.buttonMode = true;
			infoButton4.useHandCursor = true;
			infoButton4.addEventListener(MouseEvent.MOUSE_UP, onMouseUpHandler4, false, 0, true);
			
			infoButton5.buttonMode = true;
			infoButton5.useHandCursor = true;
			infoButton5.addEventListener(MouseEvent.MOUSE_UP, onMouseUpHandler5, false, 0, true);
			
			infoButton6.buttonMode = true;
			infoButton6.useHandCursor = true;
			infoButton6.addEventListener(MouseEvent.MOUSE_UP, onMouseUpHandler6, false, 0, true);
			
			infoButton7.buttonMode = true;
			infoButton7.useHandCursor = true;
			infoButton7.addEventListener(MouseEvent.MOUSE_UP, onMouseUpHandler7, false, 0, true);
			
			infoButton8.buttonMode = true;
			infoButton8.useHandCursor = true;
			infoButton8.addEventListener(MouseEvent.MOUSE_UP, onMouseUpHandler8, false, 0, true);
			
			infoButton9.buttonMode = true;
			infoButton9.useHandCursor = true;
			infoButton9.addEventListener(MouseEvent.MOUSE_UP, onMouseUpHandler9, false, 0, true);
		}
		
		private function disableArchButtons():void {
			trace("disableArchButtons");
			trace("arch1_mc called");
			infoButton1.mouseEnabled = false;
			infoButton1.mouseChildren = false;
			
			infoButton2.mouseEnabled = false;
			infoButton2.mouseChildren = false;
			
			infoButton3.mouseEnabled = false;
			infoButton3.mouseChildren = false;
		
			infoButton4.mouseEnabled = false;
			infoButton4.mouseChildren = false;
			
			infoButton5.mouseEnabled = false;
			infoButton5.mouseChildren = false;
			
			infoButton6.mouseEnabled = false;
			infoButton6.mouseChildren = false;
			
			infoButton7.mouseEnabled = false;
			infoButton7.mouseChildren = false;
			
			infoButton8.mouseEnabled = false;
			infoButton8.mouseChildren = false;
			
			infoButton9.mouseEnabled = false;
			infoButton9.mouseChildren = false;
		}
		
		private function enableArchButtons():void {
			trace("enableArchButtons");
			infoButton1.mouseEnabled = true;
			infoButton2.mouseEnabled = true;
			infoButton3.mouseEnabled = true;
			infoButton4.mouseEnabled = true;
			infoButton5.mouseEnabled = true;
			infoButton6.mouseEnabled = true;
			infoButton7.mouseEnabled = true;
			infoButton8.mouseEnabled = true;
			infoButton9.mouseEnabled = true;
		}
		
		private function addPopUpWindow(mcName:String, xPos:int, yPos:int):void {
			var libraryReference:Class = getDefinitionByName(mcName) as Class;
			currentPopUp = new libraryReference() as Frame04_03_CloseWindow;
			currentPopUp.x = xPos;
			currentPopUp.y = yPos;
			currentPopUp.name = mcName;
			currentPopUp.addEventListener(Frame04_03_CloseWindow.CLOSE_WINDOW, onCloseWindow, false, 0, true);
			this.addChild(currentPopUp);
			disableArchButtons();
		}
		
		private function onCloseWindow(event:Event):void {
			Core.AudioObject.stop();
			this.removeChild(currentPopUp);
			
			_currentSelection = 0;
			
			switch(currentPopUp.name) {
				case "popUp_arch_high":
					///TweenLite.to(arch1_mc, .5, {x:-334, scaleX:.7, scaleY:.7 } );
					break;
				case "popUp_arch_flat":
					//TweenLite.to(arch2_mc, .5, {x:-334, y:370, scaleX:.7, scaleY:.7 } );
					//TweenLite.to(status2_mc, .5, {x:233.8, y:338.45} );
					break;
				case "popUp_arch_normal":
					//TweenLite.to(arch3_mc, .5, {x:-334, y:918, scaleX:.7, scaleY:.7 } );
					//TweenLite.to(status3_mc, .5, {x:233.8, y:527.45} );
					break;
				default:
					break;
			}			
			
			currentPopUp = null;
			enableArchButtons();
			//gotoAndPlay(1);
			resetButtons();
		}
		private function resetButtons():void {


		}
		
		private function onAudioPlayComplete(event:Event):void {
			Core.AudioObject.removeEventListener(AudioEvent.ON_AUDIO_PLAY_COMPLETE_ASYNC, onAudioPlayComplete);
			if(_selectionArray[_currentSelection - 1] != 2){
				_selectionArray[_currentSelection - 1] = 2;
				var currentMC:MovieClip = getChildByName("status_mc_" + (_currentSelection)) as MovieClip;
				currentMC.gotoAndPlay("full");
			}
			checkCompletionStatus();
		}	
		
		private function checkCompletionStatus():void {
			var isCorrect:Boolean = true;
			for (var i:int = 0; i < _selectionArray.length; i++) {
				if (_selectionArray[i] != 2) {
					isCorrect = false;
					break;
				}
			}
			if (isCorrect) {
				Core.getInstance().getScene().setVisited();
				Core.Modules.updateCompletionBookmark();
			}			
		}
		
		private function checkStatus(intVal:int):void {
			trace("check status int val = " + intVal);
			if (_selectionArray[intVal-1] == 0) {
				var currentMC:MovieClip = getChildByName("status_mc_" + (intVal)) as MovieClip;
				currentMC.gotoAndPlay("half");
			}
		}
		
		private function launchWindow(intID:int, audioFileName:String, popWindow:String, xPos:int, yPos:int):void {
			var currentID:int = intID;
			if (currentID != _currentSelection) {
				_currentSelection = currentID;
				Core.AudioObject.stop();
				Core.AudioObject.play(audioFileName, true);
				Core.AudioObject.addEventListener(AudioEvent.ON_AUDIO_PLAY_COMPLETE_ASYNC, onAudioPlayComplete, false, 0, true);
				checkStatus(currentID);
				addPopUpWindow(popWindow, xPos, yPos);
				_selectionArray[_currentSelection - 1] = 1;
			}			
		}
		
		private function onMouseUpHandler1(mouseevent:MouseEvent):void {
			Core.CourseObject.manualCaption("captionsID1");
			launchWindow(1, "media/f4_s4.mp3", "popUp_store_nb_mc", 305, 37);
		}
		
		private function onMouseUpHandler2(mouseevent:MouseEvent):void {
			Core.CourseObject.manualCaption("captionsID2");
			launchWindow(2, "media/f4_s5.mp3", "popUp_runningSpecialty_mc", 305, 37);
		}
		
		private function onMouseUpHandler3(mouseevent:MouseEvent):void {
			Core.CourseObject.manualCaption("captionsID3");
			launchWindow(3, "media/f4_s6.mp3", "popUp_coreFamily_mc", 305, 37);
		}
		
		private function onMouseUpHandler4(mouseevent:MouseEvent):void {
			Core.CourseObject.manualCaption("captionsID4");
			launchWindow(4, "media/f4_s7.mp3", "popUp_all_other_specialty_mc", 305, 37);
		}
		
		private function onMouseUpHandler5(mouseevent:MouseEvent):void {
			Core.CourseObject.manualCaption("captionsID5");
			launchWindow(5, "media/f4_s8.mp3", "popUp_moderate_dept_stores_mc", 305, 37);
		}
		
		private function onMouseUpHandler6(mouseevent:MouseEvent):void {
			Core.CourseObject.manualCaption("captionsID6");
			launchWindow(6, "media/f4_s9.mp3", "popUp_shoeChains_mc", 305, 37);
		}
		
		private function onMouseUpHandler7(mouseevent:MouseEvent):void {
			Core.CourseObject.manualCaption("captionsID7");
			launchWindow(7, "media/f4_s10.mp3", "popUp_sportingGoods_mc", 305, 37);
		}
		
		private function onMouseUpHandler8(mouseevent:MouseEvent):void {
			Core.CourseObject.manualCaption("captionsID9");
			launchWindow(8, "media/f4_s12.mp3", "popUp_athletic_specialty_mc", 305, 37);
		}
		
		private function onMouseUpHandler9(mouseevent:MouseEvent):void {
			Core.CourseObject.manualCaption("captionsID8");
			launchWindow(9, "media/f4_s11.mp3", "popUp_specialty_dept_mc", 305, 37);
		}		
		
	}

}