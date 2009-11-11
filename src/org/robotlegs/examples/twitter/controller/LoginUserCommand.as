package org.robotlegs.examples.twitter.controller
{
	import org.robotlegs.examples.twitter.events.UserEvent;
	import org.robotlegs.examples.twitter.service.TwitterMessageService;
	import org.robotlegs.mvcs.Command;
	
	public class LoginUserCommand extends Command
	{
		[Inject]
		public var event:UserEvent;
		
		[Inject]
		public var service:TwitterMessageService;
		
		override public function execute():void
		{
			service.setCredentials( event.user.displayName, event.user.password );
			service.getMessages();
		}
	}
}