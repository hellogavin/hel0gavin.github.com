package
{
	import com.Layers;
	import com.container.ViewContainer;
	import com.handlers.FileHandler;
	import com.view.menu.InitFace;
	import com.view.menu.TopMenu;
	
	import flash.filesystem.File;

	/**
	 * <p>Description: </p>
	 * <ul>
	 * <li>Created time：2013-6-26 下午2:57:06 </li>
	 * <li>Version 1.0.0</li>
	 * <li>E-mail: hellogavin1988#gmail.com</li>
	 * </ul>
	 * @author zhengxuesong
	 * */
	public class Global
	{
		private static var _instance:Global;
		private var _viewContainer:ViewContainer;
		private var _file:FileHandler;

		public function Global()
		{
		}
		
		public function initGlobal():void
		{
			_viewContainer=new ViewContainer();
			_file=new FileHandler();
			_file.register();
		}
		
		public static function getInstance():Global
		{
			return _instance || (_instance = new Global);
		}

		public function get viewContainer():ViewContainer
		{
			return _viewContainer;
		}
		
		public function get file():FileHandler
		{
			return _file;
		}
	}
}
