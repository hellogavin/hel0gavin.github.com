package com.component
{
	/**
	 * <p>Description: </p>
	 * <ul>
	 * <li>Created time：2013-6-25 下午4:33:47 </li>
	 * <li>Version 1.0.0</li>
	 * <li>E-mail: hellogavin1988#gmail.com</li>
	 * </ul>
	 * @author zhengxuesong
	 * */ 
	import flash.display.DisplayObject;
	import flash.display.SimpleButton;
	
	public class Button extends SimpleButton
	{
		public function Button(upState:DisplayObject=null, overState:DisplayObject=null, downState:DisplayObject=null, hitTestState:DisplayObject=null)
		{
			super(upState, overState, downState, hitTestState);
		}
	}
} 