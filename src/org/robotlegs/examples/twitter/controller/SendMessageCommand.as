package org.robotlegs.examples.twitter.controller
{
	import org.robotlegs.examples.twitter.events.MessageEvent;
	import org.robotlegs.examples.twitter.service.TwitterMessageService;
	import org.robotlegs.mvcs.Command;
	
	public class SendMessageCommand extends Command
	{
		[Inject]
		public var event:MessageEvent;
		
		[Inject]
		public var service:TwitterMessageService;
		
		override public function execute():void
		{
			service.sendMessage( event.message );
		}
	}
}