package com.handlers
{
	import com.event.CustomEvent;
	import com.reference.file.jpg.JPGEncoder;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.FileReference;
	import flash.utils.ByteArray;

	/**
	 * <p>Description: </p>
	 * <ul>
	 * <li>Created time：2013-6-26 下午2:51:57 </li>
	 * <li>Version 1.0.0</li>
	 * <li>E-mail: hellogavin1988#gmail.com</li>
	 * </ul>
	 * @author zhengxuesong
	 * */ 
	public class FileHandler
	{
		
		private var _fileRef:FileReference;
		
		public function FileHandler()
		{
		}
		
		public function register():void
		{
			Global.getInstance().viewContainer.addEventListener(CustomEvent.OPEN_ONE_FILE_CLICK,openFile);
			Global.getInstance().viewContainer.addEventListener(CustomEvent.SAVE_FILE,saveFile);
		}
		
		protected function saveFile(event:Event):void
		{
			var j:JPGEncoder = new JPGEncoder();
			var byte:ByteArray = j.encode(Global.getInstance().viewContainer.bmp);
			var file:FileReference = new FileReference();
			var arr:Array=_fileRef.name.split(".");
			file.save(byte, arr[0]+".jpg");
		}
		
		protected function selectItem(event:Event):void
		{
			_fileRef = FileReference(event.target);
			_fileRef.addEventListener(Event.COMPLETE, onComplete);
			_fileRef.load();
		}
		
		protected function onComplete(event:Event):void
		{
			Global.getInstance().viewContainer.dispatchEvent(new CustomEvent(CustomEvent.LOADED_FILE));
		}
		
		protected function openFile(event:CustomEvent):void
		{
			var file:FileReference = new FileReference();
			file.addEventListener(Event.SELECT, selectItem);
			file.browse();
		}
		
		public function get fileRef():FileReference
		{
			return _fileRef;
		}
	}
} 