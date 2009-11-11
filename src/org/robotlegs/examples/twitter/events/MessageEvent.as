package org.robotlegs.examples.twitter.events
{
	import flash.events.Event;
	
	import org.robotlegs.examples.twitter.model.vo.Message;
	
	public class MessageEvent extends Event
	{
		public static const SEND_MESSAGE:String = "sendMessage";
		
		public var message:Message;
		
		public function MessageEvent(type:String, message:Message=null)
		{
			this.message = message;
			super(type, false, false);
		}
		
		override public function clone() : Event
		{
			return new MessageEvent(type, message);
		}
	}
}