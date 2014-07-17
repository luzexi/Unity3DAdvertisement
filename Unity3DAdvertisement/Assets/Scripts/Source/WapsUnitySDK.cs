using UnityEngine;
using System.Runtime.InteropServices;

public class WapsUnitySDK {
	[DllImport("__Internal")]
    private static extern void _connectInit ();
	public static void init()  
     {  
          
        if (Application.platform != RuntimePlatform.OSXEditor)   
        {  
			
            _connectInit();
        }  
     }  
	

	[DllImport("__Internal")]
    private static extern void _adShow ();  
       
     public static void adShowAction()  
     {  
          
        if (Application.platform != RuntimePlatform.OSXEditor)   
        {  
			
            _adShow ();
        }  
     } 
	
	[DllImport("__Internal")]
    private static extern void _popShow ();  
       
     public static void popShowAction()  
     {  
          
        if (Application.platform != RuntimePlatform.OSXEditor)   
        {  
			
            _popShow ();
        }  
     } 
	
    [DllImport("__Internal")]  
    private static extern void _offerShow ();  
       
     public static void offerShowAction ()
     {  
        if (Application.platform != RuntimePlatform.OSXEditor)   
        {  
            _offerShow ();  
        }  
     }  
	
	[DllImport("__Internal")]  
    private static extern void _getPoints ();  
       
     public static void getPointsAction ()
     {  
        if (Application.platform != RuntimePlatform.OSXEditor)   
        {  
            _getPoints ();
        }  
     } 
	
	[DllImport("__Internal")]  
    private static extern void _awardPoints ();  
       
     public static void awardPointsAction ()
     {  
        if (Application.platform != RuntimePlatform.OSXEditor)   
        {  
            _awardPoints();
        }  
     } 
	
	[DllImport("__Internal")]  
    private static extern void _spendPoints ();  
       
     public static void spendPointsAction ()
     {  
        if (Application.platform != RuntimePlatform.OSXEditor)   
        {  
            _spendPoints();
        }  
     } 

	[DllImport("__Internal")]  
	private static extern void _bannerShow ();  
	
	public static void showBanner ()
	{  
		if (Application.platform != RuntimePlatform.OSXEditor)   
		{  
			_bannerShow ();
		}  
	} 

	[DllImport("__Internal")]  
	private static extern void _bannerClose ();  
	
	public static void closeBanner ()
	{  
		if (Application.platform != RuntimePlatform.OSXEditor)   
		{  
			_bannerClose ();
		}  
	} 

	[DllImport("__Internal")]  
	private static extern void _showFeedBack ();  
	
	public static void showFeedBack ()
	{  
		if (Application.platform != RuntimePlatform.OSXEditor)   
		{  
			_showFeedBack ();
		}  
	} 
}
