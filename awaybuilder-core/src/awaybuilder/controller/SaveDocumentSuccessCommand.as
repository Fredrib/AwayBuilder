package awaybuilder.controller
{
	import flash.events.Event;
	
	import awaybuilder.controller.events.SaveDocumentEvent;
	import awaybuilder.model.IDocumentModel;
	import awaybuilder.model.IDocumentModel;
	import awaybuilder.model.WindowModel;

	import org.robotlegs.mvcs.Command;
	
	public class SaveDocumentSuccessCommand extends Command
	{
		[Inject]
		public var event:SaveDocumentEvent;
		
		[Inject]
		public var documentModel:IDocumentModel;

		[Inject]
		public var windowModel:WindowModel;
		
		override public function execute():void
		{
			this.documentModel.name = this.event.name;
			this.documentModel.path = this.event.path;
			this.documentModel.edited = false;
			
			if(this.windowModel.savedNextEvent)
			{
				var nextEvent:Event = this.windowModel.savedNextEvent;
				this.windowModel.savedNextEvent = null;
				this.dispatch(nextEvent);
			}
		}
	}
}