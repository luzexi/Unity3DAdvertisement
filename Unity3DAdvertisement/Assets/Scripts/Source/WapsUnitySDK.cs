using UnityEngine;
using System.Runtime.InteropServices;


//	WapsUnitySDK.cs
//	Author: Lu zexi
//	2014-07-17


public class WapsUnitySDK : MonoBehaviour
{
	public int point
	{
		get;
		set;
	}

	private static WapsUnitySDK s_cInstance;
	public static WapsUnitySDK sInstance
	{
		get
		{
			if(s_cInstance==null)
			{
				GameObject obj = new GameObject("WapsUnitySDK");
				s_cInstance = obj.AddComponent<WapsUnitySDK>();
			}
			return s_cInstance;
		}
	}

	void updatePoints(string str){
		this.point=int.Parse(str);
	}

	void OnDestroy()
	{
		s_cInstance = null;
	}

	[DllImport("__Internal")]
    private static extern void _connectInit ();
	public void init()  
     {  
          
        if (Application.platform != RuntimePlatform.OSXEditor)   
        {  
			
            _connectInit();
        }  
     }  
	

	[DllImport("__Internal")]
    private static extern void _adShow ();  
       
     public void adShowAction()  
     {  
          
        if (Application.platform != RuntimePlatform.OSXEditor)   
        {  
			
            _adShow ();
        }  
     } 
	
	[DllImport("__Internal")]
    private static extern void _popShow ();  
       
     public void popShowAction()  
     {  
          
        if (Application.platform != RuntimePlatform.OSXEditor)   
        {  
			
            _popShow ();
        }  
     } 
	
    [DllImport("__Internal")]  
    private static extern void _offerShow ();  
       
     public void offerShowAction ()
     {  
        if (Application.platform != RuntimePlatform.OSXEditor)   
        {  
            _offerShow ();  
        }  
     }  
	
	[DllImport("__Internal")]  
    private static extern void _getPoints ();  
       
     public void getPointsAction ()
     {  
        if (Application.platform != RuntimePlatform.OSXEditor)   
        {  
            _getPoints ();
        }  
     } 
	
	[DllImport("__Internal")]  
    private static extern void _awardPoints ();  
       
     public void awardPointsAction ()
     {  
        if (Application.platform != RuntimePlatform.OSXEditor)   
        {  
            _awardPoints();
        }  
     } 
	
	[DllImport("__Internal")]  
    private static extern void _spendPoints ();  
       
     public void spendPointsAction ()
     {  
        if (Application.platform != RuntimePlatform.OSXEditor)   
        {  
            _spendPoints();
        }  
     } 

	[DllImport("__Internal")]  
	private static extern void _bannerShow ();  
	
	public void showBanner ()
	{  
		if (Application.platform != RuntimePlatform.OSXEditor)   
		{  
			_bannerShow ();
		}  
	} 

	[DllImport("__Internal")]  
	private static extern void _bannerClose ();  
	
	public void closeBanner ()
	{  
		if (Application.platform != RuntimePlatform.OSXEditor)   
		{  
			_bannerClose ();
		}  
	} 

	[DllImport("__Internal")]  
	private static extern void _showFeedBack ();  
	
	public void showFeedBack ()
	{  
		if (Application.platform != RuntimePlatform.OSXEditor)   
		{  
			_showFeedBack ();
		}  
	} 
}
