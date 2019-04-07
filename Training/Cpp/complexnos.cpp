/*
	File name : cylinder.cpp
	Author	  : Uthara keerthan R
	Date      : 24/7/15
	purpose   : To create an object cylinder with its attributes and behaviours.
*/
#include<iostream>

using namespace std;

class Complex
{
	private:

	float real;
	float Complex;

	public:

	void setreal(float r)
	{	
		real=r;
	}

	void setcomplex(float c)
	{
		Complex=c;
	}

	float getreal()
	{
		return real;
	}

	float getcomplex()
	{
		return Complex;
	}
};

main()
{
	Complex obj;
	float r,c;

	cout<<" Enter the real part of the complex number:"<<endl;
	cin>>r;
	cout<<" Enter the complex part of the complex number:"<<endl;
	cin>>c;

	obj.setreal(r);
	obj.setcomplex(c);

	cout<<" The number is"<<obj.getreal()<<"+i"<<obj.getcomplex()<<endl;

}	
