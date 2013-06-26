package com.view.menu
{
	/**
	 * <p>Description: </p>
	 * <ul>
	 * <li>Created time：2013-6-25 下午5:35:06 </li>
	 * <li>Version 1.0.0</li>
	 * <li>E-mail: hellogavin1988#gmail.com</li>
	 * </ul>
	 * @author zhengxuesong
	 * */
	import com.component.Menu;
	import com.event.CustomEvent;
	
	import flash.desktop.NativeApplication;
	import flash.display.Sprite;
	import flash.events.Event;

	public class TopMenu extends Sprite
	{
		private var _menu:Menu;

		public function TopMenu()
		{
			intiMenu();
			initHandlers();
		}

		private function initHandlers():void
		{
			_menu.addEventListener(CustomEvent.SELECT_ITEM, selectedItem);
			_menu.addEventListener(CustomEvent.CREATE_MENU_FINISH, createMenuFinish);
		}

		protected function createMenuFinish(event:Event):void
		{
			_menu.removeEventListener(CustomEvent.CREATE_MENU_FINISH, createMenuFinish);
			stage.nativeWindow.menu = _menu.nativeMenu;
		}

		protected function selectedItem(event:CustomEvent):void
		{
			switch (_menu.selectIedtem)
			{
				case "Open":
					Global.getInstance().viewContainer.dispatchEvent(new CustomEvent(CustomEvent.OPEN_ONE_FILE_CLICK));
					break;
				case "Save":
					Global.getInstance().viewContainer.dispatchEvent(new CustomEvent(CustomEvent.SAVE_FILE));
					break;
				case "Exit":
					NativeApplication.nativeApplication.icon.bitmaps = [];
					NativeApplication.nativeApplication.exit();
					break;
			}
		}

		private function intiMenu():void
		{
			_menu = new Menu("UIConfig.xml");
		}
	}
}
