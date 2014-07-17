using UnityEngine;
using System.Collections;



public class Main : MonoBehaviour
{
	// init
	void Start () {
		WapsUnitySDK.sInstance.init();
	}
	
	private string point = "point: ";
    void OnGUI()
	{	
		//GUI.Box (new Rect(20,0,280,430), null);   
		GUI.Label(new Rect(30,0,240,40), point + WapsUnitySDK.sInstance.point);
		if (GUI.Button (new Rect(30,30,260,40), "show Offer"))
		{   
			WapsUnitySDK.sInstance.offerShowAction(); 
		}  
		if (GUI.Button (new Rect(30,80,260,40), "show PopAd"))
		{   
			WapsUnitySDK.sInstance.popShowAction(); 
		}
		if (GUI.Button (new Rect(30,120,260,40), "show banner"))
		{   
			WapsUnitySDK.sInstance.showBanner ();
		}
		if (GUI.Button (new Rect(30,160,260,40), "close banner"))
		{   
			WapsUnitySDK.sInstance.closeBanner ();
		}
		if (GUI.Button (new Rect(30,200,260,40), "getPoints"))
		{   
			WapsUnitySDK.sInstance.getPointsAction(); 
		}
		if (GUI.Button (new Rect(30,240,260,40), "Points +10"))
		{   
			WapsUnitySDK.sInstance.awardPointsAction(); 
		}
		if (GUI.Button (new Rect(30,280,260,40), "Points -10"))
		{   
			WapsUnitySDK.sInstance.spendPointsAction(); 
		}
		if (GUI.Button (new Rect(30,320,260,40), "show FeedBack"))
		{   
			WapsUnitySDK.sInstance.showFeedBack(); 
		}
    }
}
