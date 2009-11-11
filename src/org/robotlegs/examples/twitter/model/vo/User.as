package org.robotlegs.examples.twitter.model.vo
{
	import flash.events.EventDispatcher;
	
	[Bindable]
	public class User extends EventDispatcher
	{
		public var fullname:String;
		public var displayName:String;
		public var password:String;
		public var avatarURL:String;
		public var url:String;
		
		public function User()
		{
		}
	}
}