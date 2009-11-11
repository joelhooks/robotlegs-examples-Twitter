package org.robotlegs.examples.twitter.view.mediators
{
	import org.robotlegs.examples.twitter.events.MessageListEvent;
	import org.robotlegs.examples.twitter.events.UserEvent;
	import org.robotlegs.mvcs.Mediator;
	
	public class ApplicationMediator extends Mediator
	{
		[Inject]
		public var view:TwitterClient;
		
		public function ApplicationMediator()
		{
		}
		
		override public function onRegister():void
		{
			eventMap.mapListener( view, UserEvent.LOGIN_USER, dispatch );
			eventMap.mapListener( eventDispatcher, MessageListEvent.RECEIVED_FROM_SERVICE, handleMessagesReceived )
		}
		
		private function handleMessagesReceived(event:MessageListEvent):void
		{
			view.currentState = TwitterClient.APPLICATION_STATE_VIEW_MESSAGES;
		}
	}
}