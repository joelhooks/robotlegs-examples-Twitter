package org.robotlegs.examples.twitter.events
{
	import flash.events.Event;
	
	import org.robotlegs.examples.twitter.model.vo.User;
	
	public class UserEvent extends Event
	{
		public static const LOGIN_USER:String = "loginUser";
		
		public var user:User;
		
		public function UserEvent(type:String, user:User=null)
		{
			this.user = user;
			super(type, false, false);
		}
		
		override public function clone() : Event
		{
			return new UserEvent(type, user);
		}
	}
}