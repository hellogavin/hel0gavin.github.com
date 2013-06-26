package
{
	/**
	 * <p>Description: </p>
	 * <ul>
	 * <li>Created time：2013-6-24 下午4:49:42 </li>
	 * <li>Version 1.0.0</li>
	 * <li>E-mail: hellogavin1988#gmail.com</li>
	 * </ul>
	 * @author zhengxuesong
	 * */ 
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	
	[SWF(width="900" height="600")]
	public class ImageTrans extends Sprite
	{

		public function ImageTrans()
		{
			stage.scaleMode=StageScaleMode.NO_SCALE;
			Global.getInstance().initGlobal();
			this.addChild(Global.getInstance().viewContainer);
		}
		
	}
} 