package com.container
{
	/**
	 * <p>Description: </p>
	 * <ul>
	 * <li>Created time：2013-6-26 下午3:38:16 </li>
	 * <li>Version 1.0.0</li>
	 * <li>E-mail: hellogavin1988#gmail.com</li>
	 * </ul>
	 * @author zhengxuesong
	 * */
	import com.Layers;
	import com.event.CustomEvent;
	import com.view.menu.InitFace;
	import com.view.menu.TopMenu;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;

	public class ViewContainer extends Sprite
	{
		private var _layer:Layers;
		private var _loaders:Loader;
		private var _bmd:BitmapData;

		public function ViewContainer()
		{
			initContainer();
			initHandle();
		}

		private function initHandle():void
		{
			this.addEventListener(CustomEvent.LOADED_FILE, loadedFile);
		}

		protected function loadedFile(event:Event):void
		{
			_loaders = new Loader();
			_loaders.contentLoaderInfo.addEventListener(Event.COMPLETE, loadBytesComplete);
			_loaders.loadBytes(Global.getInstance().file.fileRef.data);
		}

		protected function loadBytesComplete(event:Event):void
		{
			_bmd = event.target.content.bitmapData;
			var bmp:Bitmap = new Bitmap(_bmd);
			layer.imgContainer.addChild(bmp);
		}

		protected function loadComplete(event:Event):void
		{
			_bmd = event.target.content.bitmapData;
		}

		private function initContainer():void
		{
			_layer = new Layers();
			this.addChild(_layer);
			_layer.container0.addChild(new TopMenu());
			_layer.container0.addChild(new InitFace());
		}

		public function get layer():Layers
		{
			return _layer;
		}

		public function get bmp():BitmapData
		{
			return _bmd;
		}
	}
}
