package awaybuilder.controller.scene
{
    import awaybuilder.controller.scene.events.SceneEvent;
    import awaybuilder.controller.history.HistoryCommandBase;
    import awaybuilder.model.IDocumentModel;
    import awaybuilder.model.vo.scene.MeshVO;

    import flash.geom.Vector3D;

    public class TranslateObjectCommand extends HistoryCommandBase
    {
        [Inject]
        public var event:SceneEvent;

        [Inject]
        public var document:IDocumentModel;

        override public function execute():void
        {
            var vector:Vector3D = event.newValue as Vector3D;
            var vo:MeshVO = event.items[0] as MeshVO;

			if( !event.oldValue ) {
				event.oldValue = new Vector3D( vo.x, vo.y, vo.z );
			}
			
            vo.x = vector.x;
            vo.y = vector.y;
            vo.z = vector.z;

            vo.linkedObject.x = vector.x;
            vo.linkedObject.y = vector.y;
            vo.linkedObject.z = vector.z;

            addToHistory( event );
        }
    }
}