package awaybuilder.model.vo
{
	import mx.collections.ArrayCollection;
	import awaybuilder.model.vo.scene.AssetVO;
	
	[Bindable]
	public class ScenegraphItemVO
	{
		
		public function ScenegraphItemVO( label:String, item:AssetVO )
		{
			this.label = label;
			this.item = item;
		}
		
		public var label:String;
		
		public var item:AssetVO;
		
		public var children:ArrayCollection;
		
	}
}