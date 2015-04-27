 package com.invision.client.movies 
{
	import com.invision.assessment.CustomMultipleChoiceQuestion;
	import com.invision.client.components.BasicButton;
	import com.invision.Core;
	import com.invision.CoreConstants;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Dean Biele
	 */
	public class Frame07_Knoweldge_Content extends MovieClip 
	{
		private var multipleChoiceQuestion:CustomMultipleChoiceQuestion;
		
		public var radiobutton1_mc:MovieClip;
		public var radiobutton2_mc:MovieClip;
		public var radiobutton3_mc:MovieClip;
		public var radiobutton4_mc:MovieClip;
		public var btn_checkanswer:MovieClip;
		
		private var _basicbuttonCheckAnswer:BasicButton;
		
		public function Frame07_Knoweldge_Content() 
		{
			Core.Renderer.registerClip(this);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage, false, 0, true);
			if (stage) {
				initialize();
			}else{
				addEventListener(Event.ADDED_TO_STAGE, initialize, false, 0, true);
			}
		}
		
		private function onRemoveFromStage(event:Event):void {
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
			gotoAndStop(1);
			delete(this);
		}
		
		private function initialize(event:Event = null):void {
			
		}
		
		public function onStartInteraction(event:Event = null):void {
			Core.Renderer.onStop(this);
			multipleChoiceQuestion = new CustomMultipleChoiceQuestion("quiz3", CustomMultipleChoiceQuestion.EVALUATE_MOUSECLICK);
			multipleChoiceQuestion.addAnswer("answer1", radiobutton1_mc, true, 100, "That’s Incorrect.  Try Again!");
			multipleChoiceQuestion.addAnswer("answer2", radiobutton2_mc, true, 100, "That’s Correct!");
			multipleChoiceQuestion.addAnswer("answer3", radiobutton3_mc, true, 100, "That’s Incorrect.  Try Again!");
			multipleChoiceQuestion.addAnswer("answer4", radiobutton4_mc, true, 100, "That’s Incorrect.  Try Again!");
			multipleChoiceQuestion.initialize(CustomMultipleChoiceQuestion.SELECTION_MULTIPLE);
			
			//multipleChoiceQuestion.addEventListener(CustomMultipleChoiceQuestion.EVALUATE_MOUSECLICK, onMouseUpCheckAnswer, false, 0, true);
			addCheckAnswer(btn_checkanswer);
			stop();
		}
		
		private function addCheckAnswer(answerMC:MovieClip):void {
			_basicbuttonCheckAnswer = new BasicButton("checkanswer", answerMC);
			_basicbuttonCheckAnswer.addEventListener(MouseEvent.MOUSE_UP, onMouseUpCheckAnswer, false, 0, true);
		}	
		
		private function onMouseUpCheckAnswer(event:Event):void {
			if (multipleChoiceQuestion.isCorrect()) {
				// answer is correct.
				trace("onMouseUpCheckAnswer");
				gotoAndStop("correct");
				Core.getInstance().getScene().setVisited();
				Core.Modules.updateCompletionBookmark();
			}else {
				//answer is incorrect.
				gotoAndStop("incorrect");
			}
		}
		
	}

}