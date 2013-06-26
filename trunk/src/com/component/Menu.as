package com.component
{
	import com.event.CustomEvent;
	
	import flash.display.NativeMenu;
	import flash.display.NativeMenuItem;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import mx.utils.StringUtil;

	/**
	 * <p>Description: </p>
	 * <ul>
	 * <li>Created time：2013-6-25 下午1:51:22 </li>
	 * <li>Version 1.0.0</li>
	 * <li>E-mail: hellogavin1988#gmail.com</li>
	 * </ul>
	 * @author zhengxuesong
	 * */
	public class Menu extends Sprite
	{
		private var _nativeMenu:NativeMenu;
		private var _url:String;
		private var _urlLoader:URLLoader;
		private var _itemVector:Vector.<NativeMenuItem>;
		private var _selectedItem:String;

		public function Menu($xmlUrl:String)
		{
			_url = $xmlUrl;
			_itemVector=new Vector.<NativeMenuItem>();
			loadXML();
		}

		private function loadXML():void
		{
			_urlLoader = new URLLoader();
			_urlLoader.addEventListener(Event.COMPLETE, loadXMLComplete);
			_urlLoader.load(new URLRequest(_url));
		}

		protected function loadXMLComplete(event:Event):void
		{
			var xml:XML = XML(event.target.data);
			var xmlList:XMLList = xml.appMenu.menu;
			initMenu(xmlList);
			configureListeners();
		}
		
		private function configureListeners():void
		{
			for(var i:int=0;i<_itemVector.length;i++)
			{
				_itemVector[i].addEventListener(Event.SELECT,selectItem);
			}
		}
		
		private function selectItem(event:Event):void
		{
			_selectedItem=event.target.label;
			dispatchEvent(new CustomEvent(CustomEvent.SELECT_ITEM));
		}
		
		private function initMenu(xmlData:XMLList):void
		{
			_nativeMenu = new NativeMenu();
			for each (var obj:XML in xmlData)
			{
				_nativeMenu.addItem(createSubMenu(obj));
			}
			dispatchEvent(new CustomEvent(CustomEvent.CREATE_MENU_FINISH));
		}

		private function createSubMenu(xml:XML):NativeMenuItem
		{
			var subMenu:NativeMenu = new NativeMenu();
			var menuItem:NativeMenuItem = new NativeMenuItem(xml.@text);
			menuItem.mnemonicIndex=0;
			for each (var obj:XML in xml.subMenu)
			{
				var item:NativeMenuItem = new NativeMenuItem(obj.@text);
				item.mnemonicIndex=0;
				subMenu.addItem(item);item.keyEquivalent=item.label.substr(0,1);
				_itemVector.push(item);
				if(obj.@text=="Save")
				{
					item=new NativeMenuItem("",true);
					subMenu.addItem(item);
				}
			}
			menuItem.submenu = subMenu;
			return menuItem;
		}

		public function get nativeMenu():NativeMenu
		{
			return _nativeMenu;
		}
		
		public function get selectIedtem():String
		{
			return _selectedItem;
		}
	}
}
