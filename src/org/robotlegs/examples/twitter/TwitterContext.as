package org.robotlegs.examples.twitter
{
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.examples.twitter.controller.LoginUserCommand;
	import org.robotlegs.examples.twitter.controller.RefreshMessagesCommand;
	import org.robotlegs.examples.twitter.controller.SendMessageCommand;
	import org.robotlegs.examples.twitter.events.MessageEvent;
	import org.robotlegs.examples.twitter.events.MessageListEvent;
	import org.robotlegs.examples.twitter.events.UserEvent;
	import org.robotlegs.examples.twitter.service.TwitterMessageService;
	import org.robotlegs.examples.twitter.view.components.MessageView;
	import org.robotlegs.examples.twitter.view.components.RefreshButton;
	import org.robotlegs.examples.twitter.view.mediators.ApplicationMediator;
	import org.robotlegs.examples.twitter.view.mediators.MessageViewMediator;
	import org.robotlegs.examples.twitter.view.mediators.RefreshButtonMediator;
	import org.robotlegs.mvcs.Context;
	
	public class TwitterContext extends Context
	{
		public function TwitterContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void
		{
			mediatorMap.mapView( TwitterClient, ApplicationMediator );
			mediatorMap.mapView( MessageView, MessageViewMediator );
			mediatorMap.mapView( RefreshButton, RefreshButtonMediator );
			
			commandMap.mapEvent( UserEvent.LOGIN_USER, LoginUserCommand );
			commandMap.mapEvent( MessageListEvent.REFRESH_MESSAGES, RefreshMessagesCommand );
			commandMap.mapEvent( MessageEvent.SEND_MESSAGE, SendMessageCommand );
			
			injector.mapSingleton( TwitterMessageService );
		}
	}
}