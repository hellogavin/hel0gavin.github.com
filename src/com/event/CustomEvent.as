package com.event
{
	/**
	 * <p>Description: </p>
	 * <ul>
	 * <li>Created time：2013-6-25 下午3:31:06 </li>
	 * <li>Version 1.0.0</li>
	 * <li>E-mail: hellogavin1988#gmail.com</li>
	 * </ul>
	 * @author zhengxuesong
	 * */ 
	import flash.events.Event;
	
	public class CustomEvent extends Event
	{
		public static const SELECT_ITEM:String="selectItem";
		
		public static const CREATE_MENU_FINISH:String="finistCreate";
		
		public static const LOADED_FILE:String="loadedFile";
		
		public static const OPEN_ONE_FILE_CLICK:String="openOneFileClick";
		
		public static const SAVE_FILE:String="saveFile";
		public function CustomEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
} 