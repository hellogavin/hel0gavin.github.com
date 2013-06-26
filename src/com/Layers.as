package com
{
	/**
	 * <p>Description: </p>
	 * <ul>
	 * <li>Created time：2013-6-26 下午2:58:14 </li>
	 * <li>Version 1.0.0</li>
	 * <li>E-mail: hellogavin1988#gmail.com</li>
	 * </ul>
	 * @author zhengxuesong
	 * */ 
	import flash.display.Sprite;
	
	public class Layers extends Sprite
	{
		public static const totalLayers:int=4; 
		public static const layer0:int=0;
		public static const layer1:int=0;
		public static const layer2:int=0;
		public static const layer3:int=0;
		
		private var _bgContainer:Sprite;
		private var _imgContainer:Sprite;
		private var _container2:Sprite;
		private var _container3:Sprite;
		public function Layers()
		{
			initContainer();
		}
		
		private function initContainer():void
		{
			_bgContainer=new Sprite();
			this.addChild(_bgContainer);
			
			_imgContainer=new Sprite();
			this.addChild(_imgContainer);
			
		}		
		
		public function get container0():Sprite
		{
			return _bgContainer;
		}
		
		public function get imgContainer():Sprite
		{
			return _imgContainer;
		}
	}
} 