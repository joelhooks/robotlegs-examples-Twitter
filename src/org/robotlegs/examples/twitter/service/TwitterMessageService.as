package org.robotlegs.examples.twitter.service
{
	import com.swfjunkie.tweetr.Tweetr;
	import com.swfjunkie.tweetr.data.objects.StatusData;
	import com.swfjunkie.tweetr.events.TweetEvent;
	
	import org.robotlegs.examples.twitter.events.MessageListEvent;
	import org.robotlegs.examples.twitter.model.vo.Message;
	import org.robotlegs.examples.twitter.model.vo.User;
	import org.robotlegs.mvcs.Actor;
	
	public class TwitterMessageService extends Actor
	{
		private var service:Tweetr;
		private var last_id:Number;
		public function TwitterMessageService()
		{
			service = new Tweetr();
			service.useAuthHeaders = true;
			service.addEventListener(TweetEvent.COMPLETE, handleMessagesReceived);
			
			last_id = 1;
		}
		
		public function setCredentials(username:String, password:String):void
		{
			service.username = username;
			service.password = password;
		}
		
		public function getMessages():void
		{
			service.getFriendsTimeLine(String(last_id));
		}
		
		public function sendMessage(message:Message):void
		{
			service.sendTweet( message.text );
		}
		
		private function handleMessagesReceived(event:TweetEvent):void
		{
			var messages:Array=[];
			var message:Message;
			var user:User;
			
			for each (var update:StatusData in event.responseArray)
			{
				if (update.id == 0)
					continue;
				if (update.id > last_id)
					last_id=update.id;
				
				message=new Message();
				user=new User();
				message.user=user;
				message.text=update.text;
				message.id=update.id;
				user.displayName=update.user.screenName;
				user.fullname=update.user.name;
				user.avatarURL=update.user.profileImageUrl;
				user.url=update.user.url;
				messages.push(message);
			}
			
			dispatch(new MessageListEvent(MessageListEvent.RECEIVED_FROM_SERVICE, messages));
		}
	}
}