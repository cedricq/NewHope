#pragma once

class MyClass
{
    public :
    MyClass (int value) :
    		m_value(value)
    		{
    		}
    	int GetValue() const;
    	
    	// Copy constructor
    	MyClass (const MyClass& t) ;
    private :
    	int m_value ;

};

