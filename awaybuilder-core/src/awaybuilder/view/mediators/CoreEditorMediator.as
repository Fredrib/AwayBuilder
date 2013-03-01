package awaybuilder.view.mediators
{
	import flash.events.Event;
	
	import awaybuilder.events.DocumentModelEvent;
	import awaybuilder.events.EditorStateChangeEvent;
	import awaybuilder.model.IDocumentModel;
	import awaybuilder.model.ISettingsModel;
	import awaybuilder.scene.controllers.Scene3DManager;
	import awaybuilder.scene.events.Scene3DManagerEvent;
	import awaybuilder.view.components.CoreEditor;
	
	import org.robotlegs.mvcs.Mediator;

	public class CoreEditorMediator extends Mediator
	{
		[Inject]
		public var view:CoreEditor;
		
		[Inject]
		public var settings:ISettingsModel;
		
		[Inject]
		public var document:IDocumentModel;
		
		override public function onRegister():void
		{
			Scene3DManager.instance.addEventListener(Scene3DManagerEvent.READY, scene_readyHandler);
			Scene3DManager.init( view.viewPort );
//			view.scenegraph = document.scenegraph;
			
			this.eventMap.mapListener(this.eventDispatcher, DocumentModelEvent.DOCUMENT_UPDATED, eventDispatcher_documentUpdatedHandler);
			
		}
		
		protected function scene_readyHandler(event:Event):void
		{
		}	
		
		protected function eventDispatcher_documentUpdatedHandler(event:DocumentModelEvent):void
		{
			trace( "eventDispatcher_documentUpdatedHandler" );
			view.scenegraph = document.scenegraph;
		}	
		
		
	}
}