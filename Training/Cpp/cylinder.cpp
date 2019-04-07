/*
	File name : cylinder.cpp
	Author	  : Uthara keerthan R
	Date      : 24/7/15
	purpose   : To create an object cylinder with its attributes and behaviours.
*/
#include<iostream>

using namespace std;

class cylinder
{
	private:
		
	float radius;
	float height;
	float surface_area;
	float volume;

	public:
	
	void setradius(float r){radius=r;}
	void setheight(float h){height=h;}
	void fnarea()
	{
		surface_area= 2*3.1456*radius*(height+radius);
	} 
	void fnvolume()
	{
		volume=3.1456*radius*radius*height;
	}
	
	float getradius(){return radius;}
	float getheight(){return height;}
	float getsurfacearea(){return surface_area;}
	float getvolume(){return volume;}
};

main()
{
	float h,r;

	cylinder obj;

	cout<<"Enter the radius"<<endl;
	cin>>r;
	cout<<"Enter the height"<<endl;
	cin>>h;

	obj.setradius(r);
	obj.setheight(h);

//	obj.setradius(5.00);
//	obj.setheight(10.00);

	obj.fnarea();
	obj.fnvolume();

	cout<<"radius is"<<obj.getradius()<<endl;
	cout<<"height is"<<obj.getheight()<<endl;
	cout<<"surfacearea is"<<obj.getsurfacearea()<<endl;
	cout<<"volume is"<<obj.getvolume()<<endl;
}
