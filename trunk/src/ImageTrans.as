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
	import com.component.Menu;
	import com.event.CustomEvent;
	import com.reference.file.jpg.JPGEncoder;
	
	import flash.desktop.NativeApplication;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.FileReference;
	import flash.utils.ByteArray;
	
	public class ImageTrans extends Sprite
	{
		private var loaders:Loader;
		private var file1:FileReference;

		private var bmd:BitmapData;

		private var menu:Menu;
		public function ImageTrans()
		{
			var loader:Loader=new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,loadComplete);
			initView();
			initHandles();
		}
		
		private function initView():void
		{
			menu=new Menu("UIConfig.xml");
			
		}
		
		private function initHandles():void
		{
			menu.addEventListener(CustomEvent.SELECT_ITEM,selectedItem);
			menu.addEventListener(CustomEvent.CREATE_MENU_FINISH,createMenuFinish);
		}
		
		protected function createMenuFinish(event:Event):void
		{
			menu.removeEventListener(CustomEvent.CREATE_MENU_FINISH,createMenuFinish);
			stage.nativeWindow.menu = menu.nativeMenu;
		}
		
		protected function selectedItem(event:CustomEvent):void
		{
			trace(menu.selectIedtem+"  selectedItem");
			switch(menu.selectIedtem)
			{
				case "Open":
					openFile();
					break;
				case "Save":
					saveFile();
					break;
				case "Exit":
					NativeApplication.nativeApplication.icon.bitmaps = [];
					NativeApplication.nativeApplication.exit();
					break;
			}
		}
		
		protected function saveFile():void
		{
			var j:JPGEncoder=new JPGEncoder();
			var byte:ByteArray=j.encode(bmd);
			var file:FileReference=new FileReference();
			file.save(byte,"asdf.jpg");
		}
		
		protected function selectItem(event:Event):void
		{
			file1=FileReference(event.target);
			file1.load();
			file1.addEventListener(Event.COMPLETE,onComplete);
			
		}
		
		protected function onComplete(event:Event):void
		{
			loaders=new Loader();
			loaders.contentLoaderInfo.addEventListener(Event.COMPLETE,loadBytesComplete);
			loaders.loadBytes(file1.data);
		}
		
		protected function loadBytesComplete(event:Event):void
		{
			var bmd:BitmapData=event.target.content.bitmapData;
			var bmp:Bitmap=new Bitmap(bmd);
			this.addChild(bmp);
		}
		
		protected function openFile():void
		{
			var file:FileReference=new FileReference();
			if(file.browse())
			{
				trace(file.data);
			}
			file.addEventListener(Event.SELECT,selectItem);
		}		
	
		protected function loadComplete(event:Event):void
		{
			bmd=event.target.content.bitmapData;
		}
	}
} 