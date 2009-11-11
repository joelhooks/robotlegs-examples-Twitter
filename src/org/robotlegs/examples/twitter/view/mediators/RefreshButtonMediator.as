package org.robotlegs.examples.twitter.view.mediators
{
	import org.robotlegs.examples.twitter.events.MessageListEvent;
	import org.robotlegs.examples.twitter.view.components.RefreshButton;
	import org.robotlegs.mvcs.Mediator;
	
	public class RefreshButtonMediator extends Mediator
	{
		[Inject]
		public var view:RefreshButton;
		
		public function RefreshButtonMediator()
		{
		}
		
		override public function onRegister():void
		{
			eventMap.mapListener( view, MessageListEvent.REFRESH_MESSAGES, dispatch );
			eventMap.mapListener( eventDispatcher, MessageListEvent.RECEIVED_FROM_SERVICE, handleMessagesReceived )
		}
		
		private function handleMessagesReceived(event:MessageListEvent):void
		{
			view.enabled = true
		}
	}
}