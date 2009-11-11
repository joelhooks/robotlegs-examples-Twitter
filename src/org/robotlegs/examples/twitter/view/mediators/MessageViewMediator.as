package org.robotlegs.examples.twitter.view.mediators
{
	import org.robotlegs.examples.twitter.events.MessageEvent;
	import org.robotlegs.examples.twitter.events.MessageListEvent;
	import org.robotlegs.examples.twitter.view.components.MessageView;
	import org.robotlegs.mvcs.Mediator;
	
	public class MessageViewMediator extends Mediator
	{
		[Inject]
		public var view:MessageView;
		
		public function MessageViewMediator()
		{
		}
		
		override public function onRegister():void
		{
			eventMap.mapListener( eventDispatcher, MessageListEvent.RECEIVED_FROM_SERVICE, handleMessagesReceived );
			eventMap.mapListener( view, MessageEvent.SEND_MESSAGE, dispatch );
			
		}
		
		private function handleMessagesReceived(event:MessageListEvent):void
		{
			view.addMessages( event.messages );
		}
	}
}