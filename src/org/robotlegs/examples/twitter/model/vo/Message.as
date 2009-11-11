package org.robotlegs.examples.twitter.model.vo
{
	import flash.events.EventDispatcher;
	
	[Bindable]
	public class Message extends EventDispatcher
	{
		public var text:String;
		public var id:Number;
		public var user:User;
		
		public function Message()
		{
		}
	}
}