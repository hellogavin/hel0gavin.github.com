package com.view.menu
{
	/**
	 * <p>Description: </p>
	 * <ul>
	 * <li>Created time：2013-6-26 下午2:40:57 </li>
	 * <li>Version 1.0.0</li>
	 * <li>E-mail: hellogavin1988#gmail.com</li>
	 * </ul>
	 * @author zhengxuesong
	 * */ 
	import com.event.CustomEvent;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	public class InitFace extends Sprite
	{
		private var _openOneFile:TextField;
		
		private var _openMutiFiles:TextField;
		
		private var _openFolderFiles:TextField;
		public function InitFace()
		{
			initText();
			initHandlers();
		}
		
		private function initHandlers():void
		{
			_openOneFile.addEventListener(MouseEvent.CLICK,clickOne);
		}
		
		protected function clickOne(event:MouseEvent):void
		{
			Global.getInstance().viewContainer.dispatchEvent(new CustomEvent(CustomEvent.OPEN_ONE_FILE_CLICK));
		}
		
		private function initText():void
		{
			_openOneFile=createText(50,200,"<a href='event:'>Open a picture</a>");
			_openMutiFiles=createText(200,200,"<a href='event:'>Open Muti pictures</a>");
			_openFolderFiles=createText(350,200,"<a href='event:'>Open folder pictures</a>");
		}
		
		private function createText($x:int,$y:int,text:String):TextField
		{
			var target:TextField=new TextField();
			target.htmlText=text;
			target.x=$x;
			target.y=$y;
			this.addChild(target);
			return target;
		}
	}
} 