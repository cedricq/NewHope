#include "gtest/gtest.h"
#include "gmock/gmock.h"

#include <MyClass.hpp>

class MyClassTests : public testing::Test
{
public:
    MyClassTests() ;

    void SetUp()
    {
    }

    void TearDown()
    {
    }

};

MyClassTests::MyClassTests()
{

}

TEST_F(MyClassTests, testGetValue)
{
    MyClass testObj(2) ;
    ASSERT_EQ(2,testObj.GetValue()) ;
}

