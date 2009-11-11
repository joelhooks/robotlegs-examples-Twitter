package org.robotlegs.examples.twitter.controller
{
	import org.robotlegs.examples.twitter.service.TwitterMessageService;
	import org.robotlegs.mvcs.Command;
	
	public class RefreshMessagesCommand extends Command
	{
		[Inject]
		public var service:TwitterMessageService;
		
		override public function execute():void
		{
			service.getMessages();
		}
	}
}