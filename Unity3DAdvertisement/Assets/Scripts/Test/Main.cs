using UnityEngine;
using System.Collections;



public class Main : MonoBehaviour
{
	// init
	void Start () {
	    WapsUnitySDK.init();
	}
	
	private string point = "point";
    void OnGUI()
	{	
		//GUI.Box (new Rect(20,0,280,430), null);   
		GUI.Label(new Rect(30,0,240,40), point);
		if (GUI.Button (new Rect(30,30,260,40), "show Offer"))
		{   
			WapsUnitySDK.offerShowAction(); 
		}  
		if (GUI.Button (new Rect(30,80,260,40), "show PopAd"))
		{   
			WapsUnitySDK.popShowAction(); 
		}
		if (GUI.Button (new Rect(30,120,260,40), "show banner"))
		{   
			WapsUnitySDK.showBanner ();
		}
		if (GUI.Button (new Rect(30,160,260,40), "close banner"))
		{   
			WapsUnitySDK.closeBanner ();
		}
		if (GUI.Button (new Rect(30,200,260,40), "getPoints"))
		{   
			WapsUnitySDK.getPointsAction(); 
		}
		if (GUI.Button (new Rect(30,240,260,40), "Points +10"))
		{   
			WapsUnitySDK.awardPointsAction(); 
		}
		if (GUI.Button (new Rect(30,280,260,40), "Points -10"))
		{   
			WapsUnitySDK.spendPointsAction(); 
		}
		if (GUI.Button (new Rect(30,320,260,40), "show FeedBack"))
		{   
			WapsUnitySDK.showFeedBack(); 
		}
    }
	
	void updatePoints(string str){
		this.point=str;
	}
}
