#include "MyClass.hpp"

int MyClass::GetValue() const
{
    return m_value ;
}

MyClass::MyClass (const MyClass& t)
{
    m_value = t.GetValue() ;
}
