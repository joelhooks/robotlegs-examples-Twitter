package org.robotlegs.examples.twitter.events
{
	import flash.events.Event;
	
	public class MessageListEvent extends Event
	{
		public static const MESSAGES_UPDATED:String = "messagesUpdated";
		public static const RECEIVED_FROM_SERVICE:String = "receivedFromService";
		public static const REFRESH_MESSAGES:String = "refreshMessages";

		public var messages:Array;

		public function MessageListEvent(type:String, messages:Array=null)
		{
			this.messages = messages;
			super(type, false, false);
		}
		
		override public function clone() : Event
		{
			return new MessageListEvent(type, messages);
		}
	}
}